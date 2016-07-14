/**
 * Created by claudio on 24/05/16.
 */

Vue.component('index', {
    props: ['locations'],
    data() {
        return {
            error: '',
            promotionsService: [],
            promotionsDevice: [],
        }
    },
    ready() {
        this.loadPromotionsService();
        this.loadPromotionsDevice();
    },
    methods:{
        loadPromotionsService(){
            var _this = this;
            this.$http({url: basicUrl + '/api/promotions-service.php', method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    _this.error = response.data.error;
                }else {
                    var tmp = response.data;
                    tmp = tmp.map((ele)=>{
                        ele.img = 'img/dynamic/'+ele.img;
                        return ele;
                    });
                    _this.promotionsService = tmp;
                    _this.error = '';
                }
            }, function (response) {
                _this.error = 'Loading error...';
            });
        },
        loadPromotionsDevice(){
            var _this = this;
            this.$http({url: basicUrl + '/api/promotions-device.php', method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    _this.error = response.data.error;
                }else {
                    var tmp = response.data;
                    tmp = tmp.map((ele)=>{
                        ele.img = 'img/dynamic/'+ele.img;
                        return ele;
                    });
                    _this.promotionsDevice = tmp;
                    _this.error = '';
                }
            }, function (response) {
                _this.error = 'Loading error...';
            });
        },
    }
});
