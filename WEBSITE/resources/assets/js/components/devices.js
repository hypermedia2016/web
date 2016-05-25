/**
 * Created by claudio on 24/05/16.
 */
require('jquery-stickytabs');

Vue.component('devices', {
    props: ['locations'],
    data() {
        return {
            content: {filters:[{'name':'pippo'}], devices:[]},
            error: ''
        }
    },
    ready() {
        //add current location
        this.locations.push({name: 'devices', url: basicUrl + '/devices.html'});
        this.locations.push({name: 'devices', url: basicUrl + '/devices.html'});
        this.loadTab('smartphones');

        //tabs load
        var _this = this;
        $('.nav-tabs a').on('shown.bs.tab', function(event){
            var name = $(event.target).text();       // active tab
            _this.loadTab(name);
        });
        $('.nav-tabs').stickyTabs();
    },

    methods:{
        loadTab(name){
            this.locations.pop();
            this.locations.push({name: name, url: '#'+name});
            this.$http({url: basicUrl + '/api/devices.php?type='+ name, method: 'GET'}).then( (response) => {
                this.content = response.data;
                this.error = '';
            }, function (response) {
                this.error = 'Loading error...';
            });
        }
    }
});
