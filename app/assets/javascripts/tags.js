$(function() {
  var tag_array = JSON.parse($('#tag_list').val());
  $('#recipe_tag_list').select2({tags: tag_array});
});