<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><dec:title default="Trang-Chu" /></title>
<jsp:include page="/common/admin/common_css.jsp"></jsp:include>
</head>
<body>
	<!-- Header -->
	<jsp:include page="/common/admin/header.jsp" />
	<!-- Body -->
	<dec:body />

	<!-- Footer -->
	<jsp:include page="/common/admin/footer.jsp" />
	<script>
		/* When the user clicks on the button, 
		                                                                                                                                                                                                                                                                                                                                        toggle between hiding and showing the dropdown content */
		function myFunction() {
			document.getElementById("myDropdown").classList.toggle("show");
		}
	</script>
</body>

</html>