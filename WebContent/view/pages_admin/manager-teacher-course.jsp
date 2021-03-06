<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url value="/view/assets/admin/images" var="url"></c:url>
<c:url value="/view/assets/img_course" var="url_course"></c:url>
<c:url value="/view/assets/img_teacher" var="url_teacher"></c:url>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/view/Html/admin/Head.jsp" />
<body>
	<div id="loading">
		<div id="loading-center"></div>
	</div>
	<div class="wrapper">
		<jsp:include page="/view/components/SideBarAdmin.jsp" />
		<div id="content-page" class="content-page">
			<jsp:include page="/view/components/HeaderAdmin.jsp" />

			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12">
						<div class="iq-card">
							<div class="iq-card-header d-flex justify-content-between">
								<div class="iq-header-title">
									<h4 class="card-title">
										<img src="${url}/language/uk_big.png" alt=""
											style="margin-right: 10px;">Teacher course
									</h4>
								</div>
							</div>
							<c:if test="${alertMsg != null}">
								<div id="alertMsg" style="display: none">${alertMsg}</div>
							</c:if>
							<div class="iq-card-body">
								<div id="table" class="table-editable">
									<div class="iq-search-bar float-right mb-3 mr-2">
										<form action="/Elearning_FE/admin/chi-tiet-giao-vien?search"
											class="searchbox" method="GET">
											<input type="text" class="text search-input" name="name" value="${search}"
												placeholder="Type here to search...">
											<button type="submit" style="display: contents">
												<a class="search-link"><i class="ri-search-line"></i></a>
											</button>
										</form>
									</div>

									<table
										class="table table-bordered table-responsive-md table-striped text-center">
										<thead>
											<tr>
												<th>Index</th>
												<th>Name</th>
												<th>Description</th>
												<th>The number of student</th>
												<th>Course name</th>
												<th>Picture</th>
												<th>Function</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${listGiaoVienKhoaHoc}" var="item"
												varStatus="vs">
												<tr>
													<td contenteditable="true">${15*(page-1) + vs.count}</td>
													<td contenteditable="true">${item.getTenGiaoVien()}</td>
													<td contenteditable="true">${item.getMoTa()}</td>
													<td contenteditable="true">${item.getSoLuongHV()}</td>
													<td contenteditable="true">${item.getTenKhoaHoc()}</td>
													<td contenteditable="true"><img class="img-fuild"
														src=" ${url_course}/${item.getHinhAnh_kh()}" width="120"
														height="70" /></td>
													<td><span class="table-remove">
															<button type="button" class="btn btn-warning"
																data-toggle="modal"
																data-target="#TeacherCourse${vs.index}">
																<i class="fa fa-wrench" aria-hidden="true"
																	style="display: initial"></i>Details
															</button>
													</span></td>
												</tr>
												<div class="modal fade" id="TeacherCourse${vs.index}"
													tabindex="-1" role="dialog"
													aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">
																	Information</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<form action="/Elearning_FE/admin/teacher/edit"
																	method="POST">
																	<div class="form-group d-flex justify-content-between">
																		<div>
																			<label for="tenKhoaHoc">Teacher name</label> <input
																				type="text" class="form-control"
																				value="${item.getTenGiaoVien()}">
																		</div>
																		<img class="img-fuild"
																			src=" ${url_teacher}/${item.getHinhAnh_gv()}"
																			width="80" height="70" />

																	</div>
																	<div class="form-group">
																		<label for="moTa">Description</label> <input
																			type="text" class="form-control"
																			value="${item.getMoTa()}">
																	</div>
																	<div class="form-group">
																		<label for="luotXem">Number of courses</label> <input
																			type="number" class="form-control"
																			value="${item.getSoLuongKH()}">
																	</div>
																	<div class="form-group">
																		<label for="xepHang">The number of student</label> <input
																			type="number" class="form-control"
																			value="${item.getSoLuongHV()}">
																	</div>

																	<div class="form-group d-flex justify-content-between">
																		<div>
																			<label for="tenKhoaHoc">Course name</label> <input
																				type="text" class="form-control"
																				value="${item.getTenKhoaHoc()}">
																		</div>
																		<img class="img-fuild"
																			src="${url_course}/${item.getHinhAnh_kh()}"
																			width="120" height="70" />

																	</div>
																	<div class="form-group">
																		<label for="xepHang">View</label> <input type="number"
																			class="form-control" value="${item.getLuotXem()}">
																	</div>
																	<div class="form-group">
																		<label for="xepHang">Teacher ratings</label> <input
																			type="number" class="form-control"
																			value="${item.getXepHang_gv()}">
																	</div>
																	<div class="form-group text-right mb-0">
																		<button type="button" class="btn btn-secondary"
																			data-dismiss="modal">Close</button>
																	</div>
																</form>
															</div>
														</div>
													</div>
												</div>

											</c:forEach>
										</tbody>
									</table>
									<c:if test="${search == null}">
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-end">
												<c:choose>
													<c:when test="${page == 1}">
														<li class="page-item"><a class="page-link" href="#"
															aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
														</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link"
															href="/Elearning_FE/admin/chi-tiet-giao-vien?page=${page - 1}"
															aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
														</a></li>
													</c:otherwise>
												</c:choose>
												<c:forEach items="${numberPage}" var="number">
													<li
														class="page-item <c:if test="${page == number}">active</c:if>"><a
														class="page-link"
														href="/Elearning_FE/admin/chi-tiet-giao-vien?page=${number}">${number}</a></li>
												</c:forEach>
												<c:choose>
													<c:when test="${page == count}">
														<li class="page-item"><a class="page-link" href="#"
															aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
														</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link"
															href="/Elearning_FE/admin/chi-tiet-giao-vien?page=${page + 1}"
															aria-label="Previous"> <span aria-hidden="true">&raquo;</span>
														</a></li>
													</c:otherwise>
												</c:choose>
											</ul>
										</nav>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<jsp:include page="/view/components/FooterAdmin.jsp" />
		</div>
	</div>
	<jsp:include page="/view/Html/admin/Script.jsp" />
	<script>
		$(window).on("load", function() {
			console.log($("#alertMsg"));
			if ($("#alertMsg").length) {
				swal({
					title : $("#alertMsg").html(),
					text : "Would you like to go back?",
					icon : "warning",

					dangerMode : true,
				}).then((willDelete) => {
			         if (willDelete) {
				            window.location.href = `/Elearning_FE/admin/chi-tiet-giao-vien`;
				         }
				      });
			}
		})
	</script>
</body>
</html>