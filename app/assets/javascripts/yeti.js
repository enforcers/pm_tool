// Yeti
// Bootswatch
//= require jquery
//= require jquery_ujs
//= require yeti/loader
//= require yeti/bootswatch
//= require jstree/jstree.min
//= require jquery.ui.core
//= require jquery.ui.widget
//= require jquery.ui.mouse
//= require jquery.ui.sortable
//= require chosen.jquery.min
//= require_tree .

$(document).ready(function() {
  $('.delete-project').click(function(e) {
  	var element = $(this);
    if (confirm('Are you sure you want to delete selected project?')) {
	  $.ajax({
	    type : 'DELETE',
	    url : '/projects/' + element.attr('data-project'),
	    dataType: 'json',
	    data : null,
	    success: function(data) {
	      element.parent().parent().hide('slide');
	    },
	    error: function(xhRequest, ErrorText, thrownError) {
	      console.log(xhRequest.responseText);
	    }
	  });
    }
    console.log($(this).attr('data-project'));
    e.preventDefault();
  });
});