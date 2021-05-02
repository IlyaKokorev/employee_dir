require("@rails/ujs").start()
require("turbolinks").start()

import 'bootstrap/dist/js/bootstrap'

import '../styles/application.scss'

const images = require.context('../images', true)

//= require jquery3
//= require popper
//= require bootstrap-sprockets