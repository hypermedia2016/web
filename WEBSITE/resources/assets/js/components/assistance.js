/**
 * Created by claudio on 24/05/16.
 */
require('jquery-stickytabs');

Vue.component('assistance', {
    props: ['locations'],
    data() {
        return {
            assistance: [],
            frequents: [],
            error: '',
            types: [],
            home: true,
            locationOriginalLength: 0,
        }

    },
    ready() {
        //add current location
        this.locations.push({name: 'Assistance & support', url: 'assistance.html'});
        this.locationOriginalLength = this.locations.length;
        //this.locations.push({name: 'Assistance & support', url: 'assistance.html'}); //this will be removed by loadTab called by loadTypes
        
        //load types
        this.loadTypes();

        //load frequents
        this.loadFrequents();

        //hash changed
        var _this = this;
        $(window).on('hashchange', ()=>{
            if(location.hash == '')
            {
                _this.home = true;
                _this.locations.pop();
            }else {
                _this.home = false;
                if(_this.locationOriginalLength == _this.locations.length)
                    _this.locations.push({name: location.hash.slice(1), url: location.hash.slice(1) + '.html'}); //TODO improove
            }
        });
    },

    methods:{
        escapeName(name){
            return name.toLowerCase().replace(/\s+/g,'_');
        },

        loadTab(name){
            var _this = this;
            if(!this.home)
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
                        /*_this.loadTab(_this.types[0].name);
                        $($('.nav-tabs li')[0]).addClass('active');
                        $($('.tab-content div')[0]).addClass('in').addClass('active');*/

                        //listener
                        $('.nav-tabs a').on('shown.bs.tab', function(event){
                            var name = $(event.target).text();
                            _this.loadTab(name);
                            _this.home = false;
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

        loadFrequents(){
            var _this = this;
            this.$http({url: basicUrl + '/api/assistance-frequent.php', method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    _this.error = response.data.error;
                }else {
                    var tmp = response.data;
                    tmp = tmp.map((ele)=>{
                        ele.img = basicUrl +'/img/dynamic/'+ele.img;
                        return ele;
                    });
                    _this.frequents = tmp;
                    _this.error = '';
                }
            }, function (response) {
                _this.error = 'Loading error...';
            });
        },
    }
});
