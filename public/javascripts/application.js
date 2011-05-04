// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

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
  };

  // var data = [
  //     { color: "#0000ff", data: d1 },
  //     { color: "#00ff00", data: d2 },
  
  var plot = $.plot($(div), [ data ], options);
     
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
    }
  });
  
}