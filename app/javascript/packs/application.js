// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
});


import '../plugins/init_star_rating';
import '../plugins/carousel';
import '../plugins/algolia_search';
import '../plugins/paydunya';
import '../plugins/check_payment';
import { initChatroomCable } from '../channels/chatroom_channel';

initChatroomCable();

$('.buy').click(function () {
  $('.bottom').addClass("clicked");
});

$('.remove').click(function () {
  $('.bottom').removeClass("clicked");
});

const br = document.querySelector('.br-widget')

if(br) {
  br.classList.add("d-flex");
  br.classList.add("justify-content-center")
}


const verifiedUser = document.querySelectorAll('#verified-user').forEach( (verified) => {
  if (verified.innerText === 'true') {
    const classId = verified.parentElement.parentElement.parentElement.id;
    console.log('.' + classId);
    const verifying = document.getElementById(classId);
    verifying.classList.add('right');
    console.dir(verifying);
  }
})



