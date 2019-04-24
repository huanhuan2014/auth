//前端验证设置错误信息
function setErrMsg(obj,msg){
    $(obj).parents(".form-group").addClass("has-error");
    $(obj).parents(".form-group").find(".help-block").show();
    $(obj).parents(".form-group").find(".help-block").text(msg);
}

$(".form-group input").focus(function(){
    $(this).parents(".form-group").removeClass("has-error");
    $(this).parents(".form-group").find(".help-block").hide();
    $(this).parents(".form-group").find(".help-block").text("");
});

/**
 * 弹框信息
 * @param option object 配置信息{"msg":"", "type":1, "end":function(){}}
 * */
function alertMsg(option){
    if(option == undefined){
        return;
    }
    var defaultOption = {"msg":"", "type":6, "end":function(){}};
    var opt = $.extend(defaultOption, option);
    var icon = 6;
    if(opt.type == 0){
        icon = 5;
    }
    if(opt.end == undefined || opt.end == "" || opt.end == null){
        layer.alert(opt.msg, {icon: icon});
    }else{
        layer.alert(opt.msg, {icon: icon}, function(index){
            opt.end();
            layer.close(index);
        });
    }
}

/**
 * 确认框
 * @param msg string 确认消息
 * @param option object 配置信息{"msg":"", "func":function(){}}, func 点击确定后执行的事件
 * */
function confirmMsg(option){
    var defaultOption = {"msg":"", "func":function(){}};
    var opt = $.extend(defaultOption, option);
    layer.confirm(opt.msg, {"icon": 3, "btn":['确定',['取消']]}, function(){
        opt.func();
    },function(){});
}

//设置cookie
//name cookie键值，value cookie值，hour过期时间(小时)
function setCookie(name, value, hour){
    if(name == undefined || name==""){
        return;
    }
    if(hour != undefined && !isNaN(hour)){
        var d = new Date();
        d.setTime(d.getTime() + (hour*60*60*1000));
        var expires = "expires="+d.toUTCString();
        document.cookie = name + "=" + value + ";path=/"+";"+expires;
    }else{
        document.cookie = name + "=" + value + ";path=/"
    }
}

//获取cookie
function getCookie(name){
    var strCookie=document.cookie;
    var arrCookie=strCookie.split(";");
    for(var i=0;i<arrCookie.length;i++){
        var c=arrCookie[i].split("=");
        var cookieName = c[0];
        cookieName = cookieName.replace(/(^\s*)|(\s*$)/g, "");
        if(cookieName == name){
            return c[1];
        }
    }
    return "";
}
