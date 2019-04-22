.mainPanel {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif;
    position:absolute;
    padding:0px;
    margin:0px;
    height:100%;
    width:100%    
}

#viewerMainPanel {
    position:relative;
    border:1px solid #e4e4e4;
    padding:0px;
    margin:0px;
}

nav.sideMenu {
    height:52px;
    background-color:#fff;
    padding: 0px 20px;
}

nav.sideMenu .logoIcon {
    cursor:pointer;
    float:right;
    margin-top: 2px;
	height:46px;
}
        
ul.sideMenu {
    padding: 0px;
    margin: 0px;
    list-style-type: none;
}

ul.sideMenu>li {
    padding:0px;
    height:36px;
    width:36px;
    cursor:pointer;
    margin:8px 12px 0px 0px;
    border-width:0px;
    float:left;
    border-radius: 4px;
}

ul.sideMenu>li:hover {
    background-color:#ebebeb;
    overflow:hidden;
}

ul.sideMenu>#newNoteNav:hover {
    background-color: #fff;
}

ul.sideMenu>li>img {
    width:28px;
    height:28px;
    margin:4px;
}

ul.sideMenu>li.userNav {
    padding:0px;
}

ul.sideMenu>li.userNav:hover {
    background-color: #fff;
}

ul.sideMenu>li.userNav img {
    max-height:36px;
    max-width:36px;
    border-radius:18px;
    padding: 0px;
    height:36px;
    width:36px;
    margin:0px;
}

ul.sideMenu>li.selected {
        	background-color:#ebebeb;
        	cursor:default;
}

ul.sideMenu>.verticalDivider {
    background-color:#e4e4e4;
    width:1px;
    margin-right:15px    
}

nav.sideMenu .topMenuDivider {
    position:absolute;
    left:20px;
    right:20px;
    top:51px;
    height:1px;
    background-color:#e4e4e4;
}
        
#userMenu {
        	font-weight: 300;
        	color: #666;
        	font-size: 14px;
        	background-color: #ffffff;
        	position: absolute;
        	left: 20px;
        	top: 46px;
        	z-index: 50;
        	width: 250px;
        	border: 1px solid rgba(151, 151, 151, 0.2);
        	border-radius: 5px;
        	display: none;
		padding: 0px;
        	list-style-type: none;
        	box-shadow: rgba(99, 114, 130, 0.16) 0px 0px 0px 1px, rgba(27, 39, 51, 0.08) 0px 4px 12px;
}

#userMenu>li {
        	padding: 7px 15px 7px 15px;
        	margin: 0px;
}

#userMenu>li.clickable:hover {
        	background-color: #f1f1f1; 
}

#userMenu>li.divider {
        	background-color: #d8d8d8;
        	height: 1px;
        	margin: 5px;
        	padding: 0px;
}

#userMenu>li:first-child {
        	padding: 15px 15px 10px 15px;
}
        
#userMenu>li:last-child {
        	padding: 0px 0px 8px 0px;
}

#userMenu>li:first-child:hover, #userMenu>li:last-child:hover {
        	cursor:default;
}
        
#userName {
        	display: block;
        	font-size: 16px;
        	color: #000000;
        	padding-bottom: 5px;
}
        
#businessName {
        	display: block;
        	font-size: 13px;
        	color: #999999;
}

#defaultNotebookContainer {
    padding: 20px;
    background-color: #fff;
	border: 1px solid rgba(151, 151, 151, 0.2);
    position: absolute;
    border-radius: 3px;
    width: 350px;
    height: 120px;
    left: 0px;
    right: 0px;
    top: 0px;
    bottom: 200px;
    margin: auto;
    display: none;
    z-index: 101;
	box-shadow: rgba(99, 114, 130, 0.16) 0px 0px 0px 1px, rgba(27, 39, 51, 0.08) 0px 4px 12px;    
}

#defaultNotebookContainer .instruction {
    font-size: 18px;
    font-weight: 700;
    color: #0a0a0a;
    display: block;
    margin-bottom: 6px;
}

#defaultNotebookContainer .whatisit {
    font-size: 13px;
    font-weight: 300;
    color: #666;
    display: block;
    margin-bottom: 20px;
}
        
#defaultNotebookContainer .notebookListContainer {
    background-color: #fff;
	position: absolute;
    max-height: 220px;
    overflow-y: auto;
    top: 128px;
}

#defaultNotebookContainer .notebookListContainer ul {
    list-style-type: none;
	box-shadow: rgba(99, 114, 130, 0.16) 0px 0px 0px 1px, rgba(27, 39, 51, 0.08) 0px 4px 12px;    
	border: 1px solid rgba(151, 151, 151, 0.2);
    border-radius: 3px;
    padding: 0px;
    color: #666;
    font-size: 14px;
    font-weight: 300;
    display:none;
    margin: 0px;
}    

#defaultNotebookContainer .notebookListContainer ul.visible {
    display:block;
}    

#defaultNotebookContainer .notebookListContainer ul>li {
    padding: 5px;
    cursor: pointer;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    min-width: 320px;
    max-width: 500px;
}    
    
#defaultNotebookContainer .notebookListContainer ul>li:hover {
    background-color: #f5f5f5;
}    

div.splash {
    		position:relative;
        	width:260px;
            margin:auto;
            height:180px
        }
        div.splash>img {
            width:260px; 
            margin-top:40px;
        }
        div.blurb {
        	font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif;
            text-rendering: optimizeLegibility;
        	position:relative;
        	width:100%;
        	padding:0px;
        }
        div.blurb>div.main {
    		position: relative;
    		margin: auto;
    		width: 100%;
    		height: 100%;
    		left: 0px;
        	top: 0px;
        	bottom: 0px;
        }
        div.blurb .title {
    		text-align: center;
        	font-size: 20px;
        	font-weight: 600;
        	width: 100%;
        	margin-bottom: 20px;
        }
        div.blurb .body {
    		text-align: center;
        	font-size: 16px;
        	width: 60%;
        	margin: auto;
            color: #444;
            min-width: 380px;
        }

        div.blurb .disconnect {
    		text-align: center;
            margin-top: 30px;
        	font-size: 14px;
        	width: 100%;
            cursor: pointer;
            color: #003399;
        }

        div.blurb .disconnect:hover {
            color: #44aaff;
        }

        div.blurb .error {
        	color: #ff0000;
        	font-size: 16px;
        	margin-bottom: 10px;
        }

        div.blurb .reauthorizeText {
        	margin-top: 30px;
            width: 90%;
        }

        div.blurb .reauthorizeText>span {
        	margin-left: 5px;
            color: #00a82d;
            cursor: pointer;
        }

        div.blurb .reauthorizeText>span:hover {
            color: #60ff9c;
        }

        div.blurb>div.main .clickable {
        	background-color: #00a82d;
        	border-color: #1fae52;
        	color: #ffffff;
        	font-size: 16px;
        	line-height: 20px;
        	padding-top: 15px;
        	font-weight: 300;
        	height: 37px;
        	border-radius: 5px;
        	text-align: center;
        	cursor: pointer;
        	width: 190px;
        	margin: 20px auto;
        }
        
        div.blurbintro {
        	position: absolute;
        	bottom: 30px;
        	font-size: 14px;
        	width: 100%;
            text-align: center;
            color: #003399;
        }

        div.blurbintro>span {
        	cursor:pointer;
        }
        
        div.blurbintro>span:hover {
        	color: #44aaff;
        }    


    #errorNotification {
    	font-weight: 400;
        font-size: 13px;
    	color: #fff;
    	background-color: #f66;
        border: 1px solid #f66;
    	position: absolute;
    	top: 55px;
    	left: 0px;
    	right: 0px;
    	width: 500px;
    	margin: auto;
    	z-index: 10000;
    	display: none;
        border-radius: 6px;
   	}
    
    #errorNotification.information {
    	background-color: #38AC5E;
    	border: 1px solid #38AC5E;
    }

    #errorNotification.errorVisible {
    	display: block;
    }

    #errorNotification .notificationText {
    	padding: 5px 5px 5px 8px;
    	float: left;
    	display: inline;
    	width: 457px;
    	border-right: 1px solid #fff;
        text-align: center;
   	}

    #errorNotification.information .notificationText {
    	border-right: 1px solid #fff;
   	}
    
    #errorNotification .notificationClose {
    	position: absolute;
    	top: 0px;
    	bottom: 0px;
    	right: 0px;
    	height: 29px;
    	margin: auto;
   	}

    #errorNotification .notificationClose img {
    	padding: 3px;
    	cursor: pointer;
   	}

.evernoteDisabler {
    position: absolute;
    top: 0px;
    bottom: 0px;
    left: 0px;
    right: 0px;
    background-color: #2a333c;
    display: none;
    opacity: 0.4;
    z-index: 98;
}    

.evernoteDisabler.transparent {
    opacity: 0.05;
    z-index: 100;
}
    
.evernoteDisabler.active {
    display: block;
}    

.waitspinner {
	position: absolute;
	z-index: 200;
	top: 200px;
	left: 40%;
	display: none;
}

.waitspinner.waitpopup {
	left: 50%;
}

        main {
            height: 100%;
        	background-color:#fff;
        }
        
	section.mainTabPanel {
		position:relative;
		height:100%;
		width:100%;
    }

        section.noteCards {
        	display: block;
        	padding: 0px 12px 0px 12px;
        	overflow-y: auto;
       	}

	section.noteCards.search {
        	display: inline-block;
   	}
        
        article.noteCard {
        	float: left;
        	background-color: #fefefe;
        	display: block;
        	width: 170px;
        	height: 170px;
        	font-size: 13px;
        	margin: 1px 8px 15px 8px;
        	position: relative;
        	cursor: pointer;
        	border: 1px solid #e4e4e4;
	        box-shadow: 0 0 0 3px transparent;
        		transition: box-shadow .15s, border-color .15s ease-out;
            opacity: 1;
            transition: opacity 0.5s linear, background-color 0.5s linear;
       	}

        article.noteCard:hover {
			background-color: #f8f8f8;
        		border: 1px solid #ccc;
        }
        
        article.noteCard>div.content {
        	width: 170px;
        	height: 170px;
        	overflow:hidden;
       	}
        
        article.noteCard h1 {
        	font-size: 14px;
        	font-weight: 600;
        	max-height: 32px;
        	margin: 7px 12px 5px 12px;
        	text-overflow: ellipsis;
        	overflow: hidden;
        	word-wrap: break-word;
        	-webkit-box-orient: vertical;
        	-webkit-line-clamp: 2;
        	line-height: 16px;
        	display: -webkit-box;
            color: #000;
        }

        article.noteCard p {
        	line-height: 16px;
        	margin: 0px 12px 12px 12px;
        }

        article.noteCard p.dateOnly {
        	display: block;
        }

        article.noteCard p.withThumbnail {
        	height: 36px;
        }
        
        article.noteCard span.dateDesc {
        	color: #5a96b3;
        	margin-right: 4px;
        	float: left;
        }

        article.noteCard span.summary {
        	word-wrap: break-word;
            color: #7a8083;
        }

        article.noteCard>div.cardBottom {
        	background-color: #ffffff;
        	position: absolute;
        	bottom: 0px;
        	left: 0px;
        	right: 0px;
        	height: 14px;
        	display: block;
        }

        article.noteCard:hover>div.cardBottom {
        	display: block;
        }
        
        article.noteCard>div.transparentBottom {
        	background-color: transparent;
        }

        article.noteCard div.actionButton {
        	background-color: transparent;
        	position: absolute;
        	top: -10px;
        	left: 5px;
        	width: 36px;
        	height: 36px;
        	display: none;
        }

        
        article.noteCard:hover div.actionButton {
        	display: block;
        }

        
        article.noteCard span.lastEditedBy {
        	color: #cccccc;
        	font-weight: 400;
        	position: absolute;
        	right: 6px;
        	display: none;
        	white-space: nowrap;
        	text-overflow: ellipsis;
        	overflow: hidden;
        	width: 110px;
        	text-align: right;
        }

        article.noteCard:hover span.lastEditedBy {
        	display: block;
        }

        article.noteCard .updateCover {
        	position: absolute;
        	background-color: #000000;
        	opacity: 0.33;
        	height: 100%;
        	width: 100%;
        	left: 0px;
        	top: 0px;
        }

        article.noteCard:last-child {
        	margin-bottom: 25px;
        }

article.noteCard div.punt {
    position: absolute;
    right: -3px;
    top: -3px;
}    

article.noteCard div.punt img {
    height: 24px;
    width: 24px;
}    

article.noteCard.transitiongone {
    opacity: 0;
    background-color: #eeee55;
}    

        .noteCardCount {
        	position: relative;
        	padding: 12px 20px 10px 20px;
        	font-size: 18px;
        	font-weight: 500;
        	color: #000;
        }

div.noLinks {
    position:absolute;
    display:none;
    width:60%;
    top:30%;
    left:20%;
    text-align:center;
}

div.noLinks.active {
    display:block;
}

div.noLinks>.noLinksHeader {
    font-size: 18px;
    font-weight: 600;
    display: block;
    margin-bottom: 15px;
}    

div.noLinks>.noLinksInstruction {
    font-size: 14px;
    font-weight: 300;
    display: block;
    color: #505050;
}    

#searchTools {
	height: 35px;
}

#searchTools .searchControls {
	padding:4px 0px 0px 10px;
	float:right;
	margin-right:20px;
}

#searchTools .searchControls select {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif;
    font-size: 13px;
}

#searchTools .searchControls #selectSearchScope {
	margin-left: 3px;
}

#searchTools .searchControls>label {
	cursor: pointer;
    font-size: 13px;
}

#searchTools .searchControls #selectBizPer {
	margin-left:15px;
}

#searchText {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif;
    font-size: 13px;
    width: 185px;    
    margin-left: 7px;
    border-radius: 4px;
    border:solid 1px #d8d8d8;
    padding:2px 25px 2px 4px;
}

#searchText+img {
    margin: 0px 10px -6px -28px;
    height: 22px;
    width: 22px;
    cursor: pointer;
}

#linkedNoteOptions {
    position: absolute;
    top: 100px;
    left: 100px;
    display: none;
    z-index:100;
    white-space: nowrap;
    border: 1px solid #e4e4e4;    
    font-size: 13px;
    color: #606060;
}

#linkedNoteOptions.active {
    display: block;
}
    
#linkedNoteOptions>ol {
    padding: 0px;
    margin: 0px;
	list-style-type: none;
    display: none;
}

#linkedNoteOptions>ol.active {
    display: block;
}

#linkedNoteOptions>ol>li.linkAction {
    background-color: #ffffff;
    cursor: pointer;
    padding: 8px 12px;
    display: block;
}

#linkedNoteOptions>ol>li.linkAction:first-child {
    border-bottom: 1px solid #e4e4e4;
}
    
#linkedNoteOptions>ol>li.linkAction:hover {
    background-color: #efefef;
}    

div.otherSfdcLinker {
    display: none;
    background-color: #ffffff;
    font-size: 14px;
    width: 350px;
    white-space: normal;
    border: 1px solid #d8d8d8;
    border-radius: 6px;    
    position: absolute;
    color: #444;
    padding: 9px 13px;
}

div.otherSfdcLinker input {
    width: 330px;
    font-size: 15px;
    border-radius: 4px;
    border: 1px solid #d8d8d8;
    padding: 5px 8px;
}
    
div.otherSfdcLinker .allDone {
    margin-left: 35px;
    cursor: pointer;
    position: relative;
}

div.otherSfdcLinker .allDone>img {
    height: 20px;
    width: 20px;
}
    
div.otherSfdcLinker.active {
    display: block;
}    

div.otherSfdcLinker ul.sfdcResults {
    list-style-type: none;
	box-shadow: rgba(99, 114, 130, 0.16) 0px 0px 0px 1px, rgba(27, 39, 51, 0.08) 0px 4px 12px;    
	border: 1px solid rgba(151, 151, 151, 0.2);
    border-radius: 4px;
    padding: 0px;
    color: #666;
    font-size: 14px;
    font-weight: 300;
    display:block;
    margin: 0px;
    position: absolute;
}

div.otherSfdcLinker ul.sfdcResults>li {
	background-color: #fff;
    cursor: pointer;
    padding: 3px 8px;
    display: block;
    font-size: 15px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    width: 350px;}    

div.otherSfdcLinker ul.sfdcResults>li:first-child {
    border-top: 0px;
    margin-top: 4px;
}

div.otherSfdcLinker ul.sfdcResults>li.selected {
    background-color: #efefef;
}

div.otherSfdcLinker>section {
    min-height: 40px;
    padding-bottom: 8px;
}
    
div.otherSfdcLinker>section>.otherRecordsTitle {
    font-weight: 500;
    font-size: 16px;
    width: 100%;
    padding-bottom: 8px;
    border-bottom: 1px solid #d8d8d8;
}

div.otherSfdcLinker>section>.otherRecordsList {
    margin-top: 8px;
}

div.otherSfdcLinker>section .linkedRecord {
    margin: 1px 2px 2px 3px;
    padding: 2px 0px 2px 5px;
    border: 1px solid #d8d8d8;
    background-color: #f1f1f1;
    display: inline-block;
    font-size: 13px;
    font-weight: 400;
    border-radius: 10px;
    max-width: 330px;
    white-space: nowrap;
    overflow: hidden;
}

div.otherSfdcLinker>section .linkedRecord>div {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 305px;
    display:inline-block;
}    

div.otherSfdcLinker>section .linkedRecord>img {
    margin-left: 1px;
    height: 18px;
    width: 18px;
    cursor: pointer;
}