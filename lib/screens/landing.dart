import 'package:flutter/material.dart';
import 'package:login/services/api_service.dart';
import 'package:login/widgets/landing.dart';

class WelcomeScreen extends StatefulWidget {
  final List<Map<String, dynamic>> favoriteProducts;
  final Function(Map<String, dynamic>) onFavoriteToggle;

  WelcomeScreen({
    Key? key,
    required this.favoriteProducts,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<dynamic> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProductsFromApi();
  }

  Future<void> fetchProductsFromApi() async {
    try {
      final fetchedProducts = await ApiService.fetchProducts();
      setState(() {
        products = fetchedProducts;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load products: $e')),
      );
    }
  }

  void toggleFavorite(Map<String, dynamic> product) {
    setState(() {
      product['isFavorite'] = !product['isFavorite'];
      widget.onFavoriteToggle(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Text(
                'Featured Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : products.isEmpty
                    ? const Center(child: Text('No products available'))
                    : SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return FeaturedProductCard(
                              imagePath: product['target_file'] ?? '',
                              name: product['name'] ?? 'Unknown',
                              category: product['category'] ?? 'General',
                              price: '\$${product['price']}',
                              rating: product['rating'] ?? 0.0,
                              isFavorite: product['isFavorite'] ?? false,
                              onFavoriteToggle: () => toggleFavorite(product),
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
