<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Todo-List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
	<div class="card text-center">
		<div class="card-header">
			<ul class="nav nav-tabs card-header-tabs">
				<li class="nav-item"><a class="nav-link active" aria-current="true" href="#">Active</a></li>
				<li class="nav-item register"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item"><a class="nav-link disabled">Disabled</a></li>
			</ul>
		</div>
		<div class="row content">
			<div class="col">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title" style="text-align: start;">Search</h5>
						<form action="/todo/list" method="get" style="text-align: start;">
							<input type="hidden" name="size" value="${ pageRequestDTO.size }">
							<div class="mb-3">
								<input type="checkbox" name="finished" ${ pageRequestDTO.finished ? "checked" : "" }>완료여부
							</div>
							<div class="mb-3">
								<input type="checkbox" name="types" value="t" ${ pageRequestDTO.checkType("t") ? "checked" : "" } style="margin-bottom: 2em;">제목 <input type="checkbox" name="types" value="w" ${ pageRequestDTO.checkType("w") ? "checked" : "" }>작성자 <input type="text" name="keyword" class="form-control" value='<c:out value="${ pageRequestDTO.keyword }"/>'>
							</div>
							<div class="input-group mb-3 dueDateDiv">
								<input type="date" name="from" class="form-control" value="${ pageRequestDTO.from }"> <input type="date" name="to" class="form-control" value="${ pageRequestDTO.to }">
							</div>
							<div class="input-group mb-3">
								<div class="float-end" style="width: 100%;">
									<button class="btn btn-primary" type="submit">Search</button>
									<button class="btn btn-info" type="reset">Clear</button>
									<button type="button" class="btn btn-outline-primary float-end addbtn">Primary</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="row" style="justify-content: center;">
				<c:forEach items="${ responseDTO.dtoList }" var="dto">
					<div class="card" style="width: 17%; margin: 1em;">
						<div class="card-body">
							<h5 class="card-title">${ dto.dueDate }</h5>
							<p class="card-text">${ dto.title }</p>
							<a href="/todo/read?tno=${ dto.tno }&${ pageRequestDTO.link }" class="btn btn-primary" data-tno>Modify</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<nav aria-label="Page navigation example" style="display: flex; justify-content: center; margin-top: 0.5em;">
		<ul class="pagination">
			<c:if test="${ responseDTO.prev }">
				<li class="page-item"><a class="page-link" href="#" data-num="${ responseDTO.start - 1 }">Previous</a></li>
			</c:if>
			<c:forEach begin="${ responseDTO.start }" end="${ responseDTO.end }" var="num">
				<li class="page-item ${ responseDTO.page == num ? "active" : "" }"><a class="page-link" data-num="${ num }" href="#">${ num }</a></li>
			</c:forEach>
			<c:if test="${ responseDTO.next }">
				<li class="page-item"><a class="page-link" href="#" data-num="${ responseDTO.end + 1 }">Next</a></li>
			</c:if>
		</ul>
	</nav>
	<script>
		document.querySelector(".pagination").addEventListener("click", e => {
			e.preventDefault();
			e.stopPropagation();
			
			const target = e.target;
			
			if (target.tagName !== 'A') {
				return;
			}
			const num = target.getAttribute("data-num");
			
			// self.location = `/todo/list?page=\${num}`
					
			const formObj = document.querySelector("form");
			
			formObj.innerHTML += `<input type="hidden" name="page" value='\${num}'>`
			
			formObj.submit();
		}, false)
	
		document.querySelector(".addbtn").addEventListener("click", e => {
			e.preventDefault()
			e.stopPropagation();
			
			self.location="/todo/register"
		})
		
		document.querySelector(".btn-info").addEventListener("click", e => {
			e.preventDefault();
			e.stopPropagation();
			
			self.location="/todo/list";
		})
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>