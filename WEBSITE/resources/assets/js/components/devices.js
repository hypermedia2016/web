/**
 * Created by claudio on 24/05/16.
 */
require('jquery-stickytabs');

Vue.component('devices', {
    props: ['locations'],
    data() {
        return {
        }
    },
    ready() {
        //add current location
        this.locations.push({name: 'devices', url: basicUrl + '/devices.html'});
        this.locations.push({name: 'Smartphones', url: '#smartphones'});

        //TODO refactor
        //TODO call load data for smartphones
        var _this = this;
        $('.nav-tabs a').on('shown.bs.tab', function(event){
            var name = $(event.target).text();         // active tab
            var y = $(event.relatedTarget).text();  // previous tab
            console.log(name + " - "+ y);
            _this.locations.pop();
            _this.locations.push({name: name, url: '#'+name});
            //TODO load data
        });
        $('.nav-tabs').stickyTabs();
    }
});
