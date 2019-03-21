#wise-responses {
  margin: -10px -25px -20px;
  width: 350px; }
  #wise-responses * {
    box-sizing: border-box; }
  #wise-responses .spinner {
    height: 2em;
    background-image: url("spinner.gif");
    background-repeat: no-repeat;
    background-position: center;
    margin: 0;
    padding: 0; }
  #wise-responses header {
    margin: 0;
    border-bottom: 0px;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    background-color: #2e424b;
    height: 40px;
    padding-top: 7px; }
    #wise-responses header .clear-logo {
      margin-left: 8px;
      width: 25px;
      height: 25px;
      float: left; }
    #wise-responses header h3 {
      padding-left: 10px;
      color: white;
      float: left; }
    #wise-responses header .search {
      width: 245px;
      margin-left: 8px;
      height: 25px;
      float: left; }
    #wise-responses header .close-search {
      display: none;
      font-size: 20px;
      color: white;
      padding-left: 8px;
      padding-right: 8px;
      float: left;
      cursor: pointer; }
    #wise-responses header.searching .search, #wise-responses header.searching .close-search {
      display: block; }
    #wise-responses header .help-icon {
      float: right;
      width: .75px;
      line-height: 1.2px;
      font-weight: bold;
      color: white;
      font-size: 20px;
      cursor: pointer;
      padding-top: 13px;
      padding-right: 25px; }
  #wise-responses .label {
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    -ms-border-radius: 3px;
    -o-border-radius: 3px;
    border-radius: 3px;
    display: inline-block;
    font-size: 0.8em;
    font-weight: 600;
    margin-top: -0.4em;
    padding: 0.3em 0.6em;
    vertical-align: middle;
    color: #fff;
    background: #78a300; }
  #wise-responses .label.default {
    background: #a9b9b1;
    color: #fff; }
  #wise-responses .label.primary {
    background: #52b178;
    color: #fff; }
  #wise-responses .label.warning {
    background: #e7cb35;
    color: #fff; }
  #wise-responses .label.danger {
    background: #c92411;
    color: #fff; }
  #wise-responses .label.actual-value {
    background: transparent;
    color: #000;
    font-weight: 400; }
   #wise-responses .label.example {
    float: left;
    margin: 15px 15px;
    width: 78px;
    height: 20px; }
  #wise-responses section {
    margin: 0; }
  #wise-responses .no-results {
    line-height: 0;
    margin-top: 20px;
    margin-bottom: 20px;
    text-align: center; }
  #wise-responses .error {
    padding: 20px;
    text-align: center; }
  #wise-responses .error > h3 {
    line-height: 100%;
    font-size: 14px;
    margin-bottom: 20px; }
  #wise-responses .macro {
    height: auto;
    border-bottom: 1px solid #d5d5d5;
    overflow: auto;
    zoom: 1; }
    #wise-responses .macro:last-of-type {
      border-bottom-left-radius: 5px;
      border-bottom-right-radius: 5px;
      border-bottom: 0; }
    #wise-responses .macro .disclosure {
      float: left;
      margin: 0;
      background-image: app-asset-url("disclosure.png");
      background-repeat: no-repeat;
      background-position: center;
      background-size: 8px;
      cursor: pointer;
      width: 30px;
      height: 18px;
      margin-top: 10px; }
    #wise-responses .macro.pre-open .search {
      display: block; }
      #wise-responses .macro.pre-open .search .action-text {
        max-height: 26px;
        padding: 10px 20px;
        line-height: 3; }
    #wise-responses .macro.pre-open.open .search {
      display: none; }
    #wise-responses .macro.open .disclosure {
      background-image: app-asset-url("disclosure-open.png");
      background-size: 14px; }
    #wise-responses .macro.open .action {
      display: block; }
    #wise-responses .macro .title {
      width: 320px;
      padding: 10px;
      overflow: hidden;
      background-color: #ffffff; }
      #wise-responses .macro .title:hover {
        background-color: #f8f8f8; }
      #wise-responses .macro .title .v-center {
        display: table; }
      #wise-responses .macro .title .title-text {
        display: table-cell;
        margin: 0;
        cursor: pointer;
        height: 15px;
        vertical-align: middle;
        line-height: 1.35;
        color: #146eaa;
        font-size: 1.0em;
        word-wrap: break-word;
        word-break: break-all; }
        #wise-responses .macro .title .title-text .highlight {
          font-weight: bold;
          color: #0f507c; }
    #wise-responses .macro .action, #wise-responses .macro .search {
      display: none;
      clear: both;
      position: relative;
      background-color: #f8f8f8; }
      #wise-responses .macro .action .action-text, #wise-responses .macro .search .action-text {
        position: relative;
        margin-left: 20px;
        padding: 20px;
        max-height: 216px;
        overflow: auto;
        white-space: pre-line;
        color: #777; }
        #wise-responses .macro .action .action-text .highlight, #wise-responses .macro .search .action-text .highlight {
          font-weight: bold;
          color: #000; }
  #wise-responses .more {
    cursor: pointer;
    height: 20px;
    width: 100%;
    font-size: 16px;
    line-height: 0;
    padding: 5px 0;
    text-align: center;
    display: table;
    margin: 0 auto;
    color: #146eaa;
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
    background-color: #ffffff; }
    #wise-responses .more:hover {
      background-color: #f8f8f8; }
  #wise-responses .modal {
    height: auto; }
  #wise-responses .modal-body {
    padding-top: 0px; }
  #wise-responses h5 {
    padding-top: 15px;
    padding-bottom: 5px;
    border-bottom: 1px solid #eee; }
  #wise-responses .shortcut {
    height: auto;
    overflow: auto; }
    #wise-responses .shortcut .keys {
      height: auto;
      position: relative;
      font-size: 9px;
      display: inline-block;
      margin: 3px 3px;
      padding: 2px 4px 4px;
      background-color: transparent;
      border: 1px solid #c5c5c5;
      border-radius: 3px;
      margin-outside: 3px;
      line-height: 1em;
      white-space: nowrap;
      box-shadow: 0 2px 0 -1px #fff,0 2px 0 #c5c5c5;
      -webkit-transition: .6s background-color;
      transition: 0.6s background-color; }
    #wise-responses .shortcut .action {
      position: relative;
      font-size: 11px;
      display: inline-block;
      margin: 3px 3px; }
  #wise-responses .search-shortcut, #wise-responses .more-shortcut, #wise-responses .title-shortcut {
    position: absolute;
    visibility: hidden; }