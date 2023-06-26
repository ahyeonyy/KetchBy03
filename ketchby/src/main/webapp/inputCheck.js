$(function(){
	$("#btnJOIN").click(function(){

		var email = document.getElementById("email").value;
    	var password = document.getElementById("password").value;
    	var passwordcom = document.getElementById("passwordcom").value;
    	var name = document.getElementById("name").value;
    	var nick = document.getElementById("nick").value;
    	var phone = document.getElementById("phone").value;
    	var birth = document.getElementById("birth").value;

		if(document.getElementById("email").value === ""){
			alert("이메일을 입력해 주세요");
			document.getElementById("email").focus();
			return;
		}
		
		if(document.getElementById("password").value === ""){
			alert("비밀번호를 입력해 주세요");
			document.getElementById("password").focus();
			return;
		}
		if(document.getElementById("passwordcom").value === ""){
			alert("비밀번호 확인란을 입력해 주세요");
			document.getElementById("passwordcom").focus();
			return;
		}
		if(document.getElementById("name").value === ""){
			alert("이름을 입력해 주세요");
			document.getElementById("name").focus();
			return;
		}
		if(document.getElementById("nick").value === ""){
			alert("닉네임을 입력해 주세요");
			document.getElementById("nick").focus();
			return;
		}
		if(document.getElementById("phone").value === ""){
			alert("전화번호를 입력해 주세요");
			document.getElementById("phone").focus();
			return;
		}
		if(password != passwordcom){
			alert("비밀번호와 비밀번호 확인란이 다릅니다.");
			return;
		}

		window.location.href = "insertAccountOK.do?email="+email+"&password="+password+"&passwordcom="+passwordcom+"&name="+name+"&nick="+nick+"&phone="+phone+"&birth="+birth;
	
	})
})
