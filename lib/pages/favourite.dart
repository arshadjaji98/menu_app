import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/model/food.dart';

class FavoriteScreen extends StatelessWidget {
  final Set<String> favoriteFoods;
  final List<Food> allFoods;

  const FavoriteScreen({
    super.key,
    required this.favoriteFoods,
    required this.allFoods,
  });

  @override
  Widget build(BuildContext context) {
    // Filter the food list to only favorites
    final favorites = allFoods
        .where((food) => favoriteFoods.contains(food.name))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites", style: GoogleFonts.dmSerifDisplay()),
        backgroundColor: Colors.red[900],
      ),
      body: favorites.isEmpty
          ? Center(
              child: Text(
                "No favorites yet!",
                style: GoogleFonts.dmSerifDisplay(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final food = favorites[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.asset(food.imagePath, width: 50),
                    title: Text(food.name, style: GoogleFonts.dmSerifDisplay()),
                    subtitle: Text("\$${food.price}"),
                  ),
                );
              },
            ),
    );
  }
}
