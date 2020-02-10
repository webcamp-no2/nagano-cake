// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
 //= require rails-ujs
  //= require turbolinks
  //= require jquery
  //= require bootstrap-sprockets
  //= require_tree .
  $(document).on('turbolinks:load', function() {
    $(function() {
      $('#product_image').on('change', function(e) {
        // 1枚だけ表示する
        var file = e.target.files[0];

        // ファイルリーダー作成
        var fileReader = new FileReader();
        fileReader.onload = function() {
            // Data URIを取得
            var dataUri = this.result;

            // img要素に表示
            $('#file-preview').attr('src', dataUri);
          }

        // ファイルをData URIとして読み込む
        fileReader.readAsDataURL(file);
      });
    });
  });