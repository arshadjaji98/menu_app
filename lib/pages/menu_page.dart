import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/components/button.dart';
import 'package:menu_app/components/food_tile.dart';
import 'package:menu_app/model/shop.dart';
import 'package:menu_app/pages/discount.dart';
import 'package:menu_app/pages/favourite.dart';
import 'package:menu_app/pages/food_details.dart';
import 'package:menu_app/pages/hot_this_week.dart';
import 'package:menu_app/pages/top_dishes.dart';
import 'package:menu_app/theme/colors.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int? selectedFoodIndex;
  Set<String> favoriteFoods = {};
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    print("Parent favoriteFoods: $favoriteFoods");
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey[300],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: primaryColor),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Menu App',
                  style: GoogleFonts.dmSerifDisplay(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorite', style: GoogleFonts.dmSerifDisplay()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteScreen(
                      favoriteFoods: favoriteFoods,
                      allFoods: foodMenu,
                      onRemove: (name) {
                        setState(() {
                          favoriteFoods.remove(name);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.local_fire_department),
              title: Text('Hot this week', style: GoogleFonts.dmSerifDisplay()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HotThisWeek()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.fastfood_outlined, size: 18),
              title: Text(
                'Our top dishes',
                style: GoogleFonts.dmSerifDisplay(),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TopDishes()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.discount_sharp, size: 18),
              title: Text(
                'Discounted Dishes',
                style: GoogleFonts.dmSerifDisplay(),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Discount()),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: Icon(Icons.shopping_cart, color: Colors.red[900]),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Menu",
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.grey[800],
            fontSize: 28,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.symmetric(vertical: 8),
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primaryColor,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "SPECIAL MENU",
                            style: GoogleFonts.dmSerifDisplay(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 20),
                          MyButton(
                            text: "Checkout",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HotThisWeek(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Image.asset("asset/sushi (3).png", height: 100),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Search here....",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Food Menu",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: foodMenu.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: FoodTile(
                        food: foodMenu[index],
                        onTap: () {
                          setState(() {
                            selectedFoodIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFoodIndex = 1;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("asset/sushi.png", height: 60),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Salmon Eggs ",
                                  style: GoogleFonts.dmSerifDisplay(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "\$26",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.favorite_outline,
                          color: Colors.grey,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFoodIndex = 1;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("asset/sushi (1).png", height: 60),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Soup Noodles",
                                  style: GoogleFonts.dmSerifDisplay(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "\$11",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.favorite_outline,
                          color: Colors.grey,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset("asset/sushi (3).png", height: 60),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Salmon Cheeze ",
                                style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                              ),
                              Text(
                                "\$21",
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.favorite_outline,
                        color: Colors.grey,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (selectedFoodIndex != null)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFoodIndex = null;
                    });
                  },
                  child: Container(
                    color: Colors.black54,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      child: Container(
                        width: 350,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  icon: Icon(
                                    favoriteFoods.contains(
                                          foodMenu[selectedFoodIndex!].name,
                                        )
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                  ),

                                  onPressed: () {
                                    final foodName =
                                        foodMenu[selectedFoodIndex!].name;
                                    setState(() {
                                      if (favoriteFoods.contains(foodName)) {
                                        favoriteFoods.remove(foodName);
                                      } else {
                                        favoriteFoods.add(foodName);
                                      }
                                    });
                                  },
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                    icon: Icon(Icons.close, size: 18),
                                    onPressed: () {
                                      selectedFoodIndex = null;
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              foodMenu[selectedFoodIndex!].imagePath,
                              height: 150,
                            ),
                            SizedBox(height: 10),
                            Text(
                              foodMenu[selectedFoodIndex!].name,
                              style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "\$${foodMenu[selectedFoodIndex!].price}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(height: 20),
                            MyButton(
                              text: "View Details",
                              onTap: () {
                                final index = selectedFoodIndex!;
                                setState(() {
                                  selectedFoodIndex = null;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FoodDetailsPage(food: foodMenu[index]),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
