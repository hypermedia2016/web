/**
 * Created by claudio on 24/05/16.
 */

Vue.component('device', {
    props: ['locations'],
    data() {
        return {
            error: '',
            data: [],
            parsedData: {img:['']},
            presentationSections: [],
            specs : [],
            services: [],
            assistance: [],
            toShowImg : 0
        }

    },
    ready() {
        //add basic location
        this.locations.push({name: 'Devices', url: 'devices.html'});

        //load device
        this.loadDevice();

        //load other elements
        this.loadServices();
        this.loadAssistance();

        //id changed
        var _this = this;
        $(window).on('hashchange', ()=>{_this.locations.pop();_this.locations.pop();_this.locations.pop();_this.loadDevice();_this.loadAssistance();_this.loadServices();});
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
                    var tmp = response.data;
                    tmp = tmp.map((ele)=>{
                        ele.colors = ele.colors.split('||');
                        ele.img = ele.img.split('||').map((ele2)=>{return basicUrl +'/img/dynamic/'+ele2;});
                        return ele;
                    });
                    _this.data = tmp;
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

            //sections
            this.createPresentationSections();
            this.createSpecItems();

        },

        createPresentationSections(){
            var titles = this.parsedData.titles.split('||');
            var full_description = this.parsedData.full_description.split('||');
            var images = this.parsedData.img_pres.split('||');
            var imagesTag = this.parsedData.img_pres_tag.split('||');
            for(let i=0; i<titles.length; i++){
                this.presentationSections.push({
                    title : titles[i],
                    content : full_description[i],
                    image : basicUrl +'/img/dynamic/'+images[i],
                    imageTag : imagesTag[i],
                })
            }
        },
        createSpecItems(){
            var rawSpecs = this.parsedData.specs.split('||');
            for(let chunk of rawSpecs){
                let splittedChunk = chunk.split(':');
                this.specs.push({
                    title: splittedChunk[0],
                    content: splittedChunk[1]
                })
            }
        },
        loadServices(){
            var _this = this;
            this.$http({url: basicUrl + '/api/device-service.php?device_id='+this.getDeviceId(), method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    _this.error = response.data.error;
                }else {
                    var tmp = response.data;
                    tmp = tmp.map((ele)=>{
                        ele.img = basicUrl +'/img/dynamic/'+ele.img;
                        return ele;
                    });
                    _this.services = tmp;
                    _this.error = '';
                }
            }, function (response) {
                _this.error = 'Loading error...';
            });
        },
        loadAssistance(){
            var _this = this;
            this.$http({url: basicUrl + '/api/device-assistance.php?device_id='+this.getDeviceId(), method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    _this.error = response.data.error;
                }else {
                    var tmp = response.data;
                    tmp = tmp.map((ele)=>{
                        ele.img = basicUrl +'/img/dynamic/'+ele.img;
                        return ele;
                    });
                    _this.assistance = tmp;
                    _this.error = '';
                }
            }, function (response) {
                _this.error = 'Loading error...';
            });
        },
        switchImg(id){
            this.toShowImg = id;
        }
    }
});
