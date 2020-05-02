import 'package:http/http.dart' as http;
import 'dart:convert';

class CovidData{
  String apiURL = 'http://covid19sggts04.herokuapp.com/';
  var decodedData;
  Future<dynamic> getData()async{
    http.Response response = await http.get(apiURL);
    if (response.statusCode == 200){
      decodedData = jsonDecode(response.body);
      return decodedData;
    }
    else{
      print(response.statusCode);
    }
  }
}