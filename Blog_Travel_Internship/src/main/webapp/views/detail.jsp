<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Detail</title>
</head>
<body>
	<div class="container text-center">
		<p class="text-yellow text-uppercase">${post.category.categoryName }</p>
		<h1 class="font-fatface">${post.title }</h1>
		<p class="">Lorem ipsum dolor sit amet, consectetur adipisicing
			elit. Quis aliquid</p>
		<ul class=" text-uppercase flex">
			<li class="text-gray">By</li>
			<li class=" "><a class="text-black" href="# ">${post.category.categoryName }</a></li>
			<li class="text-gray">|</li>
			<li class="text-gray">${post.createdDate}</li>
			<li class="text-gray">|</li>
			<li class="text-gray">20 Comments</li>
		</ul>
		<img class=" " src='<c:url value="/template/image/post-banner.jpg"/>'
			alt=" " width="40 " />
	</div>

	<div class="list-container ">
		<div class="list-content flex p5 ">
			<!-- Detail post -->
			<div class="col-8 list-post-row">

				<div class="post-content">${post.postContent}</div>
				<!-- Comment -->
				<h3 class="h4 mb-4">Leave a comment</h3>
				<form class="mb-5" action="#">
					<div class="row">
						<div class="form-group col-lg-6">
							<input class="form-control" type="text" name="name"
								placeholder="Full Name e.g. Jason Doe">
						</div>
						<div class="form-group col-lg-6">
							<input class="form-control" type="email" name="email"
								placeholder="Email Address e.g. Jason@email.com">
						</div>
						<div class="form-group col-lg-12">
							<textarea class="form-control" name="message" rows="5"
								placeholder="Leave your message"></textarea>
						</div>
						<div class="form-group col-lg-12">
							<button class="btn-submit-comment btn-dark" type="submit">Submit
								your comment</button>
						</div>
					</div>
				</form>

				<h3 class="h4 mb-4 d-flex align-items-center">
					<span>Comments</span><span class="text-small ml-3 text-gray">-
						3 Comments</span>
				</h3>
				<ul class="list-unstyled comments">
					<li>
						<div class="flex mb-4">
							<div class="pr-2 flex-grow-1"
								style="width: 75px; min-width: 75px;">
								<img class="rounded-circle shadow-sm img-fluid img-thumbnail"
									src="../image/person-1.jpg" alt="">
							</div>
							<div class="pl-2">
								<p class="text-yellow">15 Aug 2019</p>
								<h5 class="font-fatface">Jimmy Roy</h5>
								<p class="text-muted text-small mb-2">Lorem ipsum dolor sit
									amet, consetetur sadipscing elitr, sed diam nonumy eirmod
									tempor invidunt ut labore et dolore magna aliquyam erat, sed
									diam voluptua. At.</p>
							</div>
						</div>
					</li>
					<li>
						<div class="flex mb-4">
							<div class="pr-2 flex-grow-1"
								style="width: 75px; min-width: 75px;">
								<img class="rounded-circle shadow-sm img-fluid img-thumbnail"
									src="../image/person-1.jpg" alt="">
							</div>
							<div class="pl-2">
								<p class="text-yellow">15 Aug 2019</p>
								<h5 class="font-fatface">Jimmy Roy</h5>
								<p class="text-muted text-small mb-2">Lorem ipsum dolor sit
									amet, consetetur sadipscing elitr, sed diam nonumy eirmod
									tempor invidunt ut labore et dolore magna aliquyam erat, sed
									diam voluptua. At.</p>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<!-- Sidebar -->
			<div class="col-4 p5 ">
				<!-- About me widget -->
				<div class=" text-center ">
					<div class="image-about ">
						<img class="rounded-circle img-thumbnail"
							src="../image/author.jpg " alt=" " width="110 ">
					</div>
					<h3 class="font-fatface ">About me</h3>
					<p class=" ">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit, sed do eiusmod.</p>
					<img class="d-block mx-auto " src="img/signature.png " alt=" "
						width="60 ">
				</div>
				<!-- Latest posts widget -->
				<div class=" ">
					<h3 class="font-fatface ">Latest posts</h3>
					<p class="text-gray ">Lorem ipsum dolor sit, consectetur
						adipisicing elit, sed do eiusmod.</p>
					<ul class="list-unstyled ">
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