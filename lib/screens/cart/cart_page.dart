import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: cart.items.isEmpty
          ? Center(child: Text('Your cart is empty', style: TextStyle(fontSize: 18)))
          : ListView(
              children: cart.items.map((item) => ListTile(
                    leading: Image.asset(item.image, width: 50, height: 50),
                    title: Text(item.name),
                    subtitle: Text('${item.price}\$'),
                  )).toList(),
            ),
      bottomNavigationBar: cart.items.isEmpty
          ? null
          : BottomAppBar(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('Total: \$${cart.total}', style: TextStyle(fontSize: 18)),
              ),
            ),
    );
  }
}
