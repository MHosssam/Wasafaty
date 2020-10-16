import 'package:flutter/material.dart';
import 'package:meal/Screen/meal_screen.dart';
import '../dummy_data.dart';
import 'main_drawer.dart';

class CategoryScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          'Category',
          style: TextStyle(fontSize: 30, fontFamily: 'Raleway'),
        ),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        padding: EdgeInsets.all(30),
        children: DUMMY_CATEGORIES
            .map((catData) => InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          catData.color,
                          catData.color.withOpacity(0.3),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.restaurant,
                          size: 40,
                        ),
                        Text(
                          catData.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MealScreen(catData.id , catData.title );
                    }));
                  },
                ))
            .toList(),
      ),
      drawer: MainDrawer(),
    );
  }
}
