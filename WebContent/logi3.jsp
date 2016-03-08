<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-color: olive;
}
</style>
</head>
<body>
<%
String i = ((String[])session.getAttribute("ilo"))[(int)session.getAttribute("n")];
%>
	<h1><%=i%></h1>
	
	<!--<img id="pointer_div" alt="picture1" src="Images/1.1.1.jpg">-->
	
	<form name="pointform" method="post" action="logi4.jsp">
		<div id="pointer_div" onclick="point_it(event)">
			<canvas id="myCanvas" width="500" height="500"></canvas>
		</div>
		<script>
			var canvas = document.getElementById('myCanvas');
			var context = canvas.getContext('2d');

			base_image = new Image();
			base_image.src = 'Images/<%=i%>.jpg';
			base_image.onload = function() {
				context.drawImage(base_image, 0, 0);
			}
			var centerX = Math.ceil(Math.random() * 500);
			var centerY = Math.ceil(Math.random() * 500);
			var radius = 150;

			context.beginPath();
			context.arc(centerX, centerY, radius, 0, 2 * Math.PI, false);
			//context.fillStyle = 'green';
			//context.fill();
			context.lineWidth = 1;
			context.strokeStyle = '#000000';
			context.stroke();
						function point_it(event) {
				pos_x = event.offsetX ? (event.offsetX) : event.pageX
						- document.getElementById("pointer_div").offsetLeft;
				pos_y = event.offsetY ? (event.offsetY) : event.pageY
						- document.getElementById("pointer_div").offsetTop;
				document.getElementById("pointer_div").style.left = (pos_x - 1);
				document.getElementById("pointer_div").style.top = (pos_y - 15);
				document.getElementById("pointer_div").style.visibility = "visible";
				
				
					document.pointform.form_x.value = pos_x;
					document.pointform.form_y.value = pos_y;
					document.save.form_x.value = pos_x;
					document.save.form_y.value = pos_y;
				
			}
			function clearForm() {
				document.save.form_x.value = "";
			}
		</script>
		<br> You pointed on x = <input type="text" name="form_x" size="4"
			required />
			 - y = <input type="text" name="form_y" size="4" required />
		<!-- <input type="hidden" value="<%=i%>" name="form_no" /> -->
		<input type="submit" value="Next" />
		<input type="reset" value="clear" onclick="clearForm()" />
	</form>
	<form method="post" action="logi6.jsp" name=save>
		<!-- <input type="hidden" name="password"
			value="<%=session.getAttribute("password")%>" />
			<input type="hidden" name="user"
			value="<%=session.getAttribute("thename")%>" />
			<input type="hidden" value="<%=i%>" name="form_no" /> -->
			<input type="hidden" name="form_x" size="4" />
			<input type="hidden" name="form_y" size="4" />
			<input type="submit" value="Save" />
	</form>  
</body>
</html>