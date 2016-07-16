/**
 * Created by claudio on 24/05/16.
 */
require('jquery-stickytabs');

Vue.component('the-group', {
    props: ['locations'],
    data() {
        return {
            news: []
        }

    },
    ready() {
        //get news
        this.loadNews();

        //add current location
        this.locations.push({name: 'The group', url: 'the-group.html'});
    },

    methods:{
        loadNews(){
            var _this = this;
            this.$http({url: basicUrl + '/api/news.php', method: 'GET'}).then( (response) => {
                if(response.data.error != undefined){
                    _this.error = response.data.error;
                }else {
                    var tmp = response.data;
                    _this.news = tmp;
                    _this.error = '';
                }
            }, function (response) {
                _this.error = 'Loading error...';
            });
        },
    }
});
