<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<!--폰트설정  -->
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato|Nanum+Gothic|Noto+Sans|Noto+Sans+KR|Open+Sans&display=swap" rel="stylesheet">
<title>welcome space</title>

<style type="text/css"> 
 /*font설정  */

   /* 공통적용사항 */
   *{margin:0;font-family: 'Jeju Gothic', sans-serif;font-family: 'Nanum Gothic', sans-serif;
font-family: 'Open Sans', sans-serif;
font-family: 'Lato', sans-serif;
font-family: 'Noto Sans', sans-serif;
font-family: 'Noto Sans KR', sans-serif;}

   html,body{height: 100%;}
   h1{padding-top: 30px;text-align: center}
   li{list-style: none;cursor: pointer;text-align: center;}
   a{text-decoration: none;color:black}
   #wrap{border: 1px soild}
/*contents  */
#contents{width: 100%;height:100%;margin-bottom:100px}
/*footer  */
#footer {text-align: center;bottom:0;position:fixed;width: 100%;font: 20px;background: white;}

</style>

</head>
<body>
<div id="wrap">
			<div id="header">
				<tiles:insertAttribute name="header" />
			</div>
				<div id="mypagemenubar">
			
			<tiles:insertAttribute name="nav" />
		
</div>
		<div id="contents">
			<tiles:insertAttribute name="contents" /> 
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		
	</div>
	</div>


	</body>
	</html>