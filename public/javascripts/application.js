$($(".comments_panel a").live("click", function() {
$("#comment_content").val("@"+ $(this).attr("comment_author"));
$("#comment_parent_id").val($(this).attr("comment_id"));
}));


$($("#new_comment").live("submit",function(){
$(".adding_comment").css("background", "url('/images/create-loader.gif')")
$.post(this.action,$(this).serialize(),null,'script');
return false;
}));


$(function() {
  $(".pagination a").live("click", function() {
    $(".loading_pages").css("background", "url('/images/ajax-loader.gif')")
    $.get(this.href, null, null, "script");
    return false;
  });
});
