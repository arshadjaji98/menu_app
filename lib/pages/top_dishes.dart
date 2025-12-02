import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/model/food.dart';

class TopDishes extends StatelessWidget {
  final List<Food> topDishes = [
    Food(
      name: "Spicy Salmon Roll",
      price: '28',
      imagePath: "asset/dinner.png",
      rating: '4.8',
    ),
    Food(
      name: "Cheese Tempura",
      price: '18',
      imagePath: "asset/chicken.png",
      rating: '4.5',
    ),
    Food(
      name: "Dragon Roll",
      price: '32',
      imagePath: "asset/fish.png",
      rating: '4.7',
    ),
    Food(
      name: "Mango Sushi",
      price: '25',
      imagePath: "asset/icecream.png",
      rating: '4.6',
    ),
    Food(
      name: "Salmon Avocado Delight",
      price: '30',
      imagePath: "asset/rice.png",
      rating: '4.9',
    ),
  ];

  final List<String> categories = [
    "All",
    "Sushi",
    "Rolls",
    "Dessert",
    "Special",
  ];

  TopDishes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, size: 28),
                  ),
                  SizedBox(width: 8),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Top Dishes",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Category chips
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 8),
                    child: Chip(
                      label: Text(
                        categories[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[100],
                        ),
                      ),
                      backgroundColor: Colors.red[800],
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 16),

            // Dishes list
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: topDishes.length,
                itemBuilder: (context, index) {
                  final food = topDishes[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            food.imagePath,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12),

                        // Dish info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                food.name,
                                style: GoogleFonts.dmSerifDisplay(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    food.rating,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6),
                              Text(
                                "\$${food.price}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              SizedBox(height: 6),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
