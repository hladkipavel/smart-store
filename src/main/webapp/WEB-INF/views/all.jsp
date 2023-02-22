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
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">Smart <span>store</span></a>
        <div class="order-lg-last btn-group">
            <c:if test="${not empty user}">
                <a href="#" class="btn-cart dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="flaticon-shopping-bag"></span>
                    <div class="d-flex justify-content-center align-items-center"><small>${cart.countItems}</small></div>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <c:forEach items="${cart.getCartItems()}" var="item" begin="0" end="3">
                        <div class="dropdown-item d-flex align-items-start" href="#">
                            <div class="img" style="background-image: url(/images/prod-${item.product.id}.jpg);"></div>
                            <div class="text pl-3">
                                <h4>${item.product.name}</h4>
                                <p class="mb-0"><a href="#" class="price">$${item.product.price * item.count}</a><span class="quantity ml-3">Quantity: ${item.count}</span></p>
                            </div>
                        </div>
                    </c:forEach>
                    <a class="dropdown-item text-center btn-link d-block w-100" href="/cart-all">
                        View All
                        <span class="ion-ios-arrow-round-forward"></span>
                    </a>
                </div>
            </c:if>
        </div>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a href="/" class="nav-link">Home</a></li>
<%--                <li class="nav-item"><a href="/" class="nav-link">About</a></li>--%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Products</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="/all">Products</a>
                        <a class="dropdown-item" href="/cart-all">Cart</a>
                        <a class="dropdown-item" href="checkout.html">Checkout</a>
                    </div>
                </li>
                <li class="nav-item"><a href="" class="nav-link">My Account]</a></li>
                <li class="nav-item"><a href="#part1" class="nav-link">Contact</a></li>
            </ul>
        </div>
    </div>
</nav>

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
                                       <a href="/cart/${product.id}" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>
                                        <a href="/${product.id}" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>
                                    </p>
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
                            <c:forEach var="category" items="${categories}">
                            <li><a href="/find-by-category/${category.id}">${category.name} <span class="fa fa-chevron-right"></span></a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"/>