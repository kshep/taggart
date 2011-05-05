// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function draw_graphs() {

    draw_graph('#graph', 'db_stats:test:avgObjSize');
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
    
  var options = {
      xaxis: { mode: "time", timeformat: "%m/%d %h:%M" },
      legend: { position: "se" }
  };

  var plot = $.plot(div, [ { color: "#0000ff", data: data }], options);
     
}

function draw_tree() {
  
  $.ui.dynatree.nodedatadefaults["icon"] = false; // Turn off icons

  $("#tree").dynatree({
    checkbox: true,
    onSelect: function(select, node) {
      var selKeys = $.map(node.tree.getSelectedNodes(), function(node){
        return node.data.key;
      });
      $("#control").text(selKeys.join(", "));
      $('#graph_wrapper').empty();
      for (var i in selKeys) {
        var div = $('<div>');
        div.append($('<div>').text(selKeys[i]).attr('class','graph_title'));
        div.append($('<div>').attr('id','graph'+i).attr('class','graph'));
        $('#graph_wrapper').append(div);
        draw_graph('#graph'+i, selKeys[i]);
      }
    }
  });
  
}
