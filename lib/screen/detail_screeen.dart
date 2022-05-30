import 'package:flutter/material.dart';
import 'package:submission/data/recipe_data.dart';

class DetailScreen extends StatelessWidget {
  final RecipeStructure recipe;

  const DetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(recipe.title),
        ),
        body: DetailPage(recipe: recipe));
  }
}

class DetailPage extends StatelessWidget {
  final RecipeStructure recipe;

  const DetailPage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            recipe.mealThumb,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "All The Ingredients",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            padding: const EdgeInsets.all(16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: recipe.ingredients.map((e) {
                        return Container(
                          child: Text(e),
                        );
                      }).toList()),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: recipe.measurements.map((e) {
                        return Container(
                          child: Text(e),
                        );
                      }).toList()),
                ]),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Instructions",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 64),
            child: Text(
              recipe.instructions,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
