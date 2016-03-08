<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbaccess.jsp"%>
<!DOCTYPE html >
<html>
<head>
<style type="text/css">
body {
	background-color: olive;
}
</style>
</head>
<body>
	<!-- You are about to start your project!  -->
	<%
		Actor actor = new Actor();
	String username = session.getAttribute("thename").toString();
		if (actor.getUser(username).next()) {
			System.out.println("haha into the if");
			session.setAttribute("message", "User Name already exists");
			System.out.println(session.getAttribute("message"));
			response.sendRedirect("index.jsp");
		}
		Integer i = (int) (Math.random() * 10);
	%>
	<h1><%=i%></h1>


	<!--<img id="pointer_div" alt="picture1" src="Images/1.1.1.jpg">-->


	<form name="pointform" method="post" action="regi2.jsp">
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
			one();

			function one() {
				setTimeout(function() {
					context.lineWidth = 1;
					context.strokeStyle = '#C77DF3';
					context.stroke();
					two();
				}, 100);
			}
			function two() {
				setTimeout(function() {
					context.lineWidth = 1;
					context.strokeStyle = '#8A2BE2';
					context.stroke();
					three();
				}, 100);
			}
			function three() {
				setTimeout(function() {
					context.lineWidth = 1;
					context.strokeStyle = '#0000FF';
					context.stroke();
					four();
				}, 100);
			}
			function four() {
				setTimeout(function() {
					context.lineWidth = 1;
					context.strokeStyle = '#00FF00';
					context.stroke();
					five();
				}, 100);
			}
			function five() {
				setTimeout(function() {
					context.lineWidth = 1;
					context.strokeStyle = '#FFDD00';
					context.stroke();
					six();
				}, 100);
			}
			function six() {
				setTimeout(function() {
					context.lineWidth = 1;
					context.strokeStyle = '#FF7700';
					context.stroke();
					seven();
				}, 100);
			}
			function seven() {
				setTimeout(function() {
					context.lineWidth = 1;
					context.strokeStyle = '#FF0000';
					context.stroke();
					white();
				}, 100);
			}
			function white() {
				setTimeout(function() {
					context.lineWidth = 1;
					context.strokeStyle = '#FFFFFF';
					context.stroke();
					one();
				}, 100);
			}

			function point_it(event) {
				pos_x = event.offsetX ? (event.offsetX) : event.pageX
						- document.getElementById("pointer_div").offsetLeft;
				pos_y = event.offsetY ? (event.offsetY) : event.pageY
						- document.getElementById("pointer_div").offsetTop;
				document.getElementById("pointer_div").style.left = (pos_x - 1);
				document.getElementById("pointer_div").style.top = (pos_y - 15);
				document.getElementById("pointer_div").style.visibility = "visible";
				var a = pos_x - centerX;
				var b = pos_y - centerY;
				var c = Math.sqrt(a * a + b * b);
				if (c < 150 && pos_x < 500 && pos_y < 500) {
					document.pointform.form_x.value = pos_x;
					document.pointform.form_y.value = pos_y;
					document.save.form_x.value = pos_x;
					document.save.form_y.value = pos_y;
				}
			}
			function clearForm() {
				document.save.form_x.value = "";
			}
		</script>
		<br>
		You pointed on x = <input type="text" name="form_x" size="4" required />
		- y = <input type="text" name="form_y" size="4" required />
		<input type="hidden" value="<%=i%>" name="form_no" />
		<input type="submit" value="Next" />
		<input type="reset" value="clear" onclick="clearForm()" />
	</form>
	<form method="post" action="regi3.jsp" name=save>
		<input type="hidden" name="password" value="<%=session.getAttribute("password")%>" />
		<input type="hidden" name="user" value="<%=session.getAttribute("thename")%>" />
		<input type="hidden" name="form_x" size="4" />
		<input type="hidden" name="form_y" size="4" />
		<input type="hidden" value="<%=i%>" name="form_no" />
		<input type="submit" value="Save" />
	</form>
</body>
</html>