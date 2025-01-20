import 'package:flutter/material.dart';
import 'package:login/screens/search_screen.dart';
import 'package:login/widgets/category_item.dart';
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
  List<Map<String, dynamic>> products = [
    {
      'name': 'Nike Air Force 1 \'07',
      'category': 'Men\'s Shoes',
      'price': '\$250',
      'rating': 4.5,
      'imagePath': 'assets/images/Shoe1.png',
      'isFavorite': false,
    },
    {
      'name': 'Nike Air Max 270',
      'category': 'Women\'s Shoes',
      'price': '\$160',
      'rating': 4.7,
      'imagePath': 'assets/images/Shoe2.png',
      'isFavorite': false,
    },
    {
      'name': 'Adidas Yeezy Boost',
      'category': 'Unisex Shoes',
      'price': '\$300',
      'rating': 4.9,
      'imagePath': 'assets/images/4.jpg',
      'isFavorite': false,
    },{
      'name': 'Adidas Yeezy Boost',
      'category': 'Unisex Shoes',
      'price': '\$300',
      'rating': 4.9,
      'imagePath': 'assets/images/2.jpg',
      'isFavorite': false,
    },{
      'name': 'Adidas Yeezy Boost',
      'category': 'Unisex Shoes',
      'price': '\$300',
      'rating': 4.9,
      'imagePath': 'assets/images/3.jpg',
      'isFavorite': false,
    },
  ];

  void toggleFavorite(Map<String, dynamic> product) {
    setState(() {
      product['isFavorite'] = !product['isFavorite']; 
      widget.onFavoriteToggle(product); 
    });
  }

  final List<String> categories = ['Nike', 'Adidas', 'Puma', 'Fila'];
  String selectedCategory = 'Nike'; 

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: screenWidth * 0.07,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        'Mohomed Rimzan',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045, 
                          color: isDarkMode ? Colors.white54 : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.search, color: Colors.black),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SearchScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.notifications_none, color: Colors.black),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05), 
              child: Container(
                height: screenWidth * 0.45, 
               
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'New Collection',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Discount 50% for\nthe first purchase',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(color: Colors.blue),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                            ),
                            child: const Text(
                              'Shop Now',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/image23.png',
                        height: screenWidth * 0.35, 
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, 
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 90,
              padding: const EdgeInsets.only(left: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  String category = categories[index];
                  bool isSelected = selectedCategory == category;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: CategoryItem(
                      imagePath: 'assets/images/$category.png',
                      label: category,
                      isSelected: isSelected,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05, 
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, 
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  bool isFavorite = product['isFavorite'];
                  return FeaturedProductCard(
                    imagePath: product['imagePath'],
                    name: product['name'],
                    category: product['category'],
                    price: product['price'],
                    rating: product['rating'],
                    isFavorite: isFavorite,
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
