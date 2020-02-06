<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Q&A</title>

<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author"					 CONTENT="">
<META NAME="Keywords" 			CONTENT="">
<META NAME="Description" CONTENT="">
</HEAD>
<SCRIPT LANGUAGE="JavaScript">
<!--
function show_answer(q, a) {
var tagName = "";
var id = "";

for(var obj in document.all) {
tagName = document.all[obj].tagName;
id = document.all[obj].id;
if (tagName == "DIV") {
if (!id.indexOf("A")) document.all[obj].style.display = "none";
if (!id.indexOf("Q")) document.all[obj].style.display = "block";
}
}
q.style.display = "none";
a.style.display = "block";

}
//-->
</SCRIPT>
<BODY>
<TABLE>
<TR>
<th>공간명</th><th width="250px">제목</th><th>진행상황</th><th>관리</th>
</TR>
</TABLE>


<div id=Q0>
<TABLE>
<TR>
<TD><onFocus=this.blur() class='bbs'>공간명</TD>
<TD width="250px"><a href='javascript:show_answer(document.all.Q0, document.all.A0)' onFocus=this.blur() class='bbs'>제목</a></TD>
<TD><onFocus=this.blur() class='bbs'>진행상황링크</TD>
<TD><a href='anywhere' onFocus=this.blur() class='bbs'>답변</a>
	<a href='anywhere' onFocus=this.blur() class='bbs'>삭제요청</a></TD>
</TR>
</TABLE>
</div>

<div id=A0 style='DISPLAY: none'>
<TABLE>
<TR>
<TD><onFocus=this.blur() class='bbs'>공간명</TD>
<TD width="250px"><a href='javascript:show_answer(document.all.Q0, document.all.A0)' onFocus=this.blur() class='bbs'>제목</a></TD>
<TD><onFocus=this.blur() class='bbs'>진행상황링크</TD>
<TD><a href='anywhere' onFocus=this.blur() class='bbs'>답변</a>
	<a href='anywhere' onFocus=this.blur() class='bbs'>삭제요청</a></TD>
</TR>
<TR>
<td colspan="5">질문내용질문내용질문내용질문내용질문내용질문내용</TD><td></td>
</TR>
<div style="text-align:right"><tr><td><a href='somewhere'>답변하기</a></td></tr></div>
</TABLE>
</div>

<div id=Q1>
<TABLE>
<TR>
<TD><onFocus=this.blur() class='bbs'>공간명</TD>
<TD width="250px"><a href='javascript:show_answer(document.all.Q1, document.all.A1)' onFocus=this.blur() class='bbs'>제목</a></TD>
<TD><onFocus=this.blur() class='bbs'>진행상황링크</TD>
<TD><a href='anywhere' onFocus=this.blur() class='bbs'>답변</a></TD>
<TD><a href='anywhere' onFocus=this.blur() class='bbs'>삭제요청</a></TD>
</TR>
</TABLE>
</div>
<div id=A1 style='DISPLAY: none'>
<TABLE>
<TR>
<TD><onFocus=this.blur() class='bbs'>공간명</TD>
<TD width="250px"><a href='javascript:show_answer(document.all.Q1, document.all.A1)' onFocus=this.blur() class='bbs'>제목</a></TD>
<TD><onFocus=this.blur() class='bbs'>진행상황링크</TD>
<TD><a href='anywhere' onFocus=this.blur() class='bbs'>답변</a></TD>
<TD><a href='anywhere' onFocus=this.blur() class='bbs'>삭제요청</a></TD>
</TR>
<TR>
<td colspan="5">질문내용질문내용질문내용질문내용질문내용질문내용</TD>
</TR>
</TABLE>
</div>

</BODY>
</HTML>