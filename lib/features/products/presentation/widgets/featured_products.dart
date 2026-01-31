import 'package:flutter/material.dart';
import '../../../models/product.dart';
import 'package:provider/provider.dart';
import '../../../providers/cart_provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class FeaturedProducts extends StatelessWidget {
  final String category;
  final double maxPrice;
  FeaturedProducts({this.category='All', this.maxPrice=1000});

  final List<Product> products = [
    Product(id: '1', name: 'Product 1', price: 20.0, category: 'Category 1', image: 'assets/images/product1.png'),
    Product(id: '2', name: 'Product 2', price: 50.0, category: 'Category 2', image: 'assets/images/product2.png'),
    Product(id: '3', name: 'Product 3', price: 80.0, category: 'Category 3', image: 'assets/images/product3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final filtered = products.where((p) =>
      (category=='All' || p.category==category) &&
      p.price <= maxPrice
    ).toList();

    return AnimationLimiter(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          final p = filtered[index];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              horizontalOffset: 50,
              child: FadeInAnimation(
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: Image.asset(p.image, width: 50, height: 50),
                    title: Text(p.name),
                    subtitle: Text('${p.price}\$'),
                    trailing: IconButton(
                      icon: Icon(Icons.add_shopping_cart, color: Colors.deepPurple),
                      onPressed: () => cart.add(p),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
