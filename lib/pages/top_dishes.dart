import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/model/food.dart';

class TopDishes extends StatelessWidget {
  final List<Food> topDishes = [
    Food(
      name: "Spicy Salmon Roll",
      price: '28',
      imagePath: "asset/dinner.png",
      rating: '',
    ),
    Food(
      name: "Cheese Tempura",
      price: '18',
      imagePath: "asset/chicken.png",
      rating: '',
    ),
    Food(
      name: "Dragon Roll",
      price: '32',
      imagePath: "asset/fish.png",
      rating: '',
    ),
    Food(
      name: "Mango Sushi",
      price: '25',
      imagePath: "asset/icecream.png",
      rating: '',
    ),
    Food(
      name: "Salmon Avocado Delight",
      price: '30',
      imagePath: "asset/rice.png",
      rating: '',
    ),
  ];

  TopDishes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('asset/background.jpg', fit: BoxFit.cover),
          ),

          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          ),

          Positioned(
            top: 60,
            left: 20,
            child: Text(
              'Top Dishes',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 24),
                Expanded(
                  child: PageView.builder(
                    controller: PageController(viewportFraction: 0.8),
                    itemCount: topDishes.length,
                    itemBuilder: (context, index) {
                      final food = topDishes[index];
                      return Center(
                        child: AspectRatio(
                          aspectRatio: 0.6,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.deepOrange[300]!,
                                  Colors.deepOrange[600]!,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 12,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.asset(
                                    food.imagePath,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.4),
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 12,
                                  left: 12,
                                  right: 12,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        food.name,
                                        style: GoogleFonts.dmSerifDisplay(
                                          fontSize: 16,
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black.withOpacity(
                                                0.7,
                                              ),
                                              blurRadius: 4,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        "\$${food.price}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black.withOpacity(
                                                0.7,
                                              ),
                                              blurRadius: 4,
                                              offset: Offset(1, 2),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
