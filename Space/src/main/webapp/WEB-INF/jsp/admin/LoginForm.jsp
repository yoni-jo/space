<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 로그인 페이지</title>
<!-- include file -->


</head>
<body>
<center>
<h2>관리자 로그인</h2>
</center>
<form action="/space/admin/LoginCheck" name="form1" method="post" >
<table border="3" width="400px" align="center">
<tr>
<td>ID</td>
<td><input type="text" name="USER_ID" id="USER_ID" size="20" placeholder=" ID를 입력하세요."></td>
</tr>

<tr>
<td>PW</td>
<td><input type="password" name="USER_PASSWORD" id="USER_PASSWORD" size="21" placeholder=" 비밀번호를 입력하세요."></td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="로그인">
<c:if test="${msg == 'failure'}">
</c:if>

<div class="row">
<div class="col-xs-8">
<div class="checkbox icheck">
<label>
<input type="checkbox" name="useCookie">로그인 유지
</label>
</div>
</div>
</div>

</td>
</tr>
</table>
</form>
</body>
</html>