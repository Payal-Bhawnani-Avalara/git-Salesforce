/* Global */

* {
  font-family: 'Lato', Arial, sans-serif;
  font-weight: 300;
}

body, html {
  line-height: 1;
  height: 100%;
  overflow: hidden;
}

body {
  border: 1px solid #E6EAF3;
  border-radius: 2px;
  padding: 0 !important;
}

#background-wrapper {
  width: 100%;
  height: 100%;
}

.float-left {
  float: left;
}

.float-right {
  float: right;
}


/* Preloader */

#preloader {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #fff;
  z-index: 99;
  text-align: center;
}

#status {
  font-size: 40px;
  margin-top: 200px;
  color: #444;
  font-weight: 300;
}


/* Header */

.header-account-logo {
  width: 52px;
  height: 52px;
  border-radius: 50%;
  border: 1px solid #dddddd;
  margin-top: 5px;
}

#accountLogo {
  margin: 10px;
}

.header-account-details {
  margin: 21px 0 0 10px;
}

.header-account-details h2 {
  font-size: 18px;
  font-family: 'Raleway', 'Lato', Arial, sans-serif;
  font-weight: 400;
  color: #666;
}


/* Search */

.dataTables_filter {
  padding-top: 16px;
}

.dataTables_filter label {
  font-size: 0;
}

#search label {
  float: right;
}

#search input {
  font-size: 14px;
  font-weight: 300;
  width: 300px;
  height: 30px;
  -webkit-appearance: searchfield;
}

[placeholder] {
  text-overflow: ellipsis;
  font-style: italic;
}


/* Table */

.table-container {
  min-height: 350px;
}

.table-product-label span {
  font-weight: 400;
  color: #222222;
}

tbody span {
  font-size: 14px;
  color: #777777;
  font-weight: 400;
}

.table th {
  border-top: none;
}


/* Footer */

.footer {
  padding: 5px 0;
}


/** Table Info **/

div.dataTables_wrapper div.dataTables_info {
  font-size: 14px;
  font-style: italic;
  padding-top: 0;
}

#attribution {
  border-top: none;
  font-size: 12px;
  color: #aaaaaa;
  padding: 0;
  margin-top: 21px;
}

#attribution a {
  color: #aaaaaa;
  text-decoration: none;
}


/** Pagination **/

.paginate-wrapper {
  text-align: center;
}

div.dataTables_wrapper div.dataTables_paginate {
  display: inline-block;
}

div.dataTables_wrapper div.dataTables_paginate li {
  margin: 0 5px;
}

div.dataTables_wrapper div.dataTables_paginate ul.pagination {
  font-size:18px;
}

div.dataTables_wrapper div.dataTables_info {
  font-size: 12px;
  padding-bottom:6px;
}

.page-item.active .page-link {
  background-color: #15A6B9;
  border-color: #15A6B9;
}

.page-link {
  color: #15A6B9;
  border: 1px solid #ffffff;
  border-radius: 2px;
  padding: 0.25rem 0.75rem;
  outline: 0;
}

.page-link:hover {
  color: #222222;
  background: none;
  border: 1px solid rgba(21, 168, 185, 0);
}

.page-item.disabled .page-link {
  border: 1px solid #ffffff;
  color: #cccccc;
}

.paginate_button.page-item.next a:hover, .paginate_button.page-item.previous a:hover {
  border: 1px solid #ffffff;
}

/** HG Logo **/

.hg-logo-container {
  text-align: right;
}

.hg-logo-container img {
  margin-top: 15px;
}
