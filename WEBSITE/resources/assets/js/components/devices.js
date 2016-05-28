/**
 * Created by claudio on 24/05/16.
 */
require('jquery-stickytabs');

Vue.component('devices', {
    props: ['locations'],
    data() {
        return {
            content: {filters: [], devices: []},
            devicesFiltered: [],
            error: '',
            types: []
        }

    },
    ready() {
        //add current location
        this.locations.push({name: 'devices', url: 'devices.html'});
        this.locations.push({name: 'devices', url: 'devices.html'}); //this will be removed by loadTab called by loadTypes

        //load types
        this.loadTypes();
    },

    methods:{
        loadTab(name){
            var _this = this;
            this.locations.pop();
            this.locations.push({name: name, url: '#'+name.toLowerCase()});
            this.$http({url: basicUrl + '/api/devices.php?type='+ name.toLowerCase(), method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    _this.error = response.data.error;
                }else {
                    _this.content = response.data;
                    _this.devicesFiltered = _this.content.devices;
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
                    var data = response.data;
                    data.forEach((type, key)=>{
                        var tmp = type;
                        tmp.url = '#'+tmp.name.toLowerCase();
                        data[key] = tmp;
                    });
                    _this.types = data;
                    _this.$nextTick(function () {
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
                _this.error = 'Loading error...';
            });
        },

        //------------FILTERS----------------

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
            //This case cover also the case "less than"
            else
                this.devicesFiltered = this.content.devices.filter((item) =>{
                    return (item['price'] >= price[0] && item['price'] <= price[1]);
                });
        },

        filterClicked(filter, type, event){
            event.preventDefault();
            if(type=='price')
                this.filterPrice(filter);
            else
                this.devicesFiltered = this.content.devices.filter((item) =>{
                   return (item[type] == filter.name);
                });
        },

        specialFilterClicked(filter,  event){
            event.preventDefault();
            if(filter == 'All')
                this.devicesFiltered = this.content.devices;
            else
                this.devicesFiltered = this.content.devices.filter((item) =>{
                    console.log(item);
                    return item.characteristics.includes(filter);
                });
        }
    }
});
