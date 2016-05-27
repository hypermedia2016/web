/**
 * Created by claudio on 24/05/16.
 */

Vue.component('index', {
    props: ['locations'],
    data() {
        return {
        }
    },
    ready() {
        //add current location //TODO remove just a test
        this.locations.push({name: 'index', url: '/index.html'});

        //just a test
        this.$http({url: basicUrl + '/api/test.php', method: 'GET'}).then( (response) => {
            console.log(response.data);
        }, function (response) {
            console.log('error');
        });
    }
});
