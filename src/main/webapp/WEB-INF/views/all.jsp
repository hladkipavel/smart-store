<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: pavelgladky
  Date: 17/02/2023
  Time: 12:07
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="header.jsp"/>

<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
            <div class="col-md-9 ftco-animate mb-5 text-center">
                <p class="breadcrumbs mb-0"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>Products <i class="fa fa-chevron-right"></i></span></p>
                <h2 class="mb-0 bread">Products</h2>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="row mb-4">
                    <div class="col-md-12 d-flex justify-content-between align-items-center">
                        <h4 class="product-select">Products</h4>
<%--                        <select class="selectpicker" multiple>--%>
<%--                            <option>Brandy</option>--%>
<%--                            <option>Gin</option>--%>
<%--                            <option>Rum</option>--%>
<%--                            <option>Tequila</option>--%>
<%--                            <option>Vodka</option>--%>
<%--                            <option>Whiskey</option>--%>
<%--                        </select>--%>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="product" items="${products}">
                    <div class="col-md-4 d-flex">
                        <div class="product ftco-animate">
                            <div class="img d-flex align-items-center justify-content-center" style="background-image:
                                    url(images/prod-<c:out value="${product.id}"/>.jpg);">
                                <div class="desc">
                                    <p class="meta-prod d-flex">
                                    <form:form method="get" action="/cart/${product.id}" >
                                       <a href="/cart/${product.id}" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag">Add to cart</span></a>
<%--                                        <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>--%>
                                        <a href="/${product.id}" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility">View product</span></a>
                                    </p>
                                    </form:form>
                                </div>
                            </div>
                            <div class="text text-center">
                                <span class="category"><c:out value="${product.category.name}"/></span>
                                <h2><c:out value="${product.name}"/></h2>
                                <p class="mb-0"><span class="price">$<c:out value="${product.price}"/></span></p>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
                <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                <li><a href="#">&lt;</a></li>
                                <li class="active"><span>1</span></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">&gt;</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="sidebar-box ftco-animate">
                    <div class="categories">
                        <h3>Product category</h3>
                        <ul class="p-0">
                            <li><a href="#">Laptops <span class="fa fa-chevron-right"></span></a></li>
                            <li><a href="#">Tablets <span class="fa fa-chevron-right"></span></a></li>
                            <li><a href="#">Phones <span class="fa fa-chevron-right"></span></a></li>
                            <li><a href="#">Watches <span class="fa fa-chevron-right"></span></a></li>
                            <li><a href="#">Headphones <span class="fa fa-chevron-right"></span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"/>