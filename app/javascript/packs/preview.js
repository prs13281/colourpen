//新規投稿画像表示
if (document.URL.match(/new/)){
  document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('postimage').addEventListener('change', (e) =>{
      console.log(e);
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

