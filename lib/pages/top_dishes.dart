import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopDishes extends StatefulWidget {
  const TopDishes({super.key});

  @override
  State<TopDishes> createState() => _TopDishesState();
}

class _TopDishesState extends State<TopDishes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,

        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Our Top Dishes",
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.grey[800],
            fontSize: 24,
          ),
        ),
      ),
      body: Center(child: Text("Top Dishes Page")),
    );
  }
}
