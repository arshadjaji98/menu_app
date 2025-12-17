import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/model/food.dart';
import 'package:menu_app/responsive/responsive.dart';

class HotThisWeek extends StatelessWidget {
  final List<Food> specialFoods = [
    Food(name: "Baps", price: '32', imagePath: "asset/bap.png", rating: '4.5'),
    Food(name: "Dosa", price: '18', imagePath: "asset/dosa.png", rating: '4.0'),
    Food(name: "Pot", price: '28', imagePath: "asset/pot.png", rating: '4.8'),
    Food(
      name: "Maite",
      price: '30',
      imagePath: "asset/thai.png",
      rating: '4.7',
    ),
  ];

  HotThisWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          "Hot This Week",
          style: GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
        ),
        backgroundColor: Colors.red[400],
      ),
      body: WebResponsive(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          itemCount: specialFoods.length,
          itemBuilder: (context, index) {
            final food = specialFoods[index];
            return Container(
              margin: EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
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
                      height: 160,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 230,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.name,
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 40,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                blurRadius: 4,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "\$${food.price}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                blurRadius: 4,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 10,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite_outline,
                          color: Colors.red[700],
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
