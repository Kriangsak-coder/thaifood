import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  List recipes = [];

  @override
  void initState() {
    super.initState();
    loadRecipes();
  }

  Future<void> loadRecipes() async {
    final String response = await rootBundle.loadString('assets/recipes.json');
    final data = await json.decode(response);
    setState(() {
      recipes = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              recipes[index]['image'],
              width: 110,
            ),
            title: Text(
              recipes[index]['title'],
              style: GoogleFonts.itim(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(
                    title: recipes[index]['title'],
                    image: recipes[index]['image'],
                    ingredients: recipes[index]['ingredients'],
                    rawrecipes: recipes[index]['rawrecipes'],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class RecipeDetailScreen extends StatefulWidget {
  final String title;
  final String image;
  final String ingredients;
  final String rawrecipes;

  const RecipeDetailScreen({
    required this.title,
    required this.image,
    required this.ingredients,
    required this.rawrecipes,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style: GoogleFonts.itim(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )),
        backgroundColor: Colors.orangeAccent,
        elevation: 15,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Image.asset(
            widget.image,
            width: 400,
          ),
          const SizedBox(height: 20),
          Text(
            widget.title,
            style: GoogleFonts.itim(
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Ingredients:',
            style: GoogleFonts.itim(
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.ingredients,
            style: GoogleFonts.itim(
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'rawrecipes:',
            style: GoogleFonts.itim(
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            widget.rawrecipes,
            style: GoogleFonts.itim(
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
