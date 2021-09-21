// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require jquery.mask
//= require activestorage
//= require turbolinks
//= require bootstrap
//= require_tree .

var options =  {
  onKeyPress: function(tel, e, field, options) {
    var masks = ['(00) 0000-00009', '(00) 00000-0000'];
    var mask = (tel.length>14) ? masks[1] : masks[0];
    $('.tel').mask(mask, options);
}};

$('.cep').mask('00000-000');
$('.cpf').mask('000.000.000-00', {reverse: true});
$('.tel').mask('(00) 0000-00009', options);