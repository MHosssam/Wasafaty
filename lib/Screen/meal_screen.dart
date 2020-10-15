import 'package:flutter/material.dart';
import 'package:meal/Screen/meal_description.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/model/meal.dart';

class MealScreen extends StatefulWidget {
  final String id;
  final String title;

  MealScreen(this.id, this.title);

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(widget.id);
    }).toList();



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 30, fontFamily: 'Raleway'),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var duration = categoryMeal[index].duration;
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return MealDescription(categoryMeal[index].id );
                  }));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          categoryMeal[index].imageUrl,
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 10,
                        left: 10,
                        child: Container(
                          color: Colors.black54,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            categoryMeal[index].title,
                            style: TextStyle(
                              fontFamily: 'RobotoCondensed',
                              fontSize: 25,
                              color: Colors.white,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.timer),
                            SizedBox(
                              width: 6,
                            ),
                            Text('$duration min'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.work),
                            SizedBox(
                              width: 6,
                            ),
                            Text(categoryMeal[index].complexity ==
                                    Complexity.Simple
                                ? 'Simple'
                                : categoryMeal[index].complexity ==
                                        Complexity.Challenging
                                    ? 'Challenging'
                                    : categoryMeal[index].complexity ==
                                            Complexity.Hard
                                        ? 'Hard'
                                        : 'Unknown'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.attach_money),
                            SizedBox(
                              width: 6,
                            ),
                            Text(categoryMeal[index].affordability ==
                                Affordability.Affordable
                                ? 'Affordable'
                                : categoryMeal[index].affordability ==
                                Affordability.Luxurious
                                ? 'Luxurious'
                                : categoryMeal[index].affordability ==
                                Affordability.Pricey
                                ? 'Pricey'
                                : 'Unknown'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
