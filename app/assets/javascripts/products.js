$(document).ready(function() {
  $('#product-new').click(function() {
    var ref = $('#jstree_test').jstree(true),
        sel = ref.get_selected();

    if (!sel.length) { return false; }
    sel = sel[0];
    var node = ref.get_node(sel);
    sel = ref.create_node(sel, {'type' : node.type + 1});
    if (sel) {
      ref.edit(sel);
    }
  });

  $('#product-rename').click(function() {
    var ref = $('#jstree_test').jstree(true),
        sel = ref.get_selected();

    if(!sel.length) { return false; }
    sel = sel[0];
    ref.edit(sel);
  });

  $('#product-remove').click(function() {
    var ref = $('#jstree_test').jstree(true),
        sel = ref.get_selected();

    if (!sel.length) { return false; }
    ref.delete_node(sel);
  });

  $('#product-save').click(function() {
    var ref = $('#jstree_test');

    var json = ref.jstree('get_json');
    var jsonString = JSON.stringify(json);
    alert(jsonString);
  });
});