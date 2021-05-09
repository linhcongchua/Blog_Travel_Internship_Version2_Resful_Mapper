<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="APIurl" value="/api-admin-post" />
<c:url var="postURL" value="/admin-home" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
<c:choose>
	<c:when test="${not empty post }">
		Chinh Sua Post
	</c:when>
	<c:otherwise>
		Them Moi Post
	</c:otherwise>
</c:choose>
</title>
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<div class="flex p-center">
		<form class="col-6" id="formSubmit">
			<fieldset>
				<div>
					<label for="title" class="mid">Tieu De:</label> <input type="text"
						name="title" id="title" value="${post.title}" tabindex="1">
				</div>

				<div>
					<label for="shortDes" class="mid">Mo Ta Ngan:</label> <input
						type="text" name="shortDes" id="shortDes" value="${post.shortDes}"
						tabindex="2">
				</div>

				<div>
					<label for="categoryID" class="mid">Loai Post:</label> <select
						name="categoryID" id="categoryID">
						<c:forEach var="cate" items="${categories }">
							<option value="${cate.categoryID }">${cate.categoryName }</option>
						</c:forEach>
					</select>
				</div>

				<div>
					<label for="postContent">Noi dung:</label>
					<textarea cols="40" rows="10" name="postContent" id="postContent">${post.postContent}</textarea>
				</div>

				<div>
					<label for="thumbnail">Anh:</label> <input type="file"
						name="thumbnail" id="thumbnail" />
				</div>
				
				<input type="hidden" name="postID" class="postID" id="postID" value="${post.postID }"/>

				<div>
					<c:choose>
						<c:when test="${not empty post}">
							<input type="button" value="Chinh Sua" class="submit"
								id="btnSubmit">
						</c:when>
						<c:otherwise>
							<input type="button" value="Them" class="submit" id="btnSubmit">
						</c:otherwise>
					</c:choose>
				</div>

			</fieldset>
		</form>
		<div class="image-demo col-6">
			<img alt="" src="<c:url value="/template/image/banhmy.jpg"/>">
		</div>
	</div>
	<script type="text/javascript">
		$('#btnSubmit').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			var postID=$('#postID').val();
			if(postID==""){
				addPost(data);
			}else{
				updatePost(data);
			}
		});

		function addPost(data) {
			alert('add post');
			$.ajax({
						url : '${APIurl}',
						type : 'POST',
						contentType : 'application/json',
						data : JSON.stringify(data),
						dataType : 'json',
						success : function(result) {
							window.location.href = "${postURL}?type=update&id="
									+ result.id + "&message=insert_success";
						},
						error : function(error) {
							window.location.href = "${postURL}?type=list&message=error_system";
						}
					});
		}
		function updatePost(data) {
			alert('update post' +"PostID"+postID);
			$.ajax({
						url : '${APIurl}',
						type : 'PUT',
						contentType : 'application/json',
						data : JSON.stringify(data),
						dataType : 'json',
						success : function(result) {
							window.location.href = "${postURL}?type=update&id="
									+ result.id + "&message=update_success";
						},
						error : function(error) {
							window.location.href = "${postURL}?type=list&message=error_system";
						}
					});
		}
	</script>
</body>
</html>