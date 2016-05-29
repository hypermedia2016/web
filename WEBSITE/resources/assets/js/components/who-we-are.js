/**
 * Created by claudio on 24/05/16.
 */
require('jquery-stickytabs');

Vue.component('who-we-are', {
    props: ['locations'],
    data() {
        return {
        }

    },
    ready() {
        //add current location
        this.locations.push({name: 'Who we are', url: 'who-we-are.html'});

        //listener
        var _this = this;
        $('.nav-tabs a').on('shown.bs.tab', function(event){
            var name = $(event.target).text();

            _this.loadTab(name);
        });
        $('.nav-tabs').stickyTabs();
    },

    methods:{

    }
});
