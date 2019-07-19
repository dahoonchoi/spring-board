<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 목록</title>
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
					<li class="nav-item"><a class="nav-link active" href="getBoardList.do">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
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

			<div style="width: 80%">

				<form action="getBoardList.do" method="post">
					<div class="input-group">
						<input type="text" class="form-control" name="searchKeyword"
							placeholder="insert title and content"
							aria-label="Recipient's username with two button addons"
							aria-describedby="button-addon4">
						<div class="input-group-append" id="button-addon4">
							<select class="custom-select" name="searchCondition">
								<c:forEach items="${conditionMap }" var="option">

									<option value="${option.value }">${option.key }</option>
								</c:forEach>
							</select>
							<button class="btn btn-outline-secondary" type="submit">Search</button>
						</div>
					</div>
				</form>
				<!-- 변수지정시 소문자 대문자 차이있음 -->
				<table class="table"
					style="text-align: center; width: 100%; margin-top: 20px">
					<thead class="thead-dark">
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>

					<c:forEach items="${boardList }" var="board">
						<tr>
							<td>${board.seq }</td>
							<td><a href="getBoard.do?seq=${board.seq }">
									${board.title }</a></td>
							<td>${board.writer }</td>
							<td>${board.regDate }</td>
							<td>${board.cnt }</td>
						</tr>
					</c:forEach>
				</table>

			</div>
		</div>
	</div>

</body>
</html>