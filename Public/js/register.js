/**
 * Created by lg on 2017/8/17.
 */

$("#img-code").click(function(){
    var random = Math.random();
    $(this).attr("src", "Register/getCheckCode?v="+random);
});


$("#register-btn").click(function(){
    if(!doCheck()){
        return;
    }
    var param = new Object();

    param.phone = $("#phone").val().trim();
    param.code = $("#txt-img-code").val().trim();
    param.pwd = $("#pwd").val().trim();

    param.pwd2 = $("#pwd2").val().trim();
    $.ajax({
        url:"/Register/register",
        data:param,
        dataType:"json",
        type:"post",
        success:function (data) {
            if(data.code !=1){
                setErrMsg($("#help-block-all"),data.msg);
            }else{
                window.location = "/Register/success";
            }
        }
    });
});

function doCheck(){
    var phone = $("#phone").val().trim();
    if(phone==""){
        setErrMsg($("#phone"),"请输入手机号码");
        return false;
    }
    var regPhone = /^1[3|4|5|7|8|9][0-9]{9}$/;
    var regEmail= /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
    if(!regPhone.test(phone) && !regEmail.test(phone)){
        setErrMsg($("#phone"),"请输入正确的手机号码或电子邮箱");
        return false;
    }
    if(regPhone.test(phone) && phone.length!=11 ){
        setErrMsg($("#phone"),"请输入正确的手机号码");
        return false;
    }
    var code = $("#txt-img-code").val().trim();
    if(code==""){
        setErrMsg($("#txt-img-code"),"请输入验证码");
        return false;
    }

    var pwd = $("#pwd").val().trim();
    var pwd2 = $("#pwd2").val().trim()

    if(pwd==""){
        setErrMsg($("#pwd"),"请输入密码");
        return false;
    }

    if(pwd.length<8){
        setErrMsg($("#pwd"),"密码长度小于8");
        return false;
    }
    if(pwd.length>20){
        setErrMsg($("#pwd"),"密码长度大于20");
        return false;
    }

    if(pwd2==""){
        setErrMsg($("#pwd2"),"请输入密码确认");
        return false;
    }

    if(pwd!=pwd2){
        setErrMsg($("#pwd2"),"确认密码和密码不相同");
        return false;
    }
    return true;
}


