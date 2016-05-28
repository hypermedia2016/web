/**
 * Created by claudio on 24/05/16.
 */

Vue.component('device', {
    props: ['locations'],
    data() {
        return {
            error: '',
            data: [],
            parsedData: {},
        }

    },
    ready() {
        //add basic location
        this.locations.push({name: 'devices', url: 'devices.html'});

        //load device
        this.loadDevice();
    },

    methods:{
        loadDevice(){
            var id = this.getDeviceId();
            if(id==null)
            {
                this.error = 'Wrong id, please come back';
                return;
            }
            var _this = this;
            this.$http({url: basicUrl + '/api/device.php?id='+ id, method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    _this.error = response.data.error;
                }else {
                    _this.data = response.data;
                    _this.error = '';
                    _this.parseData();
                }
            }, function (response) {
                _this.error = 'Loading error...';
            });
        },

        getDeviceId(){
            var id = window.location.hash.substr(1); //remove #
            if(isNaN(id) || id <= 0)
                return null;
            else
                return id;
        },

        parseData(){
            //No data
            if(this.data.length == 0) {
                this.error = 'Wrong id, please come back';
                return;
            }
            if(this.data.length != 1) {
                this.error = 'Internal error, please come back';
                return;
            }
            //OK
            this.parsedData = this.data[0];
            
            //push states
            this.locations.push({name: this.parsedData.type, url: 'devices.html#'+this.parsedData.type.toLowerCase()});
            this.locations.push({name: this.parsedData.brand, url: 'devices.html?brand='+ encodeURIComponent(this.parsedData.brand) +'#'+this.parsedData.type.toLowerCase()});
            this.locations.push({name: this.parsedData.name, url: 'device.html#'+this.parsedData.id});

            //TODO hash listen
        }
    }
});
