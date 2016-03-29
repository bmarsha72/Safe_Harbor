// var ajaxCall = {
//   type: 'get',
//   dataType: 'json',
//   url: 'https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyDBr2wF8qkNVllKkkHMaRMLW9KkVF79Foc',
//   success: function(data) {
//     console.log(data);
//   }
// }

var ajaxCall = {
  type: 'get',
  dataType: 'json',
  url: 'https://maps.googleapis.com/maps/api/geocode/output?json&postal_code='+<%= ENV["API_KEY"] %>'',
  success: function(data) {
    console.log(data);
  }
}
$(document).ready(function(){
  $('#zipSearchButton').on('click', function() {
    $.ajax(ajaxCall);
  });
});
