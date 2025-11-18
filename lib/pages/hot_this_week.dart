import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HotThisWeek extends StatefulWidget {
  const HotThisWeek({super.key});

  @override
  State<HotThisWeek> createState() => _HotThisWeekState();
}

class _HotThisWeekState extends State<HotThisWeek> {
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
          "Most Sell Dishes This Week",
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.grey[800],
            fontSize: 24,
          ),
        ),
      ),
      body: Center(child: Text("Hot This Week Page")),
    );
  }
}
