/**
 * Created by claudio on 24/05/16.
 */
require('jquery-stickytabs');

Vue.component('assistance', {
    props: ['locations'],
    data() {
        return {
            assistance: [],
            error: '',
            types: [],
        }

    },
    ready() {
        //add current location
        this.locations.push({name: 'Assistance & support', url: 'assistance.html'});
        this.locations.push({name: 'Assistance & support', url: 'assistance.html'}); //this will be removed by loadTab called by loadTypes
        
        //load types
        this.loadTypes();
    },

    methods:{
        escapeName(name){
            return name.toLowerCase().replace(/\s+/g,'_');
        },

        loadTab(name){
            var _this = this;
            this.locations.pop();
            this.locations.push({name: name, url: '#'+name.trim().toLowerCase()});
            this.$http({url: basicUrl + '/api/assistance.php?type='+ encodeURIComponent(name.trim()), method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    _this.error = response.data.error;
                }else {
                    _this.assistance = response.data;
                    _this.error = '';
                }
            }, function (response) {
                _this.error = 'Loading error...';
            });
        },

        loadTypes(){
            var _this = this;
            this.$http({url: basicUrl + '/api/assistance-types.php', method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    _this.error = response.data.error;
                }else {
                    //parse and store result
                    var data = response.data;
                    data.forEach((type, key)=>{
                        var tmp = type;
                        tmp.url = '#'+_this.escapeName(tmp.name);
                        tmp.img = basicUrl +'/img/dynamic/'+tmp.img;
                        data[key] = tmp;
                    });
                    _this.types = data;

                    //data loaded and displayed
                    _this.$nextTick(function () {
                        //load default
                        _this.loadTab(_this.types[0].name);
                        $($('.nav-tabs li')[0]).addClass('active');
                        $($('.tab-content div')[0]).addClass('in').addClass('active');

                        //listener
                        $('.nav-tabs a').on('shown.bs.tab', function(event){
                            var name = $(event.target).text();
                            _this.loadTab(name);
                        });
                        $('.nav-tabs').stickyTabs();

                        //back and forward support for filters
                        //TODO
                       /* window.addEventListener('popstate', (href) => {
                        });*/
                    });
                }
            }, function (response) {
                _this.error = 'Loading error...';
            });
        },
    }
});
