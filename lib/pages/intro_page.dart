import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/components/button.dart';
import 'package:menu_app/theme/colors.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 25),
              Text(
                "HOTEL MENU",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset("asset/sushi.png"),
              ),
              SizedBox(height: 25),
              Text(
                "TRY OUT HOTEL MENU IN THIS APP",
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 34,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "FEEL FREE TO TRY OUR MENU AND ORDER WHATEVER YOU WANT",
                textAlign: TextAlign.start,
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 14,
                  height: 2,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(height: 50),
              MyButton(
                text: "Get Started",
                onTap: () {
                  Navigator.pushNamed(context, '/menupage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
