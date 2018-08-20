/**
 * 
 */

 var movie_code = function(){
        var code = '';
        var dt = new Date();
        var month = dt.getMonth()+1;
        var day = dt.getDate();
        var year = dt.getFullYear();
        code = 'M'+ add_zero(month) + add_zero(day) + year +'_11';
        return code;
    }
    
    function add_zero(num){
       return (Number(num) < 10 ? '0'+ num : num) ;   
    }