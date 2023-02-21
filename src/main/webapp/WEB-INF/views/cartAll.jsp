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
          <div class="d-flex justify-content-center align-items-center"><small>${cart.getCartItems().size()}</small></div>
        </a>
        <div class="dropdown-menu dropdown-menu-right">
          <c:forEach items="${cart.getCartItems()}" var="item" begin="0" end="4">
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
        <li class="nav-item"><a href="" class="nav-link">My Account</a></li>
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
        <p class="breadcrumbs mb-0"><span class="mr-2"><a href="index.html">Home <i class="fa fa-chevron-right"></i></a></span> <span>Cart <i class="fa fa-chevron-right"></i></span></p>
        <h2 class="mb-0 bread">My Cart</h2>
      </div>
    </div>
  </div>
</section>

<section class="ftco-section">
  <div class="container">
    <div class="row">
      <div class="table-wrap">
        <table class="table">
          <thead class="thead-primary">
          <tr>
            <th>&nbsp;</th>
            <th>&nbsp;</th>
            <th>Product</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>total</th>
            <th>&nbsp;</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="item" items="${cartItems}">
          <tr class="alert" role="alert">
            <td>
              <label class="checkbox-wrap checkbox-primary">
                <input type="checkbox" checked>
                <span class="checkmark"></span>
              </label>
            </td>
            <td>
              <div class="img" style="background-image: url(images/prod-<c:out value="${item.product.id}"/>.jpg);"></div>
            </td>
            <td>
              <div class="email">
                <span><c:out value="${item.product.name}"/></span>
                <input class="id" type="hidden" value="${item.id}">
                <input class="cart" type="hidden" value=${item.cart.id}>
<%--                <span>Fugiat voluptates quasi nemo, ipsa perferendis</span>--%>
              </div>
            </td>
            <td class="price">$<c:out value="${item.product.price}"/></td>
            <td class="quantity">
              <div class="input-group">
<%--                <input type="text" name="quantity" class="quantity form-control input-number" value="2" min="1" max="100">--%>
                <div class="counter-wrapper">
                      <button class="items_control" data-action = "minus">-</button>
                      <div class="items_current" name="counter" data-counter>${item.count}</div>
                      <button class="items_control" data-action = "plus">+</button>
                </div>
              </div>
            </td>
            <td class="total-price" name="total-price">$<c:out value="${item.product.price * item.count}"/></td>
            <td>
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true"><i class="fa fa-close"></i></span>
              </button>
            </td>
          </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
    <button type="button" class="change" data-dismiss="alert" aria-label="change">
    </button>
    <div class="row justify-content-end">
      <div class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate">
        <div class="cart-total mb-3">
          <h3>Cart Totals</h3>
          <p class="d-flex">
            <span>Subtotal</span>
            <span>$20.60</span>
          </p>
          <p class="d-flex">
            <span>Delivery</span>
            <span>$0.00</span>
          </p>
          <p class="d-flex">
            <span>Discount</span>
            <span>$3.00</span>
          </p>
          <hr>
          <p class="d-flex total-price">
            <span>Total</span>
            <span>$17.60</span>
          </p>
        </div>
        <p class="text-center"><a href="checkout.html" class="btn btn-primary py-3 px-4">Proceed to Checkout</a></p>
      </div>
    </div>
  </div>
</section>
<jsp:include page="footer.jsp"/>