<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="../common/head.jsp"	/>
		<link
			  href="https://cdn.jsdelivr.net/npm/quill@2/dist/quill.snow.css"
			  rel="stylesheet"
			/>
	</head>
	<body class="bg-dark d-flex flex-column min-vh-100 gothic-a1-regular">
		<jsp:include page="../common/header.jsp"/>
		<div class="m-5">
		<hr>
		</div>
		<div class="pathway row bg-light m-5">
			<div id="toolbar">
			  <button class="ql-bold">Bold</button>
			  <button class="ql-italic">Italic</button>
			</div>
			<div id="editor">
			  <p>Hello World!</p>
			  <p>Some initial <strong>bold</strong> text</p>
			  <p><br /></p>
			</div>
			<script src="https://cdn.jsdelivr.net/npm/quill@2/dist/quill.js"></script>
			
			<!-- Initialize Quill editor -->
			<script>
			  const quill = new Quill("#editor", {
			    theme: "snow",
			  });
			</script>
		</div>

	</body>
</html>