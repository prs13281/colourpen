document.addEventListener('DOMContentLoaded', () => {
  const scrollToTop = document.querySelector('#scroll-to-top');
  if(!scrollToTop) {
    return;
  }
  scrollToTop.addEventListener('click', () => {
    window.scroll({ top:0, behavior: 'smooth'});
  });
});