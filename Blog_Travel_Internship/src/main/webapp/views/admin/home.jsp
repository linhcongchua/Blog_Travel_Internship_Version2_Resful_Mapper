<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Content -->
	<div id="content" class="flex">
		<div class="nav-bar col-1">
			<ul class="list-category text-center">
				<c:forEach var="category" items="${categories }">
					<li class="item-category"><a
						href='<c:url value="/admin-home?categoryID=${category.categoryID }"/>'>${category.categoryName }</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="col-11 width100">
			<table border="1px">
				<thead>
					<tr>
						<th>Tieu De</th>
						<th>Mo ta</th>
						<th>Noi Dung</th>
						<th>Anh</th>
						<th>The Loai</th>
						<th>Tac Gia</th>
						<th>Ngay Tao</th>
						<th>Ngay Sua</th>
						<th>View</th>
						<th>Edit</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${posts}" var="post">
						<tr>
							<td>${post.title }</td>
							<td>${post.shortDes}</td>
							<td>${post.postContent }</td>
							<td>${post.thumbnail }</td>
							<td>${post.category.categoryID }</td>
							<td>${post.author.fullname }</td>
							<td>${post.createdDate }</td>
							<td>${post.createdDate }</td>
							<td><a
								href="<c:url value="/post-view">
							<c:param name="postID" value="${post.postID }"/>
								</c:url>">View</a></td>
							<td><a
								href="<c:url value="/admin-edit">
								<c:param name="action" value="edit-post"/>
							<c:param name="postID" value="${post.postID }"/>
								</c:url>">Edit</a></td>
						</tr>
					</c:forEach>

					<tr>
						<td colspan="10"><a
							href="<c:url value="/admin-edit">
						<c:param name="action" value="add-post"/>
					</c:url>">Them
								Post</a></td>
					</tr>

				</tbody>
			</table>
			<div class="contain-pagging">
				<ul class="pagination">
					<c:if test="${pagging.pageCurrent >1}">
						<li><a
							href="<c:url value="/admin-home">
						<c:param name="pageCurrent" value="${pagging.pageCurrent -1}"/>
						</c:url>"
							class="prev">< Prev</a></li>
					</c:if>


					<c:forEach begin="1" end="${pagging.numberPage }" var="page">
						<li
							class="pageNumber <c:if test="${page eq pagging.pageCurrent}">active</c:if>"><a
							href='<c:url value="/admin-home">
						<c:param name="pageCurrent" value="${page }"/>
						</c:url>'>${page }</a></li>
					</c:forEach>
					<c:if test="${pagging.pageCurrent <pagging.numberPage}">
						<li><a
							href="<c:url value="/admin-home">
						<c:param name="pageCurrent" value="${pagging.pageCurrent +1}"/>
						</c:url>"
							class="next">Next ></a></li>
					</c:if>
				</ul>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		function logOut() {
			window.location.href = '<c:url value="/trang-chu?action=logout"/>';
		}
	</script>
</body>
</html>