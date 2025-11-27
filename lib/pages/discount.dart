import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.teal[700],
        elevation: 0,
        title: Text(
          "Discounted Dishes",
          style: GoogleFonts.dmSerifDisplay(color: Colors.white, fontSize: 26),
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
              "20% OFF",
            ),

            const SizedBox(height: 16),
            _buildDiscountCard(
              "Chicken Alfredo Pasta",
              "18",
              "asset/pot.png",
              "15% OFF",
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
              "BBQ Grill Platter",
              "35",
              "asset/icecream.png",
              "30% OFF",
            ),

            const SizedBox(height: 16),
            _buildDiscountCard(
              "BBQ Grill Platter",
              "35",
              "asset/chicken.png",
              "30% OFF",
            ),
            const SizedBox(height: 16),
            _buildDiscountCard(
              "BBQ Grill Platter",
              "35",
              "asset/bap.png",
              "30% OFF",
            ),
            const SizedBox(height: 16),
            _buildDiscountCard(
              "BBQ Grill Platter",
              "35",
              "asset/thai.png",
              "30% OFF",
            ),
            const SizedBox(height: 16),
            _buildDiscountCard(
              "BBQ Grill Platter",
              "35",
              "asset/sushi.png",
              "30% OFF",
            ),
            const SizedBox(height: 16),
            _buildDiscountCard(
              "BBQ Grill Platter",
              "35",
              "asset/sushi (1).png",
              "30% OFF",
            ),
            _buildDiscountCard(
              "BBQ Grill Platter",
              "35",
              "asset/sushi (1).png",
              "30% OFF",
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
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
            child: Image.asset(img, width: 110, height: 110, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "\$$price",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      offer,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
