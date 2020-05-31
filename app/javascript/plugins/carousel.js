import Swiper from 'swiper';

const carouselSwiper = () => {
  const swiper = new Swiper('.swiper-container', {
    slidesPerView: 4,
    spaceBetween: 6,
    grabCursor: true,
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    scrollbar: {
          el: '.swiper-scrollbar',
          hide: true,
    },
  });
}

carouselSwiper();
