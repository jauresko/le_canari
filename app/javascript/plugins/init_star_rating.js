import "jquery-bar-rating";
// <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {
  $('#review_rating').barrating({
    theme: 'css-stars',
  });
  // TODO
};

export { initStarRating };
