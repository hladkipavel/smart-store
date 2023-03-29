<%--
  Created by IntelliJ IDEA.
  User: pavelgladky
  Date: 18/02/2023
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="/homepage">Smart <span>store</span></a>
        <div class="order-lg-last btn-group">
            <c:if test="${not empty user}">
                <a href="#" id="dropdown" class="btn-cart dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                <%--        <li class="nav-item"><a href="/" class="nav-link">About</a></li>--%>
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
                <li class="nav-item"><a href="" class="nav-link">My Account</a></li>
                <li class="nav-item"><a href="#part1" class="nav-link">Contact</a></li>
            </ul>
        </div>
    </div>
</nav>
<section class="hero-wrap hero-wrap-2" style="background-image: url('/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text align-items-end justify-content-center">
      <div class="col-md-9 ftco-animate mb-5 text-center">
        <p class="breadcrumbs mb-0"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span><a href="/all">Products <i class="fa fa-chevron-right"></i></a></span> <span>Products Single <i class="fa fa-chevron-right"></i></span></p>
        <h2 class="mb-0 bread">Products Single</h2>
      </div>
    </div>
  </div>
</section>

<section class="ftco-section">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 mb-5 ftco-animate">
        <a href="/images/prod-${product.id}.jpg" class="image-popup prod-img-bg"><img src="/images/prod-${product.id}.jpg" class="img-fluid" alt="Colorlib Template"></a>
      </div>
      <div class="col-lg-6 product-details pl-md-5 ftco-animate">
        <h3>${product.name}</h3>
<%--        <div class="rating d-flex">--%>
<%--          <p class="text-left mr-4">--%>
<%--            <a href="#" class="mr-2">5.0</a>--%>
<%--            <a href="#"><span class="fa fa-star"></span></a>--%>
<%--            <a href="#"><span class="fa fa-star"></span></a>--%>
<%--            <a href="#"><span class="fa fa-star"></span></a>--%>
<%--            <a href="#"><span class="fa fa-star"></span></a>--%>
<%--            <a href="#"><span class="fa fa-star"></span></a>--%>
<%--          </p>--%>
<%--          <p class="text-left mr-4">--%>
<%--            <a href="#" class="mr-2" style="color: #000;">100 <span style="color: #bbb;">Rating</span></a>--%>
<%--          </p>--%>
<%--          <p class="text-left">--%>
<%--            <a href="#" class="mr-2" style="color: #000;">500 <span style="color: #bbb;">Sold</span></a>--%>
<%--          </p>--%>
<%--        </div>--%>
        <p class="price"><span>$${product.price}</span></p>
        <p>${product.description}</p>
        <div class="row mt-4">
<%--          <div class="input-group col-md-6 d-flex mb-3">--%>
<%--	             	<span class="input-group-btn mr-2">--%>
<%--	                	<button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">--%>
<%--	                   <i class="fa fa-minus"></i>--%>
<%--	                	</button>--%>
<%--	            		</span>--%>
<%--            <input type="text" id="quantity" name="quantity" class="quantity form-control input-number" value="1" min="1" max="100">--%>
<%--            <span class="input-group-btn ml-2">--%>
<%--	                	<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">--%>
<%--	                     <i class="fa fa-plus"></i>--%>
<%--	                 </button>--%>
<%--	             	</span>--%>
<%--          </div>--%>
<%--          <div class="w-100"></div>--%>
<%--          <div class="col-md-12">--%>
<%--            <p style="color: #000;">80 piece available</p>--%>
<%--          </div>--%>
<%--        </div>--%>
        <p><a href="/cart/${product.id}" class="btn btn-primary py-3 px-5 mr-2">Add to Cart</a></p>
<%--            <a href="" class="btn btn-primary py-3 px-5">Buy now</a>--%>
      </div>
    </div>
  </div>
</section>

<script>
    $(document).ready(function(){

        var quantitiy=0;
        $('.quantity-right-plus').click(function(e){

            // Stop acting like a button
            e.preventDefault();
            // Get the field name
            var quantity = parseInt($('#quantity').val());

            // If is not undefined

            $('#quantity').val(quantity + 1);


            // Increment

        });

        $('.quantity-left-minus').click(function(e){
            // Stop acting like a button
            e.preventDefault();
            // Get the field name
            var quantity = parseInt($('#quantity').val());

            // If is not undefined

            // Increment
            if(quantity>0){
                $('#quantity').val(quantity - 1);
            }
        });

    });
</script>
<jsp:include page="footer.jsp"/>