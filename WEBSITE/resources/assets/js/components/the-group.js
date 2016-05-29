/**
 * Created by claudio on 24/05/16.
 */
require('jquery-stickytabs');

Vue.component('the-group', {
    props: ['locations'],
    data() {
        return {
        }

    },
    ready() {
        //add current location
        this.locations.push({name: 'The group', url: 'the-group.html'});

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
