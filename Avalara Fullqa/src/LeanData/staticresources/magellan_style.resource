::-webkit-scrollbar {
  width: 0px;  /* remove scrollbar space */
  background: transparent;  /* optional: just make scrollbar invisible */
}

#board {
  margin-top: -1px;
  width:1047px;
  height: 805px;
  float:left;
  position: relative;
  overflow: hidden;
}

#navigator {
  position: relative;
  float: left;
  z-index: 1;
  left: 0px;
  width: 300px;
  height: 300px;
  left: -400px;
}

.bs #navigator .navigator {
  overflow: visible;
  left: 10px;
  top: 10px;
  height: 0px;
  width: 0px;
  padding: 0px;
}

.bs .navigator>.paper {
  box-shadow: 0 0 2px #03a9F4;
}

.paper {
  background-color: white;
}

.bs .paper-scroller {
  /*background: #F3F5F6;*/
  background: #FFFFFF;
  padding: 0;
}

#paper-wrapper {
  position: absolute;
  /*position: relative;*/
  float: left;
  width: 1048px;
  height: 805px;
  overflow:hidden;
}

#paper, #paper-overlay {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
}

#paper-overlay {
  z-index: 10;
  display: none;
/*  opacity: .5;
  background-color: grey;*/
}

#overlay-hole {
  position: absolute;
  left: 50px;
  width: 170px;
  height: 170px;
  border-radius: 50%;
  box-shadow: 0 0 0 99999px rgba(0, 0, 0, .3);
}


/*#paper {
  position: absolute;
  float: left;
  width: 1048px;
  height: 805px;
  overflow:hidden;
}
*/
#stencil-parent {
  /*opacity: 0;*/
  visibility: hidden;
  padding: 5px;
  top: 0px;
  position: relative;
}

.bs #stencil {
  left: -5px;
  top: 5px;
  position:relative;
  width: 75px;
  float:right;
  height: 172px;
}

.bs #stencil .stencil {
  margin-top:20px;
  width: 75px; 
  height: 154px;
  border: 1px solid gainsboro;
}

#drag-anchor {
  height:20px;
  width:75px;
  cursor: pointer;
  background: gainsboro;
}

label.box {
  display: none;
}

.bs .dialog[data-type=alert] .titlebar {
  background-color: #B7B7B7;
}

.bs .dialog .titlebar {
  border-bottom: none;
}

.bs .dialog .fg {
  position: fixed;
}


.selection .handle.rotate { display: none; } /* disables the rotate tool */

/* Top Buttons*/
.bs .top-button {
  float:left;
  position: relative;
  font-size: 12.5px;
  cursor: pointer;
  border: .75px solid #8da8bf;
  width: 70px;
  height: 51px;
  margin-top: -1px;
  margin-bottom: 1px;
  margin-left: -1px;
  color: #555555;
}

.handle.link {
  display: none;
}

.bs .top-button-active, .bs .top-button:hover, .bs .top-button.hover {
  border: .75px solid #31d0c6;
  color: #31d0c6;
  z-index: 2;
}

#inspector {
  border-top: .75px solid #8da8bf;
  border-left: .75px solid #8da8bf;
  position: relative;
  width: 520px;
  height: 855px;
  background-color: white;
  color: #1F1F1F;
  top: 49px;
  right: -1045px;;
  z-index: 50;
}

#inspector * {
  -webkit-box-sizing: content-box; 
  -moz-box-sizing: content-box;
  box-sizing: content-box;
}

#inspector h3 {
  display: none;
}

.bs .inspector label {
  font-family: open-sans-light;
}

.bs .inspector .group>.group-label {
  border-bottom: 1px solid #1f1f1f;
  background: rgba(75,161,251,0.3);
}

.bs .inspector input, .inspector textarea {
  text-shadow: none;
  color: black;
  font-weight: 400;
}

.bs .dg_inner-wrapper {
  width: 1047px;
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}

#board-container {
  float:left;
}

.bs .link-tools .tool-options { display: none }
.bs .viewport .link.Link .marker-arrowheads { opacity: 0 }


.labels {
  display: none;
}
.show-labels .labels {
  display: inline-block;
}
 
.dg_inner-wrapper {
  overflow: hidden;
}

#node-type{
  color: #1abc9c;
  font-weight: 400;
  font-size: 10px;
  padding-bottom: 12px;
}

#node-properties-wrapper{
  margin-left: 35px;
  margin-top: 30px;
}

#node-properties-panel{
  font-size: 9px;
  font-weight: 400;
  line-height: 180%;
}

#node-properties-wrapper #node-properties-panel #form-table-holder .dg_details-table-div table {
  font-size: 9px;
}

.hide-after-inspect{
  display: none;
}

#action-node-container{
	float: right;
	width: 150px;
	border: 0.75px solid #8da8bf;
	margin-right: -1px;
	margin-top: 74px;
	font-size: 12px;
	height: 360px;
	position: relative;
}

#action-node-stencil .StencilElement {
	visibility: visible;
	opacity: 0;
}

#action-node-stencil {
	z-index: 10;
	visibility: hidden;
}

#action-node-dropdown, #action-node-stencil{
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
}

#action-node-dropdown li {
  height: 40px;
}

#node-group-container ul li:not(:last-child)  {
  border-bottom: 0.75px solid #8da8bf;
}

#node-group-container {
  border-left: 0.75px solid #8da8bf;
  border-bottom: 0.75px solid #8da8bf;  
  float: right;
  width: 50px;
  height: 120px;
  margin-top: -5px;
  margin-right: -3px;
  position: relative;
}

#node-group-container img {
  position: relative;
  top: 2px;
}

#node-group-container span {
  font-size: 8px;
  position: absolute;
  width: 50px;
  text-align: center;
  font-weight: 400;
  display: block;
}

#node-group-container img:last-child {
  padding-bottom: 8px;
}

#node-group-panel ul li {
  height: 40px;
  width: 50px;
  line-height: 20px;
}

#node-group-panel ul {
  padding: 0;
  list-style-type: none;
  text-align: center;
}

#node-group-panel, #node-group-stencil {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
}

#node-group-stencil .StencilElement {
  visibility: visible;
  opacity: 0;
}

#node-group-stencil {
  z-index: 10;
  visibility: hidden;
}


#action-node-dropdown ul {
	font-size: 8px;
  font-weight: 400;
  color: #555555;
	list-style: none;
	padding-left: 0px;
}

#action-node-dropdown li:not(:last-child) {
	border-bottom: 0.75px solid #8da8bf;
}

#action-node-dropdown li:hover, #action-node-dropdown li.hover, #node-group-panel li:hover, #node-group-panel li.hover {
	background-color: #e8edf2;
}

#action-node-dropdown li img {
	width: 35px;
	height: 35px;
  top: 3px;
  left: 7.5px;
  position: relative;
}

#action-node-dropdown li span {
  padding-left: 10px;
}

.bs #properties-wrapper .dg_details-table-div{
  width: 400px;
  margin-left: 0;
}

.bs #node-properties-panel label {
  width: 25px;
  max-width: none;
}

#form-table-holder {
  padding-top: 10px;
}

/*used to prevent rappid's default colon from appearing */
.inspector #properties-wrapper #form-table-holder label:after {
  content: "";
}