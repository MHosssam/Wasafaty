
import 'package:flutter/material.dart';
import 'package:meal/Screen/category_screen.dart';
import 'package:meal/Screen/conect_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.20,
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            color: Colors.amber,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.pink,
                  fontFamily: 'Raleway'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _data('Meal', Icons.restaurant , context , CategoryScreen()),
          _data('Conect Us', Icons.call , context , ConectUs()),
        ],
      ),
    );
  }

  Widget _data(String title, IconData icon ,BuildContext context , Widget page ) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
      leading: Icon(
        icon,
        size: 26,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return page;
        }));
      },
    );
  }
}
