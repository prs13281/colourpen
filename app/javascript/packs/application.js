// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks" //新規画像投稿ではコメントアウトする
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'
//import './preview'  // 新規投稿に画像表示の追記

import "../stylesheets/application"



Rails.start()
// Turbolinks.start()
ActiveStorage.start()
require('./preview') //画像プレビューのため
require('./scrollToTop')//画面トップにスクロールするボタンのため