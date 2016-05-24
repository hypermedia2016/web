/**
 * Created by claudio on 24/05/16.
 */

Vue.component('index', {
    data() {
        return {
            "message": "test",
        }
    },
    ready() {
        this.$http({url: basicUrl + '/api/test.php', method: 'GET'}).then( (response) => {
            console.log(response.data);
        }, function (response) {
            console.log('error');
        });
    }
});
