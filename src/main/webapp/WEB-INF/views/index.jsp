<%--
  Created by IntelliJ IDEA.
  User: pavelgladky
  Date: 13/02/2023
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">Smart <span>store</span></a>
        <div class="order-lg-last btn-group">
            <c:if test="${not empty user}">
            <a href="#" class="btn-cart dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="flaticon-shopping-bag"></span>
                <div class="d-flex justify-content-center align-items-center"><small>${cart.getCartItems().size()}</small></div>
            </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <c:forEach items="${cart.getCartItems()}" var="item" begin="0" end="2">
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
                <li class="nav-item"><a href="/account" class="nav-link">My Account</a></li>
                <li class="nav-item"><a href="#part1" class="nav-link">Contact</a></li>
            </ul>
        </div>
    </div>
</nav>
<%--NAV--%>

<div class="hero-wrap" style="background-image: url('/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-8 ftco-animate d-flex align-items-end">
                <div class="text w-100 text-center">
                    <h1 class="mb-4">Welcome to the <span>Smart store</span></h1>
                    <p><a href="/all" class="btn btn-white btn-outline-white py-2 px-4">Shop Now</a> </p>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="ftco-intro">
    <div class="container">
        <div class="row no-gutters">
            <div class="col-md-4 d-flex">
                <div class="intro d-lg-flex w-100 ftco-animate">
                    <div class="icon">
                        <span class="flaticon-support"></span>
                    </div>
                    <div class="text">
                        <h2>Online Support 24/7</h2>
                        <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex">
                <div class="intro color-1 d-lg-flex w-100 ftco-animate">
                    <div class="icon">
                        <span class="flaticon-cashback"></span>
                    </div>
                    <div class="text">
                        <h2>Money Back Guarantee</h2>
                        <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex">
                <div class="intro color-2 d-lg-flex w-100 ftco-animate">
                    <div class="icon">
                        <span class="flaticon-free-delivery"></span>
                    </div>
                    <div class="text">
                        <h2>Free Shipping &amp; Return</h2>
                        <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section ftco-no-pb">
    <div class="container">
        <div class="row">
            <div class="col-md-6 img img-3 d-flex justify-content-center align-items-center" style="background-image: url(images/about.jpg);">
            </div>
            <div class="col-md-6 wrap-about pl-md-5 ftco-animate py-5">
                <div class="heading-section">
                    <span class="subheading">NEW!</span>
                    <h2 class="mb-4">Laptop APPLE MacBook Air 2022 13.6</h2>

                    <p>Reach for reliability!
                        Hold on tight, because here's the reliably fast and ultralight MacBook Air. Designed to meet the expectations of its user and refined from every angle, it is an efficient solution for work, everyday activities and playing games. Experience the power of an improved generation of integrated circuits that offer even greater speed and energy efficiency.</p>
            </div>
        </div>
    </div>
</section>

<%--<section class="ftco-section ftco-no-pb">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-lg-2 col-md-4 ">--%>
<%--                <div class="sort w-100 text-center ftco-animate">--%>
<%--                    <div class="img" style="background-image: url(images/kind-1.jpg);"></div>--%>
<%--                    <h3>Brandy</h3>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-2 col-md-4 ">--%>
<%--                <div class="sort w-100 text-center ftco-animate">--%>
<%--                    <div class="img" style="background-image: url(images/kind-2.jpg);"></div>--%>
<%--                    <h3>Gin</h3>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-2 col-md-4 ">--%>
<%--                <div class="sort w-100 text-center ftco-animate">--%>
<%--                    <div class="img" style="background-image: url(images/kind-3.jpg);"></div>--%>
<%--                    <h3>Rum</h3>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-2 col-md-4 ">--%>
<%--                <div class="sort w-100 text-center ftco-animate">--%>
<%--                    <div class="img" style="background-image: url(images/kind-4.jpg);"></div>--%>
<%--                    <h3>Tequila</h3>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-2 col-md-4 ">--%>
<%--                <div class="sort w-100 text-center ftco-animate">--%>
<%--                    <div class="img" style="background-image: url(images/kind-5.jpg);"></div>--%>
<%--                    <h3>Vodka</h3>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-2 col-md-4 ">--%>
<%--                <div class="sort w-100 text-center ftco-animate">--%>
<%--                    <div class="img" style="background-image: url(images/kind-6.jpg);"></div>--%>
<%--                    <h3>Whiskey</h3>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center pb-5">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <span class="subheading">Our Delightful offerings</span>
                <h2>Bestseller</h2>
            </div>
        </div>
        <div class="row">
            <c:forEach var="product" items="${allProducts}" begin="0" end="9">
            <div class="col-md-3 d-flex">
                <div class="product ftco-animate">
                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/prod-${product.id}.jpg);">
                        <div class="desc">
                            <p class="meta-prod d-flex">
                                <a class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>--%>
                                <a href="/${product.id}" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>
                            </p>
                        </div>
                    </div>
                    <div class="text text-center">
                        <span class="category">${product.category.name}</span>
                        <h2>${product.name}</h2>
                        <p class="mb-0"><span class="price">$${product.price}</span></p>
                    </div>
                </div>
            </div>
            </c:forEach>
<%--            <div class="col-md-3 d-flex">--%>
<%--                <div class="product ftco-animate">--%>
<%--                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/prod-2.jpg);">--%>
<%--                        <div class="desc">--%>
<%--                            <p class="meta-prod d-flex">--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="text text-center">--%>
<%--                        <span class="category">laptop</span>--%>
<%--                        <h2>laptop</h2>--%>
<%--                        <span class="price">$69.00</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-3 d-flex">--%>
<%--                <div class="product ftco-animate">--%>
<%--                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/prod-3.jpg);">--%>
<%--                        <div class="desc">--%>
<%--                            <p class="meta-prod d-flex">--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="text text-center">--%>
<%--                        <span class="category">laptop</span>--%>
<%--                        <h2>laptop</h2>--%>
<%--                        <span class="price">$69.00</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-3 d-flex">--%>
<%--                <div class="product ftco-animate">--%>
<%--                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/prod-4.jpg);">--%>
<%--                        <div class="desc">--%>
<%--                            <p class="meta-prod d-flex">--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="text text-center">--%>
<%--                        <span class="category">laptop</span>--%>
<%--                        <h2>laptop</h2>--%>
<%--                        <span class="price">$69.00</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="col-md-3 d-flex">--%>
<%--                <div class="product ftco-animate">--%>
<%--                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/prod-5.jpg);">--%>
<%--                        <div class="desc">--%>
<%--                            <p class="meta-prod d-flex">--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="text text-center">--%>
<%--                        <span class="category">laptop</span>--%>
<%--                        <h2>laptop</h2>--%>
<%--                        <span class="price">$69.00</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-3 d-flex">--%>
<%--                <div class="product ftco-animate">--%>
<%--                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/prod-6.jpg);">--%>
<%--                        <div class="desc">--%>
<%--                            <p class="meta-prod d-flex">--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="text text-center">--%>
<%--                        <span class="category">laptop</span>--%>
<%--                        <h2>laptop</h2>--%>
<%--                        <span class="price">$69.00</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-3 d-flex">--%>
<%--                <div class="product ftco-animate">--%>
<%--                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/prod-7.jpg);">--%>
<%--                        <div class="desc">--%>
<%--                            <p class="meta-prod d-flex">--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="text text-center">--%>
<%--                        <span class="category">laptop</span>--%>
<%--                        <h2>laptop</h2>--%>
<%--                        <span class="price">$69.00</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-3 d-flex">--%>
<%--                <div class="product ftco-animate">--%>
<%--                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/prod-8.jpg);">--%>
<%--                        <div class="desc">--%>
<%--                            <p class="meta-prod d-flex">--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-shopping-bag"></span></a>--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-heart"></span></a>--%>
<%--                                <a href="#" class="d-flex align-items-center justify-content-center"><span class="flaticon-visibility"></span></a>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="text text-center">--%>
<%--                        <span class="category">laptop</span>--%>
<%--                        <h2>laptop</h2>--%>
<%--                        <span class="price">$69.00</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-4">
                <a href="/all" class="btn btn-primary d-block">View All Products <span class="fa fa-long-arrow-right"></span></a>
            </div>
        </div>
    </div>

</section>

<%--<section class="ftco-section testimony-section img" style="background-image: url(images/bg_4.jpg);">--%>
<%--    <div class="overlay"></div>--%>
<%--    <div class="container">--%>
<%--        <div class="row justify-content-center mb-5">--%>
<%--            <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">--%>
<%--                <span class="subheading">Testimonial</span>--%>
<%--                <h2 class="mb-3">Happy Clients</h2>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row ftco-animate">--%>
<%--            <div class="col-md-12">--%>
<%--                <div class="carousel-testimony owl-carousel ftco-owl">--%>
<%--                    <div class="item">--%>
<%--                        <div class="testimony-wrap py-4">--%>
<%--                            <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></div>--%>
<%--                            <div class="text">--%>
<%--                                <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>--%>
<%--                                <div class="d-flex align-items-center">--%>
<%--                                    <div class="user-img" style="background-image: url(images/person_1.jpg)"></div>--%>
<%--                                    <div class="pl-3">--%>
<%--                                        <p class="name">Roger Scott</p>--%>
<%--                                        <span class="position">Marketing Manager</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="item">--%>
<%--                        <div class="testimony-wrap py-4">--%>
<%--                            <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></div>--%>
<%--                            <div class="text">--%>
<%--                                <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>--%>
<%--                                <div class="d-flex align-items-center">--%>
<%--                                    <div class="user-img" style="background-image: url(images/person_2.jpg)"></div>--%>
<%--                                    <div class="pl-3">--%>
<%--                                        <p class="name">Roger Scott</p>--%>
<%--                                        <span class="position">Marketing Manager</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="item">--%>
<%--                        <div class="testimony-wrap py-4">--%>
<%--                            <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></div>--%>
<%--                            <div class="text">--%>
<%--                                <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>--%>
<%--                                <div class="d-flex align-items-center">--%>
<%--                                    <div class="user-img" style="background-image: url(images/person_3.jpg)"></div>--%>
<%--                                    <div class="pl-3">--%>
<%--                                        <p class="name">Roger Scott</p>--%>
<%--                                        <span class="position">Marketing Manager</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="item">--%>
<%--                        <div class="testimony-wrap py-4">--%>
<%--                            <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></div>--%>
<%--                            <div class="text">--%>
<%--                                <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>--%>
<%--                                <div class="d-flex align-items-center">--%>
<%--                                    <div class="user-img" style="background-image: url(images/person_1.jpg)"></div>--%>
<%--                                    <div class="pl-3">--%>
<%--                                        <p class="name">Roger Scott</p>--%>
<%--                                        <span class="position">Marketing Manager</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="item">--%>
<%--                        <div class="testimony-wrap py-4">--%>
<%--                            <div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></div>--%>
<%--                            <div class="text">--%>
<%--                                <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>--%>
<%--                                <div class="d-flex align-items-center">--%>
<%--                                    <div class="user-img" style="background-image: url(images/person_2.jpg)"></div>--%>
<%--                                    <div class="pl-3">--%>
<%--                                        <p class="name">Roger Scott</p>--%>
<%--                                        <span class="position">Marketing Manager</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>



<%--<section class="ftco-section">--%>
<%--    <div class="container">--%>
<%--        <div class="row justify-content-center mb-5">--%>
<%--            <div class="col-md-7 heading-section text-center ftco-animate">--%>
<%--                <span class="subheading">Blog</span>--%>
<%--                <h2>Recent Blog</h2>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row d-flex">--%>
<%--            <div class="col-lg-6 d-flex align-items-stretch ftco-animate">--%>
<%--                <div class="blog-entry d-flex">--%>
<%--                    <a href="blog-single.html" class="block-20 img" style="background-image: url('images/image_1.jpg');">--%>
<%--                    </a>--%>
<%--                    <div class="text p-4 bg-light">--%>
<%--                        <div class="meta">--%>
<%--                            <p><span class="fa fa-calendar"></span> 23 April 2020</p>--%>
<%--                        </div>--%>
<%--                        <h3 class="heading mb-3"><a href="#">The Recipe from a Winemaker’s Restaurent</a></h3>--%>
<%--                        <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>--%>
<%--                        <a href="#" class="btn-custom">Continue <span class="fa fa-long-arrow-right"></span></a>--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-6 d-flex align-items-stretch ftco-animate">--%>
<%--                <div class="blog-entry d-flex">--%>
<%--                    <a href="blog-single.html" class="block-20 img" style="background-image: url('images/image_2.jpg');">--%>
<%--                    </a>--%>
<%--                    <div class="text p-4 bg-light">--%>
<%--                        <div class="meta">--%>
<%--                            <p><span class="fa fa-calendar"></span> 23 April 2020</p>--%>
<%--                        </div>--%>
<%--                        <h3 class="heading mb-3"><a href="#">The Recipe from a Winemaker’s Restaurent</a></h3>--%>
<%--                        <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>--%>
<%--                        <a href="#" class="btn-custom">Continue <span class="fa fa-long-arrow-right"></span></a>--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-6 d-flex align-items-stretch ftco-animate">--%>
<%--                <div class="blog-entry d-flex">--%>
<%--                    <a href="blog-single.html" class="block-20 img" style="background-image: url('images/image_3.jpg');">--%>
<%--                    </a>--%>
<%--                    <div class="text p-4 bg-light">--%>
<%--                        <div class="meta">--%>
<%--                            <p><span class="fa fa-calendar"></span> 23 April 2020</p>--%>
<%--                        </div>--%>
<%--                        <h3 class="heading mb-3"><a href="#">The Recipe from a Winemaker’s Restaurent</a></h3>--%>
<%--                        <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>--%>
<%--                        <a href="#" class="btn-custom">Continue <span class="fa fa-long-arrow-right"></span></a>--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-6 d-flex align-items-stretch ftco-animate">--%>
<%--                <div class="blog-entry d-flex">--%>
<%--                    <a href="blog-single.html" class="block-20 img" style="background-image: url('images/image_4.jpg');">--%>
<%--                    </a>--%>
<%--                    <div class="text p-4 bg-light">--%>
<%--                        <div class="meta">--%>
<%--                            <p><span class="fa fa-calendar"></span> 23 April 2020</p>--%>
<%--                        </div>--%>
<%--                        <h3 class="heading mb-3"><a href="#">The Recipe from a Winemaker’s Restaurent</a></h3>--%>
<%--                        <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>--%>
<%--                        <a href="#" class="btn-custom">Continue <span class="fa fa-long-arrow-right"></span></a>--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<jsp:include page="footer.jsp"/>