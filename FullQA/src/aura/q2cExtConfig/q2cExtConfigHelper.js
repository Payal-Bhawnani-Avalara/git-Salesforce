/**------------------------------------------------------------------------+
 Original Shift(developer@originalshift.com)
 Purpose: Helper of q2cExtConfig component, communicates with server and provides
 data to the controller.

 Details: - Processes the incoming JSON in the variables.
 - Retrieves Feature data based on the name of the Feature.
 - Retrieves records from database based on Feature custom field configuration.
 - Creates and pushes JSON back to VF page easyXDM broadcast.

 History:
 Aug 19/19 - Original Shift - Initial Implementation
 ------------------------------------------------------------------------+*/
({
    /**
     * Method called by controller to send data back through the ConfigEvent to broadcast via easyXDM.
     * Updates the configData JSON with selected options.
     */
    sendConfigData: function (component, event, helper) {
        // Get the configuration data string
        let configObj = component.get('v.configObj');

        // Log it to the console
        console.log("Configuration Data in Lightning Component: ");

        let tableData = component.get('v.tableData');
        let tableSelection = component.get('v.selection');
        let tableOptions = component.get('v.tableOptions');
        let feature = component.get('v.feature');

        //Create a map of options with a key of the product Id they represent
        let productToOption = new Map();
        tableOptions.forEach(function (tOption) {
            productToOption.set(tOption.SBQQ__OptionalSKU__c, tOption);
        });

        //Get existing selected and unselected options from the bundle
        let options = configObj.product.optionConfigurations[feature.Name];

        //Loop over existing options and add them to the new options array if they've been configured
        //Need in order to not loose quote line configuration data stored with existing options
        let optionArray = [];
        options.forEach(function (option) {
            if (option.selected === true) {
                let key = '';
                if (option.readOnly.hasOwnProperty('line') || option.configurationData[feature.External_Config_Target_Field__c]) {
                    key = (option.readOnly.line[feature.External_Config_Target_Field__c] === undefined) ?
                        option.configurationData[feature.External_Config_Target_Field__c] :
                        option.readOnly.line[feature.External_Config_Target_Field__c];
                }
                if (tableSelection.includes(key)) {
                    option.index = optionArray.length;
                    optionArray.push(option);
                    let index = tableSelection.indexOf(key);
                    //Remove previously selected option from array of selections to be added
                    if (index > -1) {
                        tableSelection.splice(index, 1);
                    }
                }
            }
        });

        //For each selected item create a new option and add it the option array
        tableSelection.forEach(function (selection) {
            let record = {};
            tableData.forEach(function (tableRecord) {
                if (tableRecord.Id === selection) {
                    record = tableRecord;
                }
            });
            let selectionProductId = record[feature.External_Config_Product_Field__c];
            let optionId = productToOption.get(selectionProductId).Id;
            let targetField = feature.External_Config_Target_Field__c;
            let recordId = selection;
            let name = productToOption.get(selectionProductId).SBQQ__OptionalSKU__r.Name; //record['Name'];
            let productCode = productToOption.get(selectionProductId).SBQQ__OptionalSKU__r.ProductCode;
            let index = optionArray.length;
            let newOption = helper.createOption(optionId, targetField, recordId, name, productCode, index);
            optionArray.push(newOption);
        });

        //Add unselected options to the end of the options array
        //Removed as unselected options aren't needed when pushing back
        /*options.forEach(function (option) {
            if (option.selected === false) {
                option.index = optionArray.length;
                optionArray.push(option);
            } else {
                let key = '';
                if (option.readOnly.hasOwnProperty('line') || option.configurationData[feature.External_Config_Target_Field__c]) {
                    key = (option.readOnly.line[feature.External_Config_Target_Field__c] === undefined) ?
                        option.configurationData[feature.External_Config_Target_Field__c] :
                        option.readOnly.line[feature.External_Config_Target_Field__c];
                }
                option.selected = false;
                option.index = optionArray.length;
                optionArray.push(option);
                let index = tableSelection.indexOf(key);
                if (index > -1) {
                    tableSelection.splice(index, 1);
                }
            }
        });*/

        configObj.product.optionConfigurations[feature.Name] = optionArray;
        configObj.redirect.save = true;
        //Get the update configuration event
        //Set the config data and fire the event
        //let configData = component.get('v.configData');
        component.set('v.configData', JSON.stringify(configObj));
        let configData = JSON.stringify(configObj);
        let updateEvent = $A.get("e.c:ConfigEvent");
        updateEvent.setParams({configData: configData}).fire();
    },

    /**
     * Method called by controller on init to find and return the feature the Ext Config is supporting.
     * Calls the APEX controller.
     */
    getFeature: function (component) {
        return new Promise(function (resolve, reject) {
            let configData = component.get('v.configData');
            let configObj = JSON.parse(configData);
            let bundleId = configObj.product.configuredProductId;
            let action = component.get('c.getFeature');
            action.setParams({
                'bundleId': bundleId
            });
            console.log("Getting Feature Data");
            action.setCallback(this, function (response) {
                if (response.getState() === 'SUCCESS') {
                    let feature = response.getReturnValue();
                    resolve(feature);
                } else {
                    reject();
                }
            });
            $A.enqueueAction(action);
        })
    },

    /**
     * Method called by controller on init to get the records defined by the feature the Ext Config is supporting.
     * Calls the APEX controller.
     */
    getRecords: function (component, helper) {
        return new Promise(function (resolve, reject) {
            let feature = component.get('v.feature');
            let action = component.get('c.getRecords');
            helper.readConfig(component, helper);
            let selected = component.get('v.selection');
            action.setParams({
                'feature': feature,
                'selected': selected
            });
            console.log("Getting Records");
            action.setCallback(this, function (response) {
                if (response.getState() === 'SUCCESS') {
                    const rtnValue = response.getReturnValue();
                    resolve(rtnValue);
                } else {
                    reject();
                }
            });
            $A.enqueueAction(action);
        })
    },

    /**
     * Method called by controller on init to parse the JSON into discrete objects and find the already selected options.
     */
    readConfig: function (component) {
        console.log('Reading config');
        let configData = component.get('v.configData');
        let configObj = JSON.parse(configData);
        component.set('v.configObj', configObj);
        let feature = component.get('v.feature');
        let options = configObj.product.optionConfigurations[feature.Name];
        let selectedOptions = new Map();
        //Get the options that are already selected and add them to the selected list to be displayed in the table
        options.forEach(function (option) {
            if (option.selected === true) {
                if (option.configurationData.hasOwnProperty(feature.External_Config_Target_Field__c)) {
                    let optionKey = option.configurationData[feature.External_Config_Target_Field__c];
                    selectedOptions.set(optionKey, option);
                } else if (option.readOnly.hasOwnProperty('line')) {
                    if (option.readOnly.line.hasOwnProperty(feature.External_Config_Target_Field__c)) {
                        if (option.readOnly.line[feature.External_Config_Target_Field__c] !== null) {
                            let optionKey = option.readOnly.line[feature.External_Config_Target_Field__c];
                            selectedOptions.set(optionKey, option);
                        }
                    }
                }
            }
        });
        let optionKeys = Array.from(selectedOptions.keys());
        component.set('v.selection', optionKeys);
    },

    /**
     * Constructor to create new product option for use in the returned JSON.
     */
    createOption: function (optionId, configField, configValue, name, productCode, index) {
        // create the new option
        let optData = {
            "optionId": optionId,
            "selected": true,
            "ProductCode": productCode,
            "ProductName": name,
            "Quantity": 1,
            "index": index,
            "readOnly": {},
            configurationData: {
                [configField]: configValue
            }
        };
        return (optData);
    }
})