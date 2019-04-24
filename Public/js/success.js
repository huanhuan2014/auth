/**
 * Created by lg on 2017/9/4.
 */

var count = 5;
$(setInterval(function(){
        $("#success-time").text(count);
        count --;
        if(count<=0){
            window.location.href = "/Login" ;
        }
    },1000)
);
