<%@page import="com.springbook.biz.board.BoardVO"%>
<%@page import="com.springbook.biz.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 상세</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<nav
		class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
	<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="getBoardList.do">Board</a>
	<ul class="navbar-nav px-3">
		<li class="nav-item text-nowrap"><a class="nav-link"
			href="logout.do">Sign out</a></li>
	</ul>
	</nav>
	<div class="container-fluid" style="margin-top: 50px">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">

			<div class="sidebar-sticky">
				<div class="card">
					<div class="card-body">
						<span class="font-weight-light"><h4>${userName }</h4>님
							안녕하세요</span> <a href="logout.do" style="margin-top: 10%; float: right;"
							class="btn btn-outline-dark">Logout</a>
					</div>
				</div>
				<h6
					class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">

					<span>User</span> <a class="d-flex align-items-center text-muted"
						href="#"> <svg xmlns="http://www.w3.org/2000/svg" width="24"
							height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-plus-circle"> <circle cx="12"
							cy="12" r="10"></circle> <line x1="12" y1="8" x2="12" y2="16"></line>
						<line x1="8" y1="12" x2="16" y2="12"></line></svg>
					</a>
				</h6>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link active"
						href="getBoardList.do"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-home"> <path
								d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path> <polyline
								points="9 22 9 12 15 12 15 22"></polyline></svg> Dashboard <span
							class="sr-only">(current)</span>
					</a></li>

					<li class="nav-item"><a class="nav-link"
						href="insertBoard.jsp"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-file"> <path
								d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
							<polyline points="13 2 13 9 20 9"></polyline></svg> Create
					</a></li>

					<li class="nav-item"><a class="nav-link" href="#"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-users"> <path
								d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path> <circle
								cx="9" cy="7" r="4"></circle> <path
								d="M23 21v-2a4 4 0 0 0-3-3.87"></path> <path
								d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg> ${userName }님 정보
					</a></li>

				</ul>
			</div>
			</nav>


			<div class="col-md-8 order-md-1">

				<input name="seq" type="hidden" value="${board.seq }" />
				<div class="row" style="margin-top: 30px">
					<div class="col-md-5 mb-3">

						<label for="title">title: </label>
						<h3 class="mb-3">
							<label for="title">${board.title } </label>
						</h3>
					</div>

					<div style="padding-left: 300px">
						<br> <label for="firstName"><h4 class="mb-3">${board.writer }</h4></label>
					</div>

				</div>

				<div class="card border-dark mb-3" >
					<div class="card-header">Content</div>
					<div class="card-body text-dark">
						<p class="card-text"style="height: 400px">${board.content }</p>
					</div>
				</div>


				<div class="row">

					<div class="col-md-2 mb-3">


						<label for="Date">Date: ${board.regDate }</label>

					</div>
					<div class="col-md-2 mb-3">

						<label for="Date">views: ${board.cnt }</label>
					</div>

				</div>
				<div style="float: right;">
					<button type="button"
						onclick="location.href='changeBoard.do?seq=${board.seq }'"
						class="btn btn-secondary">수정</button>
				</div>

			</div>
		</div>
</body>
</html>