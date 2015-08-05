/**
 * Created by icepoint on 8/2/15.
 */
function change(str){

    $("#change").append(str)

}
function reply(article_id,comment_id){

    var username=$("#child_username").val()
    var comment_body=$("#text"+comment_id).val();
    var str="对"+username+"说:";
    comment_body2=comment_body.replace(new RegExp(str), "");
    if(comment_body2=="" ){
        alert("回复不能为空")
    }
    else {
        $.ajax({
            type: "get",
            url: "/comments/reply",
            data: {id: article_id, comment_id: comment_id, body: comment_body},
            dataType: "json",
            success: function (data) {
                window.location.reload();
            },
            error: function (error) {
                console.log(error);
            }
        });


    }


}
function slidetoggle(id,username){



    if($("#text"+id).val()!=null){

        $("#text"+id).val('');
    };
    $("#"+id).slideToggle("slow");
    $("#"+id).css('display','block');

    $("#text"+id).val("对"+username+"说:");


    $("#child_username").val(username);



}

function submit_comment(){
    if($("#article_body").val()==""){

        alert("请输入评论内容")
    }else{
        $("#comment_form").submit();

    }


}
function menuFixed(id){
    var obj = document.getElementById(id);
    var _getHeight = obj.offsetTop+38

    window.onscroll = function(){
        changePos(id,_getHeight);
    }
}
function changePos(id,height){
    var obj = document.getElementById(id);
    var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
    if(scrollTop < height+80){
        obj.style.position = 'relative';
        obj.style.marginTop='-35px';

    }else{
        obj.style.marginTop="-76px";
        obj.style.position = 'fixed';
    }
}


