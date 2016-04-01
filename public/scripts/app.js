// $('auto_locate_button').on('click', function() {
//   if(navigator.geolocation) {
//     browserSupportFlag = true;
//     navigator.geolocation.getCurrentPosition(function(position) {
//       initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
//       map.setCenter(initialLocation);
//     }, function() {
//       handleNoGeolocation(browserSupportFlag);
//     });
//   }
//   // Browser doesn't support Geolocation
//   else {
//     browserSupportFlag = false;
//     handleNoGeolocation(browserSupportFlag);
//   }
//
//   function handleNoGeolocation(errorFlag) {
//     if (errorFlag == true) {
//       alert("Geolocation service failed.");
//       initialLocation = newyork;
//     } else {
//       alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
//       initialLocation = siberia;
//     }
//     map.setCenter(initialLocation);
//   }
// });
// 
// var placeSearch, autocomplete;
// var componentForm = {
//   street_number: 'short_name',
//   route: 'long_name',
//   locality: 'long_name',
//   administrative_area_level_1: 'short_name',
//   country: 'long_name',
//   postal_code: 'short_name'
// };
//
// function initAutocomplete() {
//   // Create the autocomplete object, restricting the search to geographical
//   // location types.
//   autocomplete = new google.maps.places.Autocomplete(
//       (document.getElementById('search_input')),
//       {types: ['geocode']});
//
//   // When the user selects an address from the dropdown, populate the address
//   // fields in the form.
//   autocomplete.addListener('place_changed', fillInAddress);
// }
//
// function fillInAddress() {
//   // Get the place details from the autocomplete object.
//   var place = autocomplete.getPlace();
//
//   for (var component in componentForm) {
//     document.getElementById(component).value = '';
//     document.getElementById(component).disabled = false;
//   }
//
//   // Get each component of the address from the place details
//   // and fill the corresponding field on the form.
//   for (var i = 0; i < place.address_components.length; i++) {
//     var addressType = place.address_components[i].types[0];
//     if (componentForm[addressType]) {
//       var val = place.address_components[i][componentForm[addressType]];
//       document.getElementById(addressType).value = val;
//     }
//   }
// }
//
// // Bias the autocomplete object to the user's geographical location,
// // as supplied by the browser's 'navigator.geolocation' object.
// function geolocate() {
//   if (navigator.geolocation) {
//     navigator.geolocation.getCurrentPosition(function(position) {
//       var geolocation = {
//         lat: position.coords.latitude,
//         lng: position.coords.longitude
//       };
//       var circle = new google.maps.Circle({
//         center: geolocation,
//         radius: position.coords.accuracy
//       });
//       autocomplete.setBounds(circle.getBounds());
//     });
//   }
// }
