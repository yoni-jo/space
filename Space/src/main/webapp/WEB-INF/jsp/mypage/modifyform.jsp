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
<title>welcome space</title>
<style type="text/css">
   /* 공통적용사항 */
   *{margin:0}
   html,body{height: 100%;}
   h1{padding-top: 30px;text-align: center}
#mypagemenubar{float:left}   

    li{list-style: none;cursor: pointer;text-align: center;}
    a{text-decoration: none;color:black}
    #wrap{border: 1px soild}


/*contents  */
#contents{width: 100%;height:100%;}

</style>
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