
// Initialize Summernote
$(document).ready(function() {
    $('#summernote').summernote({
        height: 300,  // Set editor height
        placeholder: '내용을 입력해주세요',
        tabsize: 2,    // Tab size for indentation
        callbacks: {
            onImageUpload: function(files) {
                // 이미지 업로드 로직 작성
                console.log('Image upload:', files);
            }
        }
    });
});
