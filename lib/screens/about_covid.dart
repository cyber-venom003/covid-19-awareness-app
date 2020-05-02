import 'package:flutter/material.dart';

class About extends StatelessWidget {
  static String id = 'about_covid';
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
        title: Text('What is Corona Virus?'),
      ),
      body: ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    SizedBox(height: 20),
    ContentRenderer(
      heading: 'What is COVID-19',
      text: 'COVID-19 stands for Corona Virus Disease which  is an infectious disease caused by severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2).\nThe disease was first identified in December 2019 in Wuhan, the capital of China\'s Hubei province, and has since spread globally, resulting in the ongoing 2019–20 coronavirus pandemic.' ,
      height: 350,
    ),
    SizedBox(height: 20),
    ContentRenderer(
      height: 500,
      heading: 'Symptoms',
      text: 'COVID-19 is a respiratory disease and most infected people will develop mild to moderate symptoms and recover without requiring special treatment.\nPeople who have underlying medical conditions and those over 60 years old have a higher risk of developing severe disease and death.\n\nCommon Symptoms include:\n1. Fever\n2. Tiredness\n3. Dry Cough\n\nOther Symptoms include:\n1. Shortness of breath\n2. Aches and Pains\n3. Sore Throat '
    ),
    SizedBox(height: 20),
    ContentRenderer(
      height: 400,
      heading: 'Transmission Modes',
      text: 'COVID-19 is primarily spread during close contact and by small droplets produced when people cough, sneeze or talk; with close contact being within approximately 1–2 m.Both sputum and saliva can carry large viral loads.It may also spread when one touches a contaminated surface, known as fomite transmission, and then touches one\'s eyes, nose or mouth. While there are concerns it may spread via faeces, this risk is believed to be low.'
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