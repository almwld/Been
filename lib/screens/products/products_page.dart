import 'package:flutter/material.dart';
import '../../features/products/presentation/widgets/featured_products.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String selectedCategory = 'All';
  double maxPrice = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(colors: [Colors.deepPurple, Colors.purpleAccent]),
              image: DecorationImage(
                image: AssetImage('assets/images/banner.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                DropdownButton<String>(
                  value: selectedCategory,
                  items: ['All','Category 1','Category 2','Category 3']
                      .map((e) => DropdownMenuItem(child: Text(e), value: e))
                      .toList(),
                  onChanged: (val) => setState(() => selectedCategory = val!),
                ),
                SizedBox(width: 20),
                Text('Max Price: ${maxPrice.toInt()}\$'),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(child: FeaturedProducts(category: selectedCategory, maxPrice: maxPrice)),
        ],
      ),
    );
  }
}
