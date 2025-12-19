import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/theme/colors.dart';

class Discount extends StatefulWidget {
  const Discount({super.key});

  @override
  State<Discount> createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          "Discounted Dishes",
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.grey[100],
            fontSize: 26,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildDiscountCard(
              "Spicy Salmon Roll",
              "28",
              "asset/dosa.png",
              "70% OFF",
            ),

            const SizedBox(height: 16),
            _buildDiscountCard(
              "Chicken Pasta",
              "18",
              "asset/pot.png",
              "45% OFF",
            ),

            const SizedBox(height: 16),
            _buildDiscountCard(
              "BBQ Grill Platter",
              "35",
              "asset/rice.png",
              "30% OFF",
            ),

            const SizedBox(height: 16),
            _buildDiscountCard(
              "QBB Ice Cream",
              "35",
              "asset/icecream.png",
              "50% OFF",
            ),

            const SizedBox(height: 16),
            _buildDiscountCard(
              "Grilled Chicken",
              "35",
              "asset/chicken.png",
              "40% OFF",
            ),

            const SizedBox(height: 16),
            _buildDiscountCard("Latter Cake", "35", "asset/bap.png", "60% OFF"),
            const SizedBox(height: 16),
            _buildDiscountCard(
              "Latter Grill P",
              "35",
              "asset/thai.png",
              "20% OFF",
            ),
            const SizedBox(height: 16),
            _buildDiscountCard("Platter", "35", "asset/sushi.png", "10% OFF"),
            const SizedBox(height: 16),
            _buildDiscountCard(
              "Grill Platter",
              "35",
              "asset/sushi (1).png",
              "40% OFF",
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscountCard(
    String name,
    String price,
    String img,
    String offer,
  ) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: Image.asset(
                  img,
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    offer,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "\$$price",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 4),
                      Text(
                        "4.9",
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
