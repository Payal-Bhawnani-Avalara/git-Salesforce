body,
html {
  line-height: 1;
  height: 100%;
}

#height-wrapper {
  overflow: auto;
  height: 99%;
}

.slds-scope .slds-spinner_container {
  background: #17a6bd;
}

/* Pagination */

div#pagination-wrapper div.dataTables_info {
  font-size: 14px;
  font-style: italic;
  padding-top: 0;
}

div#pagination-wrapper div.dataTables_paginate {
  display: inline-block;
}

div#pagination-wrapper div.dataTables_paginate li {
  margin: 0 5px;
}

div#pagination-wrapper div.dataTables_paginate ul.pagination {
  font-size: 18px;
}

div#pagination-wrapper div.dataTables_info {
  font-size: 12px;
  padding-bottom: 6px;
}

div#pagination-wrapper .page-item.active .page-link {
  background-color: #15A6B9;
  border-color: #15A6B9;
}

div#pagination-wrapper .page-link {
  color: #15A6B9;
  border: 1px solid #ffffff;
  border-radius: 2px;
  padding: 0.25rem 0.75rem;
  text-decoration: none !important;
  outline: 0 !important;
}

div#pagination-wrapper .page-link:active,
div#pagination-wrapper .page-link:focus {
  outline: 0 !important;
  border: none;
  box-shadow: none;
}

div#pagination-wrapper .page-link:hover {
  color: #222222;
  background: none;
  border: 1px solid rgba(21, 168, 185, 0);
}

div#pagination-wrapper .page-item.disabled .page-link {
  border: 1px solid #ffffff;
  color: #cccccc;
}

div#pagination-wrapper .paginate_button.page-item.next a:hover,
div#pagination-wrapper .paginate_button.page-item.previous a:hover {
  border: 1px solid #ffffff;
}

/* Table */

td.child {
  word-wrap: break-word;
  white-space: initial !important;
}

table.dataTable.dtr-inline.collapsed > tbody > tr[role="row"] > td:first-child:before,
table.dataTable.dtr-inline.collapsed > tbody > tr[role="row"] > th:first-child:before {
  top: 14px;
  left: 4px;
  height: 16px;
  width: 16px;
  border: none;
  border-radius: 16px;
  box-shadow: none;
  line-height: 18px;
  background-color: #b0adab;
}

table.dataTable.dtr-inline.collapsed > tbody > tr.parent > td:first-child:before,
table.dataTable.dtr-inline.collapsed > tbody > tr.parent > th:first-child:before {
  background-color: #c0295d;
}

.techLinks {
  color: #17a6bd !important;
}