.leanDataButton{
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	border:1px solid #0b0e07;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:arial;
	font-size:12px;
	padding:5px 12px;
	text-decoration:none !important;
	margin-right: 5px;
}
.blueButton {
	background-color:#0088cc;
	text-shadow:0px 1px 0px #263666;
	-moz-box-shadow:inset 0px -3px 7px 0px #0088cc;
	-webkit-box-shadow:inset 0px -3px 7px 0px #0088cc;
	box-shadow:inset 0px -3px 7px 0px #0088cc;
}
.blueButton:hover {
	background-color:#0688fa;
	color:white;	
}
.blueButton:active {
	position:relative;
	top:1px;
}
.greenButton {
	background-color:#90bc00;
	text-shadow:0px 1px 0px #2f6627;	
	-moz-box-shadow:inset 0px -3px 7px 0px #90bc00;
	-webkit-box-shadow:inset 0px -3px 7px 0px #90bc00;
	box-shadow:inset 0px -3px 7px 0px #90bc00;	
}
.greenButton:hover {
	background-color:#5cbf2a;
	color:white;	
}
.greenButton:active {
	position:relative;
	top:1px;
}
.orangeButton {
	background-color:#ffa600;
	text-shadow:0px 1px 0px #2f6627;
	-moz-box-shadow:inset 0px -3px 7px 0px #ffa600;
	-webkit-box-shadow:inset 0px -3px 7px 0px #ffa600;
	box-shadow:inset 0px -3px 7px 0px #ffa600;
}
.orangeButton:hover {
	background-color:#ffc04a;
	color:white;
}
.orangeButton:active {
	position:relative;
	top:1px;
}
.fakeBlockTable{
    background: white;
    border: solid 1px #e0e3e5;     
    border-collapse: collapse; 
}
.fakeBlockTable .headerCell{
    background: #0088cc;
    font-weight: bold;
    border-width: 0 0 1px 1px;
    font-size: .9em;
    border-color: #ececec;
    padding : 5px 10px;    
    color:white;
}
.fakeBlockTable .normalCell{
    border : 1px solid #ededed;
    border-width : 0 0 1px 0;
    vertical-align : middle;
    border-color: #ececec;
    font-size: .9em;
    padding : 5px 10px;
}
.statsTable{
        background: white;
        border: solid 1px gray;     
        border-collapse: collapse;   
}
.statsHeader{
    color: white;
}
.statsTable .statsHeader{
    background: #0088cc;
    padding: 5px;
    color:white;
	text-shadow:0px 1px 0px #263666;    
}
.statsTable tr td{
    border: solid 1px gray;   
    padding: 5px;     
}
.sectionHeader{
    background: #0088cc;
    color:white;
    height:25px;
    width:100%;
    font-weight:bold;
    font-size:110%;
    padding-left:10px;
    display: table; 
    overflow: hidden;
    vertical-align: center;
    margin-bottom:5px;
    margin-top:5px;
    text-shadow:0px 1px 0px #2f6627;
}
.centerSectionHeader{
    display: table-cell; 
    vertical-align: middle;
}
.dataTables_length,
   .dataTables_filter {
      margin-bottom: 10px;
   }

.dataTables_filter {    
float: left !important;
   margin-left: 30px;
}

.paginated {
   min-width: 1200px;
}

.dataTables_paginate .paginate_button, .dataTables_wrapper .dataTables_scroll{
   padding: 0.1em 1em !important;
}


//NEW STUFF FROM OVERLORD BELOW
/***************************************
****************************************
GLOBAL COLOR VARIABLES
****************************************
***************************************/

:root{
    /*colors*/
    --teal: #1abc9c;
    --lt-grey-1: #F8F8F8;
    --lt-grey-2: #E6E6E6;
    --med-grey-1: #B3B3B3;
    --med-grey-2: #808080;
    --dk-grey-1: #666666;
    --dk-grey-2: #4D4D4D;
    --white: #FFFFFF;
    --ld-blue: #1B527F;
    --ld-green: #65D2BD;
    --ld-lt-green-1: #D8F4EE;
    --ld-lt-green-2: #B2E8DE;
    /*font weight*/
    --light: 300;
    --regular: 400;
    --semi-bold: 600; 
    --bold: 700;
}

*{
    font-family: 'Open Sans', sans-serif !important;
}

/*All colors are !important to guarantee its this color */
.teal { color: var(--teal) !important; }
.lt-grey-1 { color: var(--lt-grey-1) !important; }
.lt-grey-2 { color: var(--lt-grey-2) !important; }
.med-grey-1 { color: var(--med-grey-1) !important; }
.med-grey-2 { color: var(--med-grey-2) !important; }
.dk-grey-1 { color: var(--dk-grey-1) !important; }
.dk-grey-2 { color: var(--dk-grey-2) !important; }
.white { color: var(--white) !important; }
.ld-blue { color: var(--ld-blue) !important; }
.ld-green { color: var(--ld-green) !important; }
.ld-lt-green-1 { color: var(--ld-lt-green-1) !important; }
.ld-lt-green-2 { color: var(--ld-lt-green-2) !important; }

.bg-teal { background-color: var(--teal) !important; }
.bg-lt-grey-1 { background-color: var(--lt-grey-1) !important; }
.bg-lt-grey-2 { background-color: var(--lt-grey-2) !important; }
.bg-med-grey-1 { background-color: var(--med-grey-1) !important; }
.bg-med-grey-2 { background-color: var(--med-grey-2) !important; }
.bg-dk-grey-1 { background-color: var(--dk-grey-1) !important; }
.bg-dk-grey-2 { background-color: var(--dk-grey-2) !important; }
.bg-ld-blue { background-color: var(--ld-blue) !important; }
.bg-ld-green { background-color: var(--ld-green) !important; }
.bg-ld-lt-green-1 { background-color: var(--ld-lt-green-1) !important; }
.bg-ld-lt-green-2 { background-color: var(--ld-lt-green-2) !important; }

/*This is for overriding default SF styling*/
.bodyDiv .outerNoSidebar{
    padding-bottom: 0px;
}
.noSidebarCell{
    padding: 0px;
}


/***************************************
****************************************
General
****************************************
***************************************/



/***************************************
****************************************
BUTTONS
****************************************
***************************************/

/*primary large*/
.ld-primary-large-button{
    line-height: 30px;
    display: inline-block;
    cursor: pointer;
    border: solid thin;
    font-size: 14px;
    padding-left: 20px;
    padding-right: 20px;
    background-color: #1B527F;
    border-radius: 7px;
    vertical-align: top;
    margin-right: 5px;
}

.ld-primary-large-button.disabled,
.ld-primary-large-button.disabled:hover{
    color: var(--med-grey-1);
    border-color: #d9d9d9;
    background-color: #d9d9d9;
}

.ld-primary-large-button:hover{
    background-color: #94a7bd;
}
/*end primary large*/

/*primary small*/
.ld-primary-small-button{
    line-height: 25px;
    display: inline-block;
    cursor: pointer;
    border: solid thin;
    font-size: 12px;
    padding-left: 10px;
    padding-right: 10px;
    border: none;
    vertical-align: top;
    margin-right: 5px;
    background-color: var(--ld-green);
    color: white;
    border-radius: 3px;
}
.ld-primary-small-button:hover {
    background-color: var(--ld-lt-green-2);
    color: var(--dk-grey-2);
}

.ld-primary-small-button.disabled, 
.ld-primary-small-button.disabled:hover{
    color: var(--med-grey-1);
    border-color: #d9d9d9;
    background-color: #d9d9d9;
}

.ld-primary-small-button:hover{
    background-color: #94a7bd;
}
/*end primary small*/

/*secondary large*/
.ld-secondary-large-button{
    line-height: 30px;
    display: inline-block;
    cursor: pointer;
    border: solid thin;
    font-size: 14px;
    padding-left: 20px;
    padding-right: 20px;
    border-color: var(--lt-grey-2);
    border-radius: 7px;
    vertical-align: top;
    margin-right: 5px;
}

.ld-secondary-large-button.disabled,
.ld-secondary-large-button.disabled:hover{
    color: var(--lt-grey-2);
    border-color: #f2f2f2;
}

.ld-secondary-large-button:hover{
    background-color: var(--lt-grey-2);
}
/*end secondary large*/

/*secondary small*/
.ld-secondary-small-button{
    line-height: 25px;
    display: inline-block;
    cursor: pointer;
    border: solid thin;
    font-size: 12px;
    padding-left: 10px;
    padding-right: 10px;
    border-color: var(--lt-grey-2);
    border-radius: 5px;
    vertical-align: top;
    margin-right: 5px;
}

.ld-secondary-small-button.territory-button{
    border-radius: 3px;
    border: 0;
}

.ld-secondary-small-button.disabled,
.ld-secondary-small-button.disabled:hover{
    color: var(--lt-grey-2);
    border-color: #f2f2f2;
}

.ld-primary-small-button:hover{
    background-color: var(--ld-lt-green-2);
    color: var(--dk-grey-2);
}
.ld-secondary-small-button:hover{
    background-color: var(--lt-grey-2);
}
/*end secondary small*/

.ld-add-button{
    border: solid thin;
    padding: 0px 8px 0px 8px;
    border-style: initial;
    background-color: #a6a6a6;
    font-size: 32px;
    color: white;
    cursor: pointer;
    vertical-align: top;
}

.ld-add-button:hover{
    background-color: #737373;
}

.ld-add-button.disabled,
.ld-add-button.disabled:hover{
    background-color: var(--lt-grey-2);
}

/***************************************
****************************************
DIVS
****************************************
***************************************/


.ld-row-div{
    background-color: #cbcbcb;
    padding: 10px;
}

.ld-row-div > *:not(:last-child){
    margin-right: 10px;
}

.ld-header-message{
    background-color: #ffcc33;
    padding: 0px 20px 0px 20px;
    line-height: 45px;
    font-size: 14px;
    color: var(--dk-grey-2);
}

.ld-banner{
    /*see OverlordStyle.component*/
}

.ld-tabs-div{
    margin-top: 10px;
    margin-bottom: 20px;
}

.ld-tabs-div .ld-tab:not(:last-child){
    margin-right: 40px;
}

.ld-tab.active {
    border-bottom: 3px solid var(--ld-green);
    color: var(--dk-grey-2);
}


/***************************************
****************************************
INPUTS
****************************************
***************************************/
/* LD_MULTISELECT */

/* Overall Multiselect */

.ld-multiselect {
    width: 100%;
    border-radius: 3px;
    padding-left: 10px;
    padding-right: 10px;
    box-shadow: none;
    text-align: left;
    height: 30px;
    font-size: 12px;
    margin: 0 0 0 0;
    display: inline-block;
    font-weight: normal;
    white-space: nowrap;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    user-select: none;
    background-image: none;
    font-family: inherit;
    -webkit-appearance: button;
    text-transform: none;
    overflow: visible;
    font: inherit;
    box-sizing: border-box;
    min-width: 150px;
}

.ld-multiselect, .ld-multiselect:hover, .ld-multiselect:active, .ld-multiselect:focus {
    background-color: white;
    color: var(--med-grey-2);
    border: 1px solid var(--lt-grey-2);
}

.ld-multiselect:active, .ld-multiselect:focus{
    outline: none;
}

.ld-multiselect-wrapper {
    position: relative;
    z-index: 1000;
    
}

/* Down arrow */

.down-arrow {
    float: right;
    margin-top: 5px;
    height: 6px;
}

.pivot-table-arrow {
    width: 10px;
    margin-right: 10px;
}

/* Multiselect Item */

.ld-multiselect-item {
    box-sizing: border-box;
    white-space: nowrap;
    left: 0;
    z-index: 1000;
    margin: 0px;
    list-style: none;
    display: block;
    width: 100%;
    background-clip: padding-box;
    height: 25px;
    background-color: white;
    color: var(--dk-grey-2);
}

.ld-multiselect-item:hover {
    background-color: var(--ld-blue);
    color: white;
    cursor: pointer;
}

.ld-multiselect-item:after {
    box-sizing: border-box;
}

/* Multiselect item text */

.ld-multiselect-item-text {
    font-size: 12px;
    font-weight: normal;
    overflow: hidden;
    box-sizing: border-box;
    text-decoration: none;
    outline: 0;
    display: inline-block;
    padding: 0px 0px 3px 10px;
    clear: both;
    white-space: nowrap;
    position: relative;
    line-height: 25px;
    width: 90%;
    height: inherit;
    text-align: left;
    font-weight: normal;
    display: inline-block;
    overflow: hidden;
    transform: translate(0, -1px);
}

/* Dropdown Container */

.ld-multiselect-dropdown-container {
    background-color: white;
    border: 1px solid var(--lt-grey-2);
    border-radius: 0px;
    box-shadow: none;
    padding-top: 10px;
    padding-bottom: 10px;
    margin-top: -4px;
    box-shadow: none;
    display: none;
    z-index: 1000;
    position: absolute;
    width: 100%;
    /*visibility: collapse;
    */
}

.ld-multiselect-dropdown-container:hover {
    cursor: pointer;
}

.open > .ld-multiselect-dropdown-container {
    display: block;
}

.ld-dropdown-menu {
    padding-left: 0px;
    margin-top: 0px;
    margin-bottom: 0px;
}

/* Placeholder */

.ld-multiselect-placeholder {
    font-size: 12px;
    vertical-align: middle;
    color: var(--med-grey-1);
}

.ld-select-dropdown {

}

/* Checkbox */

.input-checkbox {
    display: inline-block;
    position: relative;
    text-align: center;
    width: 10%;
    height: 25px;
    transform: translate(5px);
    position: relative;
    margin: 0 0 0 0;
}

.input-checkbox:hover {
    cursor: pointer;
}


/* gray-input checkbox */


input[type='checkbox'] {
    width: auto;
    opacity: 0.00000001;
}

.helper {
    position: absolute;
    cursor: pointer;
    display: block;
    font-size: 16px;
    user-select: none;
    color: #e7e7e7;
}
.helper:before {
    content: '';
    position: absolute;
    margin: 4px;
    width: 12px;
    height: 12px;
    transition: transform 0.28s ease;
    border-radius: 0px;
    border: 1px solid var(--med-grey-1);
    margin-top: -23px;
    margin-right: 4px;
    margin-bottom: 4px;
    margin-left: 8px;
    background-color: white;
}

.helper:after {
  content: '';
    display: block;
    width: 10px;
    height: 4px;
    border-bottom: 2px solid white;
    border-left: 2px solid white;
    -webkit-transform: rotate(-45deg) scale(0);
    -moz-transform: rotate(-45deg) scale(0);
    -ms-transform: rotate(-45deg) scale(0);
    transform: rotate(-45deg) scale(0);
    position: absolute;
    top: 8px;
    left: 9px;
    margin-top: -28px;
}
input[type='checkbox']:checked ~ .helper::before {
    color: white;
    background-color: var(--med-grey-1);
}

input[type='checkbox']:checked ~ .helper::after {
    -webkit-transform: rotate(-45deg) scale(1);
    -moz-transform: rotate(-45deg) scale(1);
    -ms-transform: rotate(-45deg) scale(1);
    transform: rotate(-45deg) scale(1);
}
/*end ld multi select*/

.ld-select-container {
    width: 200px;
    height: 35px;
    padding: 0px 10px 0px 10px;
    overflow: hidden;
    background-color: white;
    display: inline-block;
    vertical-align: top;
}

/*background image for arrow requires copying background styling to page/component
as declaring background url will override background styling from here
*/
.ld-select-container select {
    /*see OverlordStyle.component*/
}

.ld-select-container select:focus {
    outline: none;
}

.ld-input-text{
    line-height: 35px;
    font-size: 14px;
    padding-left: 10px;
    color: var(--med-grey-1);
    border-style: initial;
    padding: 0px 0px 0px 10px;
    width: 250px;
    vertical-align: top;
}

.ld-textarea{
    line-height: 35px;
    font-size: 16px;
    padding: 0px 0px 0px 10px;
    border-style: initial;
    color: var(--med-grey-1);
    width: 700px;
    vertical-align: top;
}


/***************************************
****************************************
TABLES
****************************************
***************************************/


/* ld-table */
/* FOR DATATABLES */
/* TO APPLY SORTING ARROW STYLING, ADD THE COLUMN CLASSNAME 'ld-th' TO ALL COLUMNS*/
table.ld-table{
    margin-top: 10px;
    padding-left: 10px;
    border-collapse: collapse !important;
    table-layout: fixed;
    width: 1280px;
    border-left: solid 1px var(--lt-grey-1);
    border-right: solid 1px var(--lt-grey-1);
}

.ld-table th{
    padding-left: 10px;
    padding-right: 0px !important;
    height: 25px;
    color: var(--med-grey-2);
    font-size: 10px;
    font-weight: var(--regular);
    background-color: var(--white);
}

.ld-table th:first-child{
    padding-left: 20px;
}

.ld-table td{
    padding: 10px 0px 10px 10px;
    font-size: 12px;
    color: var(--dk-grey-2);
    vertical-align: top;
}

.ld-table td:first-child{
    padding: 10px 0px 10px 20px;
}

#territorySegmentTable tbody tr:not(.no-hover):hover {
    background-color: var(--ld-lt-green-1) !important;
}

.ld-table tbody tr:nth-child(odd){
    /*background-color: var(--lt-grey-1);*/
}

.ld-table tbody tr:nth-child(even) td{
    border-top: solid thin;
    border-bottom: solid thin;
    border-color: var(--lt-grey-1);
}

.ld-table tbody.hoverable tr:hover {
    background-color: var(--teal) !important;
}

.ld-table th.ld-th.sorting:hover::after{
    display: inline-block;
    right: auto;
    bottom: auto;
    margin-left: 10px;
}

.ld-table th.ld-th.sorting::after{
    display: none;
    right: auto;
    bottom: auto;
    margin-left: 10px;
}

.ld-table th.ld-th.sorting_asc::after, .ld-table th.ld-th.sorting_desc::after{
    display: inline-block;
    right: auto;
    bottom: auto;
    margin-left: 10px;
}


.ld-table td.removeButton{
    padding-right: 10px;
}

.ld-table td.removeButton a{
    display: none;
    cursor: pointer;
    text-decoration: none;
    text-align: center;
    font-size: 14px;
    padding: 5px 2px;
}


.ld-table tr:hover td.removeButton a{
    display: block;
    
}

.dataTables_info {
    color: var(--med-grey-1);
    font-size: 12px;
}

.ld-table .dataTables_wrapper .paging_simple_numbers {
    font-size: 12px;
    font-family: 'Open Sans', sans-serif;
    font-weight: var(--light);
}

.ld-table .dataTables_wrapper .paging_simple_numbers .previous.disabled, .paging_simple_numbers .next.disabled {
    color: var(--med-grey-1);
    text-decoration: none;
}

.ld-table .dataTables_wrapper .paging_simple_numbers > a:not(.disabled) {
    color: var(--ld-blue) !important;
    text-decoration: none;
}

.ld-table .dataTables_wrapper .paging_simple_numbers > a:not(.disabled):hover {
    border: 1px solid transparent !important;
    background: none !important;
    color: var(--dk-grey-2) !important;
    text-decoration: underline !important;
}

.dataTables_wrapper .paging_simple_numbers span .paginate_button.current, .dataTables_wrapper .paging_simple_numbers span .paginate_button:hover{
    border: 1px solid transparent !important;
    background: none !important;
    background-color: var(--lt-grey-2) !important;
    color: var(--med-grey-2) !important;
}

.dataTables_wrapper .paging_simple_numbers span .paginate_button {
    font-size: 12px;
}

.dataTables_wrapper .dataTable {
    border-left: 1px solid var(--lt-grey-1) !important;
    border-right: 1px solid var(--lt-grey-1) !important;
}

/* end ld-table */


/***************************************
****************************************
TABS
****************************************
***************************************/

.ld-tab{
    font-size: 14px;
    font-weight: var(--light);
    padding-bottom: 7px;
    cursor: pointer;
    display: inline-block;
    color: var(--med-grey-1);
}

.ld-tab.selected{
    border-bottom: solid 3px;
    border-color: var(--teal);
    color: var(--dk-grey-2);
}

.ld-tab:hover{
    color: var(--dk-grey-2);
}



/***************************************
****************************************
TEXT
****************************************
***************************************/

.ld-text-navigation{
    color: var(--med-grey-2);
    font-size: 12px;
    text-decoration: underline;
    display: inline-block;
}

.ld-pagination-pipe{
    margin-left: 10px;
}

.ld-text-navigation.disabled,
.ld-text-navigation.disabled:hover{
    color: var(--med-grey-2);
}

.ld-text-navigation:hover{
    color: var(--dk-grey-2);
}

.ld-large-header{
    font-size: 23px;
    font-weight: var(--bold);
}

.ld-header{
    font-size: 20px;
    font-weight: var(--bold);
    margin-top: 20px;
    display: block;
}

.ld-header h1{
    font-weight: var(--bold);
    display: inline-block;
    font-size: 20px;
}

.ld-subheader{
    font-size: 18px;
    font-weight: var(--semi-bold);
    margin-top: 20px;
    display: block;
}

.ld-subheader-2 {
    font-size: 19px;
    font-weight: var(--semi-bold);
	color: var(--dk-grey-2);
	margin-top: 10px;
}

#pivotByOwner tr,
#pivotByTerritory tr {
  border: 1px solid var(--lt-grey-1);
}

table.ld-table.territory-table,
.ld-table.territory-table table {
    border-collapse:collapse;
    table-layout:fixed;
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
    border: none;
}

.ld-table.territory-table tr:first-child {
    border-left: 0;
    border-right: 0;
}
.ld-table.territory-table th {
    padding-left: 20px;
    font-size: 12px;
    font-weight: var(--light);
    color: var(--med-grey-2);
}
.territorySegments .dataTables_scrollHead {
    background-color: var(--lt-grey-1_5);
}

.ld-table.territory-table td:first-child {
    font-weight: var(--regular);
    color: var(--dk-grey-2);
}

.ld-table.territory-table td {
    padding: 10px 0 10px 20px;
    vertical-align: middle;
    font-size: 14px;
    font-weight: var(--light);
    color: var(--dk-grey-2);
}

.ld-table .segment-action-cell {
    padding-top: 0!important;
    padding-bottom: 0!important;
}

.ld-table.territory-table tr:hover .deleteIcon,
.ld-table.territory-table tr:hover .segment-action {
    visibility: visible;
}
#territory-routing-editor .dataTables_scrollHead {
    height: 30px;
    top: 5px;
}
#territory-routing-editor th {
    vertical-align: top;
    line-height: 18px;
}

.ld-table .deleteIcon {
    visibility: hidden;
}
.ld-table .segment-action {
    position: relative;
    visibility: hidden;
    background: url(../images/Down_Arrow_Icon.png) no-repeat 90% center #fff;
    background-position: right 6px center;
    background-size: 9.5px 5.5px;
    font-size: 12px;
    font-weight: var(--light);
    color: var(--dk-grey-1);
    -webkit-appearance: none;
    line-height: 14px;
    border-radius: 3px;
    border: 1px solid #f2f2f2;
    background-color: white;
    padding: 5px 0 5px 7px;
    width: 70px;
}
.ld-table .segment-action.active,
.ld-table .segment-action:hover{
    border: 1px solid var(--ld-green);
}

.ld-table .ld-select-dropdown {
    display: none;
    position: absolute;
    top: 20px;
    left: -1px;
    width: 70px;
    background: white;
    padding: 2px 0 4px 0;
    border: 1px solid var(--ld-green);
    border-bottom-left-radius: 2px;
    border-bottom-right-radius: 2px;
}
.ld-table .segment-action.active .ld-select-dropdown {
    display: block !important;
}

.ld-table .ld-select-dropdown div {
    padding: 2px 7px;
}

.ld-table .ld-select-dropdown div:hover {
    background-color: var(--ld-green);
    color: white;
}

.ld-breadcrumb:not(:first-child) {
    padding-left: 5px;
}
.ld-breadcrumb {
    padding-right: 5px;
}
.ld-breadcrumb.static {
    font-size: 12px;
    font-weight: var(--regular);
    color: var(--med-grey-2);
    text-decoration: underline;
    cursor: pointer;
}
.ld-breadcrumb.static:hover {
    font-size: 12px;
    font-weight: var(--regular);
    color: var(--ld-green);
    text-decoration: underline;
}
.ld-breadcrumb.current {
    font-size: 12px;
    font-weight: var(--regular);
    color: var(--med-grey-2);
}

/***************************************
****************************************
WRAPPERS
****************************************
***************************************/

.ld-inner-wrapper{
    padding-left: 30px;
    padding-right: 30px;
    width: 1345px;
    background-color: #FFFFFF;
    padding-top: 20px;
    padding-bottom: 20px;
}

.ld-outer-wrapper{
    background-color: #f2f2f2;
}

