import 'package:flutter/material.dart';

class Prevention extends StatelessWidget {
  static String id = 'prevention';
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
        title: Text('Prevent COVID-19'),
      ),
      body: ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    SizedBox(height: 30),
    ContentRenderer(
      heading: 'Prevention',
      text: 'To prevent the spread of COVID-19, we must strictly follow the measures and regulations implemented by Government.\nPersonal measures include:\n\n1. Wash your hands regularly with soap and water, or clean them with alcohol-based hand rub.\n2. Maintain at least 1 metre distance between you and people coughing or sneezing.\n3. Avoid touching your face.\n4. Cover your mouth and nose when coughing or sneezing.\n5. Refrain from smoking and other activities that weaken the lungs.\n6. Practice physical distancing by avoiding unnecessary travel and staying away from large groups of people.' ,
      height: 550,
    ),
  ],
)
    );
  }
}

class ContentRenderer extends StatelessWidget {
  ContentRenderer({this.heading , this.text , this.height});
  final String heading;
  final String text;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Card(
        elevation: 9,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
                  child: Column(
            children: <Widget>[
              Text(heading , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w700 , color: Color(0xFF1d0057),),),
              SizedBox(height: 15),
              Text(text , style: TextStyle(fontSize: 17.5 , fontWeight: FontWeight.w500 , color: Color(0xFF322475),),),
            ],
          ),
        ),
      ),
    );
  }
}
