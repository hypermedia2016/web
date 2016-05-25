/**
 * Created by claudio on 24/05/16.
 */

//global variables
window.basicUrl = "http://localhost:8000";

// vue
if (window.Vue === undefined) {
    window.Vue = require('vue');
}
Vue.use(require('vue-resource'));


// Load jQuery and Bootstrap jQuery, used for front-end interaction.
if (window.$ === undefined || window.jQuery === undefined) {
    window.$ = window.jQuery = require('jquery');
}
require('bootstrap/dist/js/npm');

//bootstrap components
require('./components/bootstrap');

//start application
var app = new Vue({
    el: 'body',
    data:{
        'locations': [{name: 'HOME', url: basicUrl+'/index.html'}],
    },
    ready() {
        console.log('Application Ready.');
    }
});