<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List-Post</title>
</head>
<body>
	<div class="image-list-intro">
		<div class="overlay-content">
			<div class="contain-intro">
				<h1 class="text-white font-fatface">Blog listing</h1>
				<p class="text-white font-fatface">Day la phan intro adu</p>
			</div>
		</div>
	</div>
	<div class="list-container">
		<div class="list-content flex p5">
			<!-- List post -->
			<div class="col-8 flex list-post-row text-center">

				<c:forEach var="post" items="${posts }">
					<div class="col-6 p5">
						<a href="<c:url value="/post-view?postID=${post.postID}"/>"> <img
							class=" "
							src="<c:url value="/template/image/listing-tnumbnail-3.jpg"/>"
							alt="" />
						</a>
						<ul class="text-uppercase flex">
							<li class="text-gray">By</li>
							<li class=""><a class="font-weight-bold text-black" href="#">${post.author.fullname }</a></li>
							<li class="text-gray">|</li>
							<li class="text-gray">${post.createdDate }</li>
						</ul>
						<h3 class="h4 ">
							<a class="font-fatface text-black" href="<c:url value="/post-view?postID=${post.postID}"/>">${post.title }</a>
						</h3>
						<a class=" text-gray text-uppercase  mb-2 d-block" href="#">${post.category.categoryName }</a>
						<p class=" ">${post.shortDes }</p>
						<a class="btn btn-link text-yellow font-fatface"
							href="<c:url value="/post-view?postID=${post.postID}"/>">Continue
							reading</a>
					</div>
				</c:forEach>
			</div>
			<!-- Sidebar -->
			<div class="col-4 p5">
				<!-- About me widget -->
				<div class=" text-center">
					<div class="image-about">
						<img class="border-img"
							src="<c:url value="/template/image/author.jpg"/>" alt=""
							width="110">
					</div>
					<h3 class="font-fatface">About us</h3>
					<p class="  ">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit, sed do eiusmod.</p>
					<img class="d-block mx-auto " src="img/signature.png" alt=""
						width="60">
				</div>
				<!-- Latest posts widget -->
				<div class="">
					<h3 class="font-fatface">Latest posts</h3>
					<p class="text-gray">Lorem ipsum dolor sit, consectetur
						adipisicing elit, sed do eiusmod.</p>
					<ul class="list-unstyled">

						<c:forEach items="${top3 }" var="p">
							<li class="flex">
								<div class="img-latest-post col-4 margin5">
									<a href="<c:url value="/post-view?postID=${p.postID}"/>"><img
										src="<c:url value="/template/image/listing-tnumbnail-3.jpg"/>"
										alt=""></a>
								</div>
								<div class="content-latest-post col-8">
									<p class="text-yellow text-primary text-uppercase ">${p.createdDate }</p>
									<p class="">
										<a class="font-fatface text-black"
											href="<c:url value="/post-view?postID=${p.postID}"/>">${p.title }</a>
									</p>
									<p class="text-gray">${p.shortDes }</p>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>