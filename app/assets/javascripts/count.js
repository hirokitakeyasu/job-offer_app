$(function(){
 $("#offer_body").on("keyup", function() {
   let countNum = String($(this).val().length);
   $("#counter").text(countNum + "文字");
 });
});