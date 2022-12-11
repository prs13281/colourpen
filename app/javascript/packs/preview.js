//新規投稿と編集、マイページの写真プレビュー表示
if (document.URL.match(/new|edit/)){
  document.addEventListener('DOMContentLoaded', () => {
    const createImageHTML = (blob) => {
      const imageElement = document.getElementById('new-image');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    // 投稿とマイページで表示させたいのでふたつ必要
    var postImage = document.getElementById('post_image')
    var profileImage = document.getElementById('profile_image')

    var element
    if (postImage) {
      element = postImage
    }
    if (profileImage) {
      element = profileImage
    }
    if (element) {
      element.addEventListener('change', (e) =>{
        const imageContent = document.querySelector('img');
        if (imageContent){
          imageContent.remove();
        }
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);
        createImageHTML(blob);
      });
    }
  });

}
