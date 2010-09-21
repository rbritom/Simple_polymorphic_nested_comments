$($(".comments_panel a").live("click", function() {
$("#comment_content").val("@"+ $(this).attr("comment_author"));
$("#comment_parent_id").val($(this).attr("comment_id"));
}));


$($("#new_comment").live("submit",function(){
$.post(this.action,$(this).serialize(),null,'script');
return false;
}));
