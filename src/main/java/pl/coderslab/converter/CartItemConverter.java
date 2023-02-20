//package pl.coderslab.converter;
//
//import org.springframework.core.convert.converter.Converter;
//import org.springframework.stereotype.Component;
//import pl.coderslab.cart.CartRepository;
//import pl.coderslab.cart_item.CartItem;
//import pl.coderslab.cart_item.CartItemRepository;
//import pl.coderslab.cart_item.EditedCartItem;
//import pl.coderslab.product.ProductRepository;
//
//import java.time.LocalDateTime;
//
//@Component
//public class CartItemConverter implements Converter<EditedCartItem, CartItem> {
//    private final ProductRepository productRepository;
//    private final CartItemRepository cartItemRepository;
//    private final CartRepository cartRepository;
//    public CartItemConverter(ProductRepository productRepository, CartItemRepository cartItemRepository, CartRepository cartRepository) {
//        this.productRepository = productRepository;
//        this.cartItemRepository = cartItemRepository;
//        this.cartRepository = cartRepository;
//    }
//    @Override
//    public CartItem convert(EditedCartItem editedCartItem) {
//        final CartItem cartItem = cartItemRepository.findByProductId(editedCartItem.getProductId());
//        cartItem.setAddDate(LocalDateTime.now());
//        cartItem.setCount(editedCartItem.getCount());
//        cartItem.setCart((cartRepository.findById(editedCartItem.getCartId()).orElse(null)));
//        cartItem.setProduct(productRepository.findById(editedCartItem.getProductId()).orElse(null));
//        return cartItem;
//    }


//}
