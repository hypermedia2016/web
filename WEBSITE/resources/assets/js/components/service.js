/**
 * Created by claudio on 24/05/16.
 */

Vue.component('service', {
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
        this.locations.push({name: 'services', url: 'services.html'});

        //load service
        this.loadService();

        //id changed
        var _this = this;
        $(window).on('hashchange', ()=>{_this.locations.pop();_this.locations.pop();_this.locations.pop();_this.loadService();});
    },

    methods:{
        loadService(){
            var id = this.getServiceId();
            if(id==null)
            {
                this.error = 'Wrong id, please come back';
                return;
            }
            var _this = this;
            this.$http({url: basicUrl + '/api/service.php?id='+ id, method: 'GET'}).then( (response) => {
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

        getServiceId(){
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
            this.locations.push({name: this.parsedData.type, url: 'services.html#'+this.escapeName(this.parsedData.type)});
            this.locations.push({name: this.parsedData.name, url: 'service.html#'+this.parsedData.id});
        },

        escapeName(name){
            return name.toLowerCase().replace(/\s+/g,'_');
        },
    }
});