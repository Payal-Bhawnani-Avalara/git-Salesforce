public with sharing class activePartnerLocations {
     // ApexPages.StandardSetController must be instantiated 
      // for standard list controllers 
    public activePartnerLocations(){}
  /*  public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
            	 String partnertypefilter = ApexPages.currentPage().getParameters().get('type');
            	if ( partnertypefilter=='s')
            	{
	                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
	                      [select id,name,latitude__c, longitude__c, type__c,ConnectorCertificationDate__c,ConnectorName__c,ConnectorStatus__c  from Account where ActivePartner__c=TRUE and Type__c='Solutions Partner' and latitude__c != null]));
	            }
	          	else if ( partnertypefilter=='c')
            	{
	                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
	                      [select id,name,latitude__c, longitude__c, type__c,ConnectorCertificationDate__c,ConnectorName__c,ConnectorStatus__c  from Account where ActivePartner__c=TRUE and Type__c='Channel Partner' and latitude__c != null]));
	            }
	          	else if ( partnertypefilter=='o')
            	{
	                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
	                      [select id,name,latitude__c, longitude__c, type__c,ConnectorCertificationDate__c,ConnectorName__c,ConnectorStatus__c  from Account where ActivePartner__c=TRUE and Type__c<>'Channel Partner' and Type__c<>'Solutions Partner' and latitude__c != null]));
	            }

	            else
            	{
	                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
	                      [select id,name,latitude__c, longitude__c, type__c,ConnectorCertificationDate__c,ConnectorName__c,ConnectorStatus__c  from Account where ActivePartner__c=TRUE and latitude__c != null]));
	            }
	            
            }
            setCon.setPageSize(2000);
            return setCon;
        }
        set;
    }

    // Initialize setCon and return a list of records 
    
    public List<Account> getAccounts() {
         return (List<Account>) setCon.getRecords();
    }*/

}

/*
<apex:page controller="activePartnerLocations">
   <div id="gloveMap" style="height: 800px; width: 1024px; display: block;" ></div>
      <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false">
    </script>
       <script type="text/javascript">
      function mapIt(){

            var latlng = new google.maps.LatLng(39.8, -98.5);
      var myOptions = {
            zoom: 4,
                  center: latlng,
                  mapTypeId: google.maps.MapTypeId.ROADMAP,
            }
            var map = new google.maps.Map(document.getElementById('gloveMap'), myOptions);
            setMarkers(map, places);
      }

      var places = [];
      </script>

<script type="text/javascript">    
        <apex:repeat value="{!accounts}" var="a">
            <apex:outputText escape="true"  value="places.push(['"/> 
            <apex:outputText value="{0}">
                <apex:param value="{!SUBSTITUTE(SUBSTITUTE(a.name, "'", '' ),'&','')}"/>
            </apex:outputText>
             <apex:outputText escape="true"  value="','"/>
            <apex:outputText value="{0}">
                <apex:param value="{!SUBSTITUTE(SUBSTITUTE(a.Type__c, "'", '' ),'&','')}"/>
            </apex:outputText>
             <apex:outputText escape="true"  value="','"/>
            <apex:outputText value="{0}">
                <apex:param value="{!SUBSTITUTE(SUBSTITUTE(a.ConnectorStatus__c, "'", '' ),'&','')}"/>
            </apex:outputText>
            <apex:outputText escape="true"  value="','"/>
            <apex:outputText value="{0}">
                <apex:param value="{!a.Id}"/>
            </apex:outputText>
             <apex:outputText escape="true"  value="','"/>
            <apex:outputText value="{0,date,MM/dd/yyyy}">
                <apex:param value="{!a.ConnectorCertificationDate__c}"/>
            </apex:outputText>
             <apex:outputText escape="true"  value="',"/>
            <apex:outputText escape="true"  value="{!a.Latitude__c}"/>
            <apex:outputText escape="true"  value=","/>            
            <apex:outputText escape="true"  value="{!a.Longitude__c}"/>
            <apex:outputText escape="true"  value="]);"/> 
        </apex:repeat>
</script>
      
<script type="text/javascript">
      var infowindow;
      
       var pinColor = "FF9933";
    var pinOrangeImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
        new google.maps.Size(21, 34),
        new google.maps.Point(0,0),
        new google.maps.Point(10, 34));
    var pinOrangeShadow = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
        new google.maps.Size(40, 37),
        new google.maps.Point(0, 0),
        new google.maps.Point(12, 35));
      
        pinColor = "66CC33";
    var pinPalmImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
        new google.maps.Size(21, 34),
        new google.maps.Point(0,0),
        new google.maps.Point(10, 34));
    var pinPalmShadow = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
        new google.maps.Size(40, 37),
        new google.maps.Point(0, 0),
        new google.maps.Point(12, 35));
        
        pinColor = "CCCCCC";
    var pinCirrusImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
        new google.maps.Size(21, 34),
        new google.maps.Point(0,0),
        new google.maps.Point(10, 34));
    var pinCirrusShadow = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
        new google.maps.Size(40, 37),
        new google.maps.Point(0, 0),
        new google.maps.Point(12, 35));
      
      function setMarkers(map, locations) {
      

            for (var i = 0; i < places.length; i++) {
                  var myLatLng = new google.maps.LatLng(locations[i][5], locations[i][6]);
                 
                 if(locations[i][1]=='Solutions Partner')
                 {
                  var marker = new google.maps.Marker({
                        position: myLatLng,
                        map: map,   
                        title: locations[i][0],
                        icon: pinPalmImage,
                        shadow: pinPalmShadow
                        
                  });
                 
                 }
                 else if (locations[i][1]=='Channel Partner')
                 {
                  var marker = new google.maps.Marker({
                        position: myLatLng,
                        map: map,   
                        title: locations[i][0],
                        icon: pinOrangeImage,
                        shadow: pinOrangeShadow
                  });
 
                 }
                 else
                 {
                  var marker = new google.maps.Marker({
                        position: myLatLng,
                        map: map,   
                        title: locations[i][0],
                        icon: pinCirrusImage,
                        shadow: pinCirrusShadow
                        
                  });
                  }
                  
                  
                  
                  (function(i, marker) {
                        google.maps.event.addListener(marker,'click',function() {
                              if (!infowindow) {
                                    infowindow = new google.maps.InfoWindow();
                              }
                              var contentString;
                              if (locations[i][1]=='Solutions Partner')
                                contentString = "<b><a href='/"+locations[i][3]+"'>"+locations[i][0]+"</a></b><br/>"+locations[i][1]+"</b><br/>"+locations[i][2]+" : "+locations[i][4];
                              else
                                contentString = "<b><a href='/"+locations[i][3]+"'>"+locations[i][0]+"</a></b><br/>"+locations[i][1];
                              infowindow.setContent(contentString);
                        infowindow.open(map, marker);
                        });
                  })(i, marker);
            }
      };
      mapIt();
    </script>
</apex:page>
*/