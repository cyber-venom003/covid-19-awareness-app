import 'package:flutter/material.dart';
import 'package:covid19/screens/option.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[900],
          title: Center(
            child: Text('Covid-19 Awareness App'),
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 65),
            Center(
              child: Image(image: AssetImage('images/covid.png'))
              ),
            SizedBox(height: 45),
            RoundButton(
              text: 'Everything you need to know',
              route: OptionScreen.id,
            ),
          ],
        ),
      );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({@required this.text ,@required this.route});
  final String text;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 25),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.deepPurple[700],
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  minWidth: 100.0,
                  height: 47.5,
                  onPressed: (){
                    Navigator.pushNamed(context, route);
                  }, 
                  child: Center(
                        child: Text(
                        '$text',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                  ),
                ),
              ),
            ),
        ),
    );
  }
}