import 'package:flutter/material.dart';
import 'package:covid19/screens/about_covid.dart';
import 'package:covid19/screens/prevention.dart';
import 'package:covid19/screens/live_data.dart';

class OptionScreen extends StatefulWidget {
  static String id = 'option_screen';
  @override
  _OptionScreenState createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.reply,
            color: Colors.white,
            ),
          onPressed: (){
            Navigator.pop(context);
            },
          tooltip: 'Back',
          ),
        backgroundColor: Colors.deepPurple[900],
        title: Text('Know About Coronavirus'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RoundButton(text: 'What is Corona Virus?', route: About.id),
          RoundButton(text: 'Prevention Against Covid-19', route: Prevention.id),
          RoundButton(text: 'Get Live Statistics Of Covid-19', route: LiveData.id),
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