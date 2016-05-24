/**
 * Created by claudio on 24/05/16.
 */

window.basicUrl = "http://localhost:8000";

if (window.Vue === undefined) {
    window.Vue = require('vue');
}

Vue.use(require('vue-resource'));

require('./components/bootstrap');

var app = new Vue({
    el: 'body',
    data:{
        'locations': [{name: 'HOME', url: basicUrl+'/index.html'}],
    },
    ready() {
        console.log('Application Ready.');
    }
});