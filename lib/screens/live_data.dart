import 'package:flutter/material.dart';
import 'package:covid19/util/getCovidData.dart';

class LiveData extends StatefulWidget {
  static String id = 'live_data';
  @override
  _LiveDataState createState() => _LiveDataState();
}

class _LiveDataState extends State<LiveData> {
  List<String> states = [
    'Andaman and Nicobar Islands',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chandigarh',
    'Chhattisgarh',
    'Delhi',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu and Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Ladakh',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Odisha',
    'Puducherry',
    'Punjab',
    'Rajasthan',
    'Tamil Nadu',
    'Telengana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];
  CovidData covidStats = CovidData();
  var selectedState = 'Rajasthan';
  var data;
  var activeCases;
  var curedCases;
  var deaths;
  var stateCases;
  var stateCuredCases;
  var stateDeaths;
  void collectData()async{
    data = await covidStats.getData();
    setState(() {
      activeCases = data['countryData']['total'];
      curedCases = data['countryData']['cured_dischargedTotal'];
      deaths = data['countryData']['deathsTotal'];
      stateCases = data['stateData']['$selectedState']['cases'];
      stateCuredCases = data['stateData']['$selectedState']['cured_discharged'];
      stateDeaths = data['stateData']['$selectedState']['deaths'];
    });
  }
  DropdownButton<String> stateDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String state in states) {
      var newItem = DropdownMenuItem(
        child: Text(state , style: TextStyle(fontSize: 17.5 , color: Color(0xFF1d0057),),),
        value: state,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedState,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedState = value;
          collectData();
        });
      },
    );
  }
  @override
  void initState() {
    super.initState();
    collectData();
  }
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
        title: Text('Live Statistics'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh , color: Colors.white), onPressed: (){collectData();} , tooltip: 'Refresh Data'),
          IconButton(icon: Icon(Icons.info , color: Colors.white), onPressed: null , tooltip: 'Data Source: covid19sggts04.herokuapp.com',)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 5),
          Text('Country Wide Statistics' , style: TextStyle(color: Color(0xFF1d0057) , fontSize: 25 , fontWeight: FontWeight.w700),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 15),
            child: Card(
              elevation: 9,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.5 , vertical: 10),
                child: Row(
                  children: <Widget>[
                    Text('Total Active Cases: ' , style: TextStyle(color: Color(0xFF1d0057) , fontSize: 21),),
                    Text('$activeCases' , style: TextStyle(color: Colors.blue[600] , fontSize: 21),),
                    Text(' cases' , style: TextStyle(color: Color(0xFF1d0057) , fontSize: 21),),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 15),
            child: Card(
              elevation: 9,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.5 , vertical: 10),
                child: Row(
                  children: <Widget>[
                    Text('Total Cured Cases: ' , style: TextStyle(color: Color(0xFF1d0057) , fontSize: 21),),
                    Text('$curedCases' , style: TextStyle(color: Colors.green[600] , fontSize: 21),),
                    Text(' cases' , style: TextStyle(color: Color(0xFF1d0057) , fontSize: 21),),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 15),
            child: Card(
              elevation: 9,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.5 , vertical: 10),
                child: Row(
                  children: <Widget>[
                    Text('Total Deaths: ' , style: TextStyle(color: Color(0xFF1d0057) , fontSize: 21),),
                    Text('$deaths' , style: TextStyle(color: Colors.red[600] , fontSize: 21),),
                    Text(' deaths' , style: TextStyle(color: Color(0xFF1d0057) , fontSize: 21),),
                  ],
                ),
              ),
            ),
          ),
          Text('State Wise Statistics' , style: TextStyle(color: Color(0xFF1d0057) , fontSize: 25 , fontWeight: FontWeight.w700),),
          SizedBox(height: 5,),
          stateDropdown(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 15),
            child: Card(
              elevation: 9,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.5 , vertical: 10),
                child: Row(
                  children: <Widget>[
                    Text('Total Cases: ' , style: TextStyle(color: Color(0xFF1d0057) , fontSize: 21),),
                    Text('$stateCases' , style: TextStyle(color: Colors.blue[600] , fontSize: 21),),
                    Text(' cases' , style: TextStyle(color: Color(0xFF1d0057) , fontSize: 21),),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 15),
            child: Card(
              elevation: 9,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.5 , vertical: 10),
                child: Row(
                  children: <Widget>[
                    Text('Total Cured Cases: ' , style: TextStyle(color: Color(0xFF1d0057) , fontSize: 21),),
                    Text('$stateCuredCases' , style: TextStyle(color: Colors.green[600] , fontSize: 21),),
                    Text(' cases' , style: TextStyle(color: Color(0xFF1d0057) , fontSize: 21),),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 15),
            child: Card(
              elevation: 9,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.5 , vertical: 10),
                child: Row(
                  children: <Widget>[
                    Text('Total Deaths: ' , style: TextStyle(color: Color(0xFF1d0057) , fontSize: 21),),
                    Text('$stateDeaths' , style: TextStyle(color: Colors.red[600] , fontSize: 21),),
                    Text(' deaths' , style: TextStyle(color: Color(0xFF1d0057) , fontSize: 21),),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
