//新規投稿画像表示
if (document.URL.match(/new/)){
  document.addEventListener('DOMContentLoaded', () => {
    const createImageHTML = (blob) => {
      const imageElement = document.getElementById('new-image');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    document.getElementById('post_image').addEventListener('change', (e) =>{
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });
  });

}

//投稿編集画面画像表示
if (document.URL.match(/edit/)){
  document.addEventListener('DOMContentLoaded', () => {
    const createImageHTML = (blob) => {
      const imageElement = document.getElementById('new-image');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    document.getElementById('post_image').addEventListener('change', (e) =>{
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });
  });

}
//    const createImageHTML = (blob) => {
//      const imageElement = document.getElementById('new-image');
//      const blobImage = document.createElement('img');
//      blobImage.setAttribute('class', 'new-img')
//      blobImage.setAttribute('src', blob);
//      imageElement.appendChild(blobImage);
//    };

//    document.getElementById('post_image').addEventListener('change', (e) =>{
//      const file = e.target.files[0];
//      const blob = window.URL.createObjectURL(file);
//      createImageHTML(blob);
//    });
//  });
//} //新規投稿画像表示の追記 エラーなのでまた後でする

