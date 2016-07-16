/**
 * Created by claudio on 24/05/16.
 */
require('jquery-stickytabs');
const queryString = require('query-string');

Vue.component('devices', {
    props: ['locations'],
    data() {
        return {
            content: {filters: [], devices: []},
            devicesFiltered: [],
            error: '',
            types: [],
            activeFilter: {},
            keepActiveFilter: false,
            searchParsed: queryString.parse(location.search),
            clicked: false,
        }

    },
    ready() {
        //add current location
        this.locations.push({name: 'Devices', url: 'devices.html'});
        this.locations.push({name: 'Devices', url: 'devices.html'}); //this will be removed by loadTab called by loadTypes

        //filter passed
        this.getFilter();
        
        //load types
        this.loadTypes();
    },

    methods:{
        loadTab(name){
            var _this = this;
            this.locations.pop();
            this.locations.push({name: name, url: '#'+name.trim().toLowerCase()});
            this.$http({url: basicUrl + '/api/devices.php?type='+ encodeURIComponent(name.trim()), method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    _this.error = response.data.error;
                }else {
                    var tmp = response.data;
                    tmp.devices = tmp.devices.map((ele)=>{
                        ele.colors = ele.colors.split('||');
                        ele.img = ele.img.split('||').map((ele2)=>{return basicUrl +'/img/dynamic/'+ele2;});
                        ele.list_desc = ele.list_desc.split('||');
                        return ele;
                    });
                    _this.content = tmp;
                    _this.setData();
                    _this.error = '';
                }
            }, function (response) {
                _this.error = 'Loading error...';
            });
        },

        loadTypes(){
            var _this = this;
            this.$http({url: basicUrl + '/api/devices-types.php', method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    _this.error = response.data.error;
                }else {
                    //parse and store result
                    var data = response.data;
                    data.forEach((type, key)=>{
                        var tmp = type;
                        tmp.url = '#'+tmp.name.toLowerCase();
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
                        $('.nav-tabs a').on('click', (event) =>{_this.clicked = true;});
                        $('.nav-tabs a').on('shown.bs.tab', function(event){
                            var name = $(event.target).text();
                            //this is not executed the first time if a query was passed
                            if(!_this.keepActiveFilter || _this.clicked) {
                                history.pushState(null, null, location.origin + location.pathname + '#' + name.trim().toLowerCase());
                                _this.activeFilter = {};
                            }
                            _this.searchParsed = [];
                            _this.keepActiveFilter = false;
                            _this.loadTab(name);
                        });
                        $('.nav-tabs').stickyTabs();

                        //back and forward support for filters
                        //TODO
                       /* window.addEventListener('popstate', (href) => {
                            _this.getFilter();
                            _this.setData();
                        });*/
                    });
                }
            }, function (response) {
                _this.error = 'Loading error...';
            });
        },

        //------------FILTERS----------------
        setData(){
            var keys = Object.keys(this.activeFilter);
            if(keys.length==0) {
                this.devicesFiltered = this.content.devices;
                return;
            }
            //at the moment we consider only one active element per time
            if(this.activeFilter[keys[0]] == 'undefined'){
                this.specialFilterClicked(keys[0], null);
            }else {
                this.filterClicked({name: this.activeFilter[keys[0]]}, keys[0], null);
            }
        },

        getFilter(){
            this.activeFilter = queryString.parse(location.search);
            if(Object.keys(this.activeFilter).length!=0)
                this.keepActiveFilter = true;
        },

        filterText(filter, type){
            if(type=='price')
                return this.priceFilterText(filter);
            return filter.name;
        },

        priceFilterText(price){
            if(price[0]==0)
                return 'Less than '+ price[1] + '€';
            else if(price[1]==-1)
                return 'Greater than '+ price[0] + '€';
            else
                return 'Between '+ price[0] + '€ and ' + price[1] + '€';
        },

        filterPrice(price){
            if(price[1]==-1)
                this.devicesFiltered = this.content.devices.filter((item) =>{
                    return (item['price'] >= price[0]);
                });
            //This case covers also the case "less than"
            else
                this.devicesFiltered = this.content.devices.filter((item) =>{
                    return (item['price'] >= price[0] && item['price'] <= price[1]);
                });
        },

        filterClicked(filter, type, event){
            if(event != null)
                event.preventDefault();
            this.setCurrentFilter(type, filter.name);
            if(type=='price')
                this.filterPrice(filter);
            else
                this.devicesFiltered = this.content.devices.filter((item) =>{
                   return (item[type] == filter.name);
                });
        },

        specialFilterClicked(filter,  event){
            if(event != null)
                event.preventDefault();
            this.setCurrentFilter(filter, undefined);
            if(filter == 'All')
                this.devicesFiltered = this.content.devices;
            else
                this.devicesFiltered = this.content.devices.filter((item) => {
                    return item.characteristics.includes(filter);
                });
        },

        setCurrentFilter(name, value){
            this.activeFilter = {};
            this.activeFilter[name] = value+'';
            history.pushState(null, null, location.origin + location.pathname + '?'+encodeURIComponent(name)+'='+encodeURIComponent(value) + window.location.hash);
            this.searchParsed = queryString.parse(location.search);
        }

    },
    computed: {
        shutCurrentFilter(){
            var data = this.searchParsed;
            var keys = Object.keys(data);
            if(keys.length == 0)
                return {key:'', value:''};
            var key = keys[0];
            var value = data[key];
            return {key: key, value: value};
        },

    }
});
