<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/tablib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Content -->
	<div class="content">
		<div class="slide-ah">
			<div class="slideshow-container">

				<div class="mySlides fade">
					<div class="numbertext">1 / 3</div>
					<img src="<c:url value='/template/image/hoian.jpg'/>"
						style="width: 100%">
					<div class="text">Caption Text</div>
				</div>

				<div class="mySlides fade">
					<div class="numbertext">2 / 3</div>
					<img src="<c:url value='/template/image/banhmy.jpg'/>"
						style="width: 100%">
					<div class="text">Caption Two</div>
				</div>

				<div class="mySlides fade">
					<div class="numbertext">3 / 3</div>
					<img src="<c:url value='/template/image/banhmy.jpg'/>"
						style="width: 100%">
					<div class="text">Caption Three</div>
				</div>

				<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
					class="next" onclick="plusSlides(1)">&#10095;</a>

			</div>
			<br>

			<div style="text-align: center">
				<span class="dot" onclick="currentSlide(1)"></span> <span
					class="dot" onclick="currentSlide(2)"></span> <span class="dot"
					onclick="currentSlide(3)"></span>
			</div>
		</div>

		<div class="container py-4">
			<!-- Home listing -->
			<div class="flex highlight-post">
				<div class="col-6">
					<p class="text-primary font-weight-bold small text-uppercase mb-2">Travel
						guide</p>
					<h3 class="h4">
						<a class="text-reset" href="post.html">Book to inspire your
							travel</a>
					</h3>
					<p class="text-muted text-small mb-3">Lorem ipsum dolor sit
						amet, consectetur adipisicing elit. Excepturi quam nobis autem
						voluptate illum beatae atque suscipit inventore tenetur,
						perferendis facere sequi optio laudantium obcaecati aliquam,
						dolores ea. Pariatur, repellendus.</p>
					<p class="text-muted text-small mb-3">Lorem ipsum dolor sit
						amet, consectetur adipisicing elit. Excepturi quam nobis autem
						voluptate illum beatae atque suscipit inventore tenetur,
						perferendis facere sequi optio laudantium obcaecati aliquam,
						dolores ea. Pariatur, repellendus.</p>
					<ul class="flex">
						<li class="list-inline-item align-middle"><img
							class="rounded-circle shadow-sm" src="../image/person-1.jpg"
							alt="" width="30" /></li>
						<li class="list-inline-item mr-0 text-gray align-middle">By</li>
						<li class="list-inline-item align-middle mr-0"><a
							class="font-weight-bold reset-anchor" href="#">Jason Doe</a></li>
						<li class="list-inline-item text-gray align-middle mr-0">|</li>
						<li class="list-inline-item text-gray align-middle">Jan, 2019</li>
					</ul>
				</div>
				<div class="col-6">
					<img src="<c:url value='/template/image/travel-home-divider.jpg'/>" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>