/**
 * Created by claudio on 24/05/16.
 */

//dependencies
var marked = require('marked');


Vue.component('assistance-details', {
    props: ['locations'],
    data() {
        return {
            error: '',
            data: [],
            parsedData: {},
            devices: [],
        }

    },
    ready() {
        //add basic location
        this.locations.push({name: 'assistance', url: 'assistance.html'});

        //load assistance
        this.loadAssistance();

        //load relationships
        this.loadDevices();

        //id changed
        var _this = this;
        $(window).on('hashchange', ()=>{_this.locations.pop();_this.locations.pop();_this.locations.pop();_this.loadAssistance();_this.loadDevices();});
    },

    methods:{
        loadAssistance(){
            var id = this.getAssistanceId();
            if(id==null)
            {
                this.error = 'Wrong id, please come back';
                return;
            }
            var _this = this;
            this.$http({url: basicUrl + '/api/assistance-details.php?id='+ id, method: 'GET'}).then( (response) => {
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

        getAssistanceId(){
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
            this.locations.push({name: this.parsedData.type, url: 'assistance.html#'+this.escapeName(this.parsedData.type)});
            this.locations.push({name: this.parsedData.name, url: 'assistance-details.html#'+this.parsedData.id});
        },
        createGroupedArray (arr, chunkSize) {
            var groups = [], i;
            for (i = 0; i < arr.length; i += chunkSize) {
                groups.push(arr.slice(i, i + chunkSize));
            }
            return groups;
        },

        escapeName(name){
            return name.toLowerCase().replace(/\s+/g,'_');
        },
        loadDevices(){
            var _this = this;
            this.$http({url: basicUrl + '/api/device-assistance.php?assistance_id='+this.getAssistanceId(), method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    _this.error = response.data.error;
                }else {
                    var tmp = response.data;
                    tmp = tmp.map((ele)=>{
                        ele.img = ele.img.split('||').map((ele2)=>{return basicUrl +'/img/dynamic/'+ele2;});
                        return ele;
                    });
                    _this.devices = _this.createGroupedArray(tmp,3);
                    _this.error = '';
                }
            }, function (response) {
                _this.error = 'Loading error...';
            });
        }
    },
    filters: {
        marked (data){
            if (data == undefined)
                data = '';
            return marked(data);
        },
        realUrls (data){
            return data.replace(/src=\"([^\"]*)\"/gi, 'src="'+basicUrl+'/img/dynamic/$1"');
        },
        customTags (data){
            if (data == undefined)
                data = '';
            return data.replace(/---OR/gi, '<div style="width:100%; position:relative; height: 1px; background-color: #1B3280">\n<span style="position:absolute; top:-14px; left:50%; background-color:white; padding:5px">or</span>\n</div>');
        }
    }
});
