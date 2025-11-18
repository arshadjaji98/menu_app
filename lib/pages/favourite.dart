import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Saved Dishes",
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.grey[800],
            fontSize: 24,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(title: Text('Favourite Item $index '));
        },
      ),
    );
  }
}
