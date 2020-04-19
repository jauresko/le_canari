import Swiper from 'swiper';

const swiper = new Swiper('.swiper-container', {
  slidesPerView: 4,
  spaceBetween: 3,
  centeredSlides: true,
  pagination: {
    el: '.swiper-pagination',
    clickable: true,
  },
});



