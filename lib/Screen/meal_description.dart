import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';

class MealDescription extends StatefulWidget {
  String id;
  MealDescription(this.id);

  @override
  _MealDescriptionState createState() => _MealDescriptionState();
}

class _MealDescriptionState extends State<MealDescription> {


  @override
  Widget build(BuildContext context) {
    final SelectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == widget.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          SelectedMeal.title,
          style: TextStyle(fontSize: 30, fontFamily: 'Raleway'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.30,
              child: Image.network(
                SelectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _titleSection('Ingredients'),
            _dataSection(ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    child: Text(
                      SelectedMeal.ingredients[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                );
              },
              itemCount: SelectedMeal.ingredients.length,
            )),
            _titleSection('Steps'),
            _dataSection(ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("#${index + 1}"),
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.white,
                      ),
                      title: Text(
                        SelectedMeal.steps[index],
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                    Divider(
                      height: 10,
                      thickness: 2,
                    ),
                  ],
                );
              },
              itemCount: SelectedMeal.steps.length,
            )),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Widget _titleSection(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _dataSection(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(bottom: 20, top: 8),
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.25,
      child: child,
    );
  }
}
