<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="header" class="flex">
	<div class="header-left col-4">
		<div class="image-logo">
			<img src="<c:url value="/template/image/logo.svg"/>" alt="logo" />
		</div>
	</div>
	<div class="col-4"></div>
	<div class="header-right col-4">
		<ul class="flex">
			<!-- 2 controller -->
			<!-- controller comment -->
			<li class="col-6">
				<button onclick="myFunction()" class="dropbtn green">Comment(5)</button>

				<ul class="dropdown-content" id="myDropdown">
					<li class="dropdown-header"><i class=""></i> 5 Messages</li>

					<li class="dropdown-middle">
						<ul class="dropdown-menu dropdown-navbar">
							<!-- danh sach comment -->
							<li><a href="#" class="clearfix"> <img
									src="assets/avatars/avatar.png" class="msg-photo"
									alt="Alex's Avatar" /> <span class="msg-body"> <span
										class="msg-title"> <span class="blue">Alex:</span> Ciao
											sociis natoque penatibus et auctor ...
									</span> <span class="msg-time"> <i
											class="ace-icon fa fa-clock-o"></i> <span>a moment ago</span>
									</span>
								</span>
							</a></li>

						</ul>
					</li>

					<li class="dropdown-footer"><a href="inbox.html"> See all
							messages <i class="ace-icon fa fa-arrow-right"></i>
					</a></li>
				</ul>
			</li>
			<!-- Profile -->
			<li class=" col-6">
				<button onclick="logOut()" class="dropbtn orange">Log Out</button>
			</li>
		</ul>
	</div>
</div>