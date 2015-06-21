$(function(){
  var ids = [];
  $('#album_upload').fileupload({
    done: function (e, data) {
      ids.push(data.result.picture_id);
      $('#photos_ids').val(ids);
    }
  });
});
