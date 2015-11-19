$(function() {
    
    var handler = Gmaps.build('Google');
    handler.buildMap({ internal: {id: 'basic_map'}}, function(){
      
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    });
});