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
            devices: [],
            faqSections: [],
            ruleSections: [],
        }

    },
    ready() {
        //add basic location
        this.locations.push({name: 'services', url: 'services.html'});

        //load service
        this.loadService();

        //load relationships
        this.loadDevices();

        //id changed
        var _this = this;
        $(window).on('hashchange', ()=>{_this.locations.pop();_this.locations.pop();_this.locations.pop();_this.loadService();_this.loadDevices();});
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
            this.createFaqSections();
            this.createRuleSections();
            
            //push states
            this.locations.push({name: this.parsedData.type, url: 'services.html#'+this.escapeName(this.parsedData.type)});
            this.locations.push({name: this.parsedData.name, url: 'service.html#'+this.parsedData.id});
        },

        escapeName(name){
            return name.toLowerCase().replace(/\s+/g,'_');
        },
        loadDevices(){
            var _this = this;
            this.$http({url: basicUrl + '/api/device-service.php?service_id='+this.getServiceId(), method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    _this.error = response.data.error;
                }else {
                    var tmp = response.data;
                    tmp = tmp.map((ele)=>{
                        ele.img = ele.img.split('||').map((ele2)=>{return basicUrl +'/img/dynamic/'+ele2;});
                        return ele;
                    });
                    _this.devices = tmp;
                    _this.error = '';
                }
            }, function (response) {
                _this.error = 'Loading error...';
            });
        },
        createFaqSections(){
            var titles = this.parsedData.faq_titles.split('||');
            var faqs = this.parsedData.faq.split('||');
            for(let i=0; i<titles.length; i++){
                this.faqSections.push({
                    title : titles[i],
                    content : faqs[i],
                })
            }
        },
        createRuleSections(){
            var rules = this.parsedData.rules.split('||');
            for(let i=0; i<rules.length; i++){
                this.ruleSections.push({
                    content : rules[i],
                })
            }
        },
    }
});
