<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
</head>
<body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

<script type="text/javascript">
  $(document).ready(function() {
 $("#user_id_checkBtn").unbind("click").click(function(e) {
  e.preventDefault();
  fn_userIDCheck();
 });
});
 
function fn_userIDCheck() {
 var userId = $("#user_id").val();
 var userData = {"ID": userId}
 
 if (userId.length < 1)
 {
  alert("아이디를 입력해주시기 바랍니다.");
 }
 else
 {
  $.ajax({
   type : "POST", 
   url : "/first/join/idCheck", 
   data : userData,
   dataType : "json",
   error : function(error) {
    alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
   },
   success : function(result) {
    if (result == 0)
    {
     $("#user_id").attr("disabled", true);
     alert("사용이 가능한 아이디입니다.");
    }
    else if (result == 1)
    {
     alert("이미 존재하는 아이디입니다. \n다른 아이디를 사용해주세요.");
    }
    else
    {
     alert("에러가 발생하였습니다.");
    }
   }
  });
 }
}
</script>
</body>
</html>