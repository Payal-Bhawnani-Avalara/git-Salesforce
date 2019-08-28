/**------------------------------------------------------------------------+
 Original Shift(developer@originalshift.com)
 Purpose: Controller of q2cExtConfig component, communicates with helper and sets
 data on the component.

 Details: - Handles the initialization of the component.
 - Handles the saving of the configuration.
 - Handles when displayed records are checked and unchecked.

 History:
 Aug 19/19 - Original Shift - Initial Implementation
 ------------------------------------------------------------------------+*/
({
    /**
     * Method called by component when first initialized.
     * Calls helpers to get the feature being supported, the data defined in the feature, and sets up the DataTable
     */
    doInit: function (component, event, helper) {
        console.log('Doing init');
        //Fetch the Feature from the APEX controller
        helper.getFeature(component)
            .then($A.getCallback(function (feature) {
                component.set('v.feature', feature);
                //Fetch the records based on the Feature from the APEX controller
                helper.getRecords(component, helper)
                    .then($A.getCallback(function (rtnValue) {
                        component.set("v.tableColumns", rtnValue.tableColumn);
                        component.set("v.tableData", rtnValue.tableRecord);
                        component.set("v.tableOptions", rtnValue.tableOptions);
                        component.set("v.tableRows", rtnValue.tableRows);
                        //Setup the DataTable, delay is to wait for iterates to populate table
                        setTimeout(function () {
                            let table = $('#tableId').DataTable({
                                select: true,
                                order: [[1, "asc"]],
                                columnDefs: [
                                    {orderable: false, targets: 0},
                                    {searchable: false, targets: 0}
                                ],
                                dom: 't<"bottom"ip>'
                            });
                            // add lightning class to search filter field with some bottom margin..
                            $('div.dataTables_filter input').addClass('slds-input');
                            $('div.dataTables_filter input').css("marginBottom", "10px");
                            $('#tableSearch').keyup(function () {
                                table.search($(this).val()).draw();
                            });
                        }, 400);
                    }));
            }));
    },

    /**
     * Method called by from component button to save configuration and broadcast back to Salesforce CPQ.
     */
    handleConfigSave: function (component, event, helper) {
        helper.sendConfigData(component, event, helper);
    },

    /**
     * Method called when first loading page to show the spinner.
     */
    waiting: function (component, event, helper) {
        component.set("v.HideSpinner", true);
    },

    /**
     * Method called when done loading page to hide the spinner.
     */
    doneWaiting: function (component, event, helper) {
        component.set("v.HideSpinner", false);
    },

    /**
     * Method called onchange of table checkboxes to add/remove row Id to selected array and update CSS to show checkbox
     * and row highlighting.
     */
    checkChange: function (component, event) {
        let eventValue = event.target.value;
        let checked = event.target.checked;
        let elements = component.find('tableCheckbox');
        let tableSelection = component.get("v.selection");
        for (let i = 0; i < elements.length; i++) {
            let val = elements[i].getElement().getAttribute('value');
            if (val === eventValue && checked === false) {
                $A.util.removeClass(event.target.parentElement.parentElement.parentElement, 'slds-is-selected');
                event.target.parentElement.parentElement.parentElement.setAttribute('aria-selected', 'false');
                event.target.setAttribute('checked', 'false');
                let index = tableSelection.indexOf(eventValue);
                if (index > -1) {
                    tableSelection.splice(index, 1);
                }
            } else if (val === eventValue && checked === true) {
                $A.util.addClass(event.target.parentElement.parentElement.parentElement, 'slds-is-selected');
                event.target.parentElement.parentElement.parentElement.setAttribute('aria-selected', 'true');
                event.target.setAttribute('checked', 'true');
                tableSelection.push(eventValue);
            }
        }
        component.set('v.selection', tableSelection);
    }
})