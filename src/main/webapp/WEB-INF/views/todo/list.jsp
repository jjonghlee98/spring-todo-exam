<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Todo-List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<style>
</style>
</head>
<body>
	<div class="card text-center">
		<div class="card-header">
			<ul class="nav nav-tabs card-header-tabs">
				<li class="nav-item"><a class="nav-link active"
					aria-current="true" href="#">Active</a></li>
				<li class="nav-item register"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item"><a class="nav-link disabled">Disabled</a>
				</li>
			</ul>
		</div>
		<div class="card-body">
			<div class="row" style="justify-content: center;">
				<c:forEach items="${ responseDTO.dtoList }" var="dto">
					<div class="card" style="width: 17%; margin: 1em;">
						<div class="card-body">
							<h5 class="card-title">${ dto.dueDate }</h5>
							<p class="card-text">${ dto.title }</p>
							<a href="/todo/read?tno=${ dto.tno }&${ pageRequestDTO.link }"
								class="btn btn-primary" data-tno>Modify</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<nav aria-label="Page navigation example"
		style="display: flex; justify-content: center; margin-top: 0.5em;">
		<ul class="pagination">
			<c:if test="${ responseDTO.prev }">
				<li class="page-item"><a class="page-link" href="#"
					data-num="${ responseDTO.start - 1 }">Previous</a></li>
			</c:if>
			<c:forEach begin="${ responseDTO.start }" end="${ responseDTO.end }"
				var="num">
				<li class="page-item ${ responseDTO.page == num ? "active" : "" }">
					<a class="page-link" data-num="${ num }" href="#">${ num }</a>
				</li>
			</c:forEach>
			<c:if test="${ responseDTO.next }">
				<li class="page-item"><a class="page-link" href="#"
					data-num="${ responseDTO.end + 1 }">Next</a></li>
			</c:if>
		</ul>
	</nav>
	<button type="button" class="btn btn-outline-primary float-end addbtn"
		style="margin: 0em 2em 0 0">Primary</button>
	<script>
		document.querySelector(".pagination").addEventListener("click", e => {
			e.preventDefault();
			e.stopPropagation();
			
			const target = e.target;
			
			if (target.tagName !== 'A') {
				return;
			}
			const num = target.getAttribute("data-num");
			
			self.location = `/todo/list?page=\${num}`
		}, false)
	
		document.querySelector(".addbtn").addEventListener("click", e => {
			e.preventDefault()
			
			self.location="/todo/register"
		})
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>