/**
 * Created by claudio on 24/05/16.
 */
require('jquery-stickytabs');

Vue.component('devices', {
    props: ['locations'],
    data() {
        return {
            content: {filters: [], devices: []},
            error: '',
            types: []
        }

    },
    ready() {
        //add current location
        this.locations.push({name: 'devices', url: basicUrl + '/devices.html'});
        this.locations.push({name: 'devices', url: basicUrl + '/devices.html'});

        //load types
        this.loadTypes();
    },

    methods:{
        loadTab(name){
            this.locations.pop();
            this.locations.push({name: name, url: '#'+name.toLowerCase()});
            this.$http({url: basicUrl + '/api/devices.php?type='+ name.toLowerCase(), method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    this.error = response.data.error;
                }else {
                    this.content = response.data;
                    this.error = '';
                }
            }, function (response) {
                this.error = 'Loading error...';
            });
        },

        loadTypes(){
            this.$http({url: basicUrl + '/api/devices-types.php', method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    this.error = response.data.error;
                }else {
                    var data = response.data;
                    data.forEach((type, key)=>{
                        var tmp = type;
                        tmp.url = '#'+tmp.name.toLowerCase();
                        data[key] = tmp;
                    });
                    this.types = data;
                    var _this = this;
                    this.$nextTick(function () {
                        _this.loadTab(_this.types[0].name);
                        $($('.nav-tabs li')[0]).addClass('active');
                        $($('.tab-content div')[0]).addClass('in').addClass('active');
                        $('.nav-tabs a').on('shown.bs.tab', function(event){
                            var name = $(event.target).text();
                            _this.loadTab(name);
                        });
                        $('.nav-tabs').stickyTabs();
                    });
                }
            }, function (response) {
                this.error = 'Loading error...';
            });
        }
    }
});
