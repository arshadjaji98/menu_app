import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/model/food.dart';

class FavoriteScreen extends StatefulWidget {
  final Set<String> favoriteFoods;
  final void Function(String) onRemove;

  final List<Food> allFoods;

  const FavoriteScreen({
    super.key,
    required this.favoriteFoods,
    required this.allFoods,
    required this.onRemove,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favorites = widget.allFoods
        .where((food) => widget.favoriteFoods.contains(food.name))
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          "Saved Dsishes",
          style: GoogleFonts.dmSerifDisplay(fontSize: 26, color: Colors.white),
        ),
        backgroundColor: Colors.red[900],
        centerTitle: true,
        elevation: 4,
      ),
      body: favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: Colors.red[900]),
                  SizedBox(height: 16),
                  Text(
                    "No favorites yet",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 24,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Add food to your favorites!",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final food = favorites[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        food.imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      food.name,
                      style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                    ),
                    subtitle: Text(
                      "\$${food.price}",
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        print("Before: ${widget.favoriteFoods}");
                        widget.onRemove(food.name);
                        print(
                          "After (parent updated): ${widget.favoriteFoods}",
                        );
                        setState(() {});
                      },
                      icon: Icon(Icons.favorite, color: Colors.red[900]),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
