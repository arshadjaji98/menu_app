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
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        actions: [],
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Discounted Dishes",
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.grey[800],
            fontSize: 24,
          ),
        ),
      ),
      body: Center(child: Text("Discounted Dishes")),
    );
  }
}
