/**
 * Created by lg on 2017/8/19.
 */

$("#img-code").click(function(){
    var random = Math.random();
    $(this).attr("src", "/Login/getCheckCode?v="+random);
});

$("#login-btn").click(function(){
    if(!doCheck()){
        return;
    }
    var param = new Object();

    param.code = $("#code").val().trim();
    param.loginCode = $("#txt-img-code").val().trim();
    param.pwd = $("#pwd").val().trim();

    $.ajax({
        url:"/Login/login",
        data:param,
        dataType:"json",
        type:"post",
        success:function (data) {
            if(data.code !=1){
                setErrMsg($("#help-block-all"),data.msg);
            }else{
                window.location = "/Auth/Index";
            }
        }
    });
});

$(".form-group input").focus(function(){
    $(this).parents(".form-group").removeClass("has-error");
    $(this).parents(".form-group").find(".help-block").hide();
});

function doCheck(){
    var code = $("#code").val().trim();
    if(code==""){
        setErrMsg($("#code"),"请输入手机号码");
        return false;
    }
    var regPhone = /^1[3|4|5|7|8|9][0-9]{9}$/;
    var regEmail= /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
    if(!regPhone.test(code) && !regEmail.test(code)){
        setErrMsg($("#phone"),"请输入正确的手机号码或电子邮箱");
        return false;
    }
    if(regPhone.test(code) && code.length!=11 ){
        setErrMsg($("#phone"),"请输入正确的手机号码");
        return false;
    }
    var code = $("#txt-img-code").val().trim();
    if(code==""){
        setErrMsg($("#txt-img-code"),"请输入验证码");
        return false;
    }
    if($("#pwd").val()==""){
        setErrMsg($("#pwd"),"请输入密码");
        return false;
    }
    return true;
}


