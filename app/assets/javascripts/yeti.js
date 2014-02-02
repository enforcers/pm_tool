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
//= require jquery.validate
//= require_tree .

$.validator.setDefaults({
  highlight: function(element) {
    $(element).closest('.form-group').addClass('has-error');
  },
  unhighlight: function(element) {
    $(element).tooltip('destroy');
    $(element).closest('.form-group').removeClass('has-error');
  },
  errorPlacement: function(error,element) {
    $(element).tooltip('destroy').tooltip({ title: error.text() }).tooltip('show');
  }
});

$.validator.addMethod('validParentNodeSelected', function(value, element) {
    var ref = $('#jstree').jstree(true),
        sel = ref.get_selected(),
        node = ref.get_node(sel[0]);
    return (sel.length > 0 && node.type != 'd3');
}, 'Please select a valid parent first.')

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
    e.preventDefault();
  });

  $('#new-project-form').validate({
    rules: {
      'project[name]': 'required'
    }
  });
});