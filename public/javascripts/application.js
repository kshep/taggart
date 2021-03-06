// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function clear_tree() {

  $("#tree").dynatree("getRoot").visit(function(node){
        node.select(false);
  });

}

function get_selected() {
  var root = $('#tree').dynatree("getRoot");
  var keys = $.map(root.tree.getSelectedNodes(), function(node){
    return node.data.key;
  });
  return keys;
}

function draw_graphs() {

  keys = get_selected();

  $('#graph_wrapper').empty()
  for (var i in keys) {
    var div = $('<div>');
    div.append($('<div>')
      .attr('class','graph_title')
      .text(keys[i]));
    div.append($('<div>')
      .attr('id','graph'+i)
      .attr('class','graph')
    );
    $('#graph_wrapper').append(div)
    draw_graph('#graph'+i, keys[i]);
  }

}

function draw_graph(div, key) {

  var data;
  
  $.ajax({
       url: '/data/'+key,
       async: false,
       dataType: 'json',
       success: function (json) {
         data = json;
       }
     });

  var min_date = new Date($('#graph_formatted_start_at').val());
  var max_date = new Date($('#graph_formatted_end_at').val());
 
  var graph_min = min_date.getTime() - 25200000;
  var graph_max = max_date.getTime() - 25200000;

  var options = {
      xaxis: { mode: "time", timeformat: "%m/%d %h:%M", min: graph_min, max: graph_max },
      legend: { position: "se" }
  };

  var plot = $.plot(div, [ { color: "#0000ff", data: data }], options);
     
}

function draw_tree() {
  
  $.ui.dynatree.nodedatadefaults["icon"] = false; // Turn off icons

  $("#tree").dynatree({ checkbox: true,
    onSelect: function(select, node) {
      var skeys = get_selected();
      $("#info_keys").text(skeys.join(", "));
      $("#graph_keys").val(skeys.join(", "));
     }
   });
  
}
