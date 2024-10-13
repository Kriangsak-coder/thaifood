import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart/recipe.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thai Recipe App',
          style: GoogleFonts.itim(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        elevation: 15,
      ),
      body: const RecipeList(),
    );
  }
}
