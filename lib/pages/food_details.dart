import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/components/button.dart';
import 'package:menu_app/model/food.dart';
import 'package:menu_app/model/shop.dart';
import 'package:menu_app/theme/colors.dart';
import 'package:provider/provider.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantityCount = 0;
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 1) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();
      shop.addToCart(widget.food, quantityCount);
      showDialog(
        barrierDismissible: false,

        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: Text(
            "Successfully added to cart",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: Icon(Icons.done, color: Colors.white),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                Image.asset(widget.food.imagePath, height: 250),
                SizedBox(height: 25),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 5),
                    Text(widget.food.rating),
                  ],
                ),
                Text(
                  widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                ),
                SizedBox(height: 25),
                Text(
                  "Description",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Delicate slice fresh drapes elegantly over a pellow of perfectcly season sushi rice. Made only for chineese and american and other asian, becaues other can eat this too, and others can like this too it is a good food and not good either",
                  style: GoogleFonts.cabin(
                    fontSize: 13,
                    color: Colors.grey[500],
                    height: 1.8,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            color: primaryColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.food.price}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: Icon(Icons.remove, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 5),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),

                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                MyButton(text: "Add to Card", onTap: addToCart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
