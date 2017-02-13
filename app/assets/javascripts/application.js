// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= //require bootstrap
//= require jcf.js
//= require jcf.checkbox
//= require jcf.select
//= require bootstrap.min
//= require jquery.bootstrap.wizard
//= require prettify
//= require jqueryui
//= require wow
//= require bootstrap-datepicker.min
//= require cocoon




// replace custom forms
jcf.lib.domReady(function () {
    jcf.customForms.replaceAll();
});

wow = new WOW(
    {
        animateClass: 'animated',
        offset:       200,
        callback:     function(box) {
            console.log("WOW: animating <" + box.tagName.toLowerCase() + ">")
        }
    }
);
wow.init();
$(document).on("page:load ready", function(){
    $( ".datepicker" ).datepicker();

})
//document.getElementById('moar').onclick = function() {
//    var section = document.createElement('section');
//    section.className = 'section--purple wow fadeInUp';
//    this.parentNode.insertBefore(section, this);
//};
