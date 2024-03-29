<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Register</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<style>
</style>
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
		<form action="/todo/register" method="post">
			<div class="card-body">
				<div class="row mb-3">
					<label for="colFormLabel" class="col-sm-2 col-form-label">Tno</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="tno" value="${ read.tno }" readonly>
					</div>
				</div>
				<div class="row mb-3">
					<label for="colFormLabel" class="col-sm-2 col-form-label">Title</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="title" value="${ read.title }" readonly>
					</div>
				</div>
				<div class="row mb-3">
					<label for="colFormLabel" class="col-sm-2 col-form-label">DueDate</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" name="dueDate" value="${ read.dueDate }" readonly>
					</div>
				</div>
				<div class="row mb-3">
					<label for="colFormLabel" class="col-sm-2 col-form-label">Writer</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="writer" value="${ read.writer }" readonly>
					</div>
				</div>
				<div class="form-check float-start" style="margin-left: 2.5em;">
					<label class="form-check-label">Finished &nbsp;</label> <input type="checkbox" name="finished" style="margin-left: 4.7em;" ${ read.finished ? "checked" : "" } disabled>
				</div>
			</div>

			<div class="column float-end" style="margin: 1em 2em 0 0">
				<button type="submit" class="btn btn-outline-primary">Modify</button>
				<button type="button" class="btn btn-outline-danger">Cancel</button>
			</div>
		</form>
	</div>
	<script>
		document.querySelector(".btn-outline-primary").addEventListener("click", e => {
			e.preventDefault();
			e.stopPropagation();
			
			self.location="/todo/modify?tno=${read.tno}&${pageRequestDTO.link}";
		}, false)
	
		document.querySelector(".btn-outline-danger").addEventListener("click", e => {
			e.preventDefault();
			e.stopPropagation();
			
			self.location="/todo/list?${pageRequestDTO.link}";
		}, false)
	</script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>