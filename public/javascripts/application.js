$($(".comments_panel a").live("click", function() {
$("#comment_content").val("@"+ $(this).attr("comment_author"+"\n"));
$("#comment_parent_id").val($(this).attr("comment_id"));
}));
