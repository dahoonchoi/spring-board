<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="generator" content="Jekyll v3.8.5">
<title>로그인</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

</head>


<body class="bg-light">
	<div class="container"style="width: 800px; margin-top: 100px">
		<form class="form-signin" action="login.do" method="post">
			<div class="text-center mb-4">

				<h1 class="h3 mb-3 font-weight-normal">로그인</h1>

			</div>
			<div class="form-label-group">
				<input type="text" name="id" value="${user.id }" class="form-control"
					placeholder="Email address" required="" autofocus=""> <label
					for="inputEmail">ID</label>
			</div>
			<div class="form-label-group">
				<input type="password" name="password" value="${user.password }" class="form-control"
					placeholder="Password" required=""> <label
					for="inputPassword">Password</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
				in</button>

		</form>
	</div>

</body>
</html>