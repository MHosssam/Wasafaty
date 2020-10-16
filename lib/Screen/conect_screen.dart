import 'package:flutter/material.dart';
import 'package:meal/Screen/main_drawer.dart';

class ConectUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ConectUs',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Raleway',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height * .35,
              width: double.infinity,
              child: Image.network(
                'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Enter Your Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    )),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Enter Your Message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    )),
                keyboardType: TextInputType.emailAddress,
                maxLines: 10,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: FlatButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                            color: Colors.pink,
                            height: 120,
                            child: _Sheet(),
                          ));
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }

  Widget _Sheet() {
    return Container(
        color: Colors.pink,
        child: Center(
          child: Text(
            'Message Send Successfully',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'Raleway',
                color: Colors.white),
          ),
        ));
  }
}
