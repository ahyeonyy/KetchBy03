$(function() {
  $("#update").submit(function() {
    var password = document.getElementById("password").value;
    var passwordcom = document.getElementById("passwordcom").value;
    
  
    if (document.getElementById("password").value != "") {
      if (document.getElementById("passwordcom").value === "") {
        alert("비밀번호 확인란을 입력해 주세요");
        document.getElementById("passwordcom").focus();
        return false;
      }
    }
    

    if (password !== passwordcom) {
      alert("비밀번호와 비밀번호 확인란이 다릅니다.");
      return false;
    }

 	});
})