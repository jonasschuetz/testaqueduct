import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;



main(List<String> arguments) async {

var url = 'http://86.119.40.8:8008/stays';

var data = new StayTest(id: 15, dose: 123);
var jsonData = data.toJson(data);
 

var client = new HttpClient();
client.findProxy = null;

  Future<http.Response> foo(url, body) async{
    var response = await http.post(Uri.parse(url), body: body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;

}

foo(url, jsonData);
    



}




class StayTest {
      final int id;
      DateTime startTime;
      DateTime endTime;
      int dose;
      StayTest({this.id, this.startTime, this.endTime, this.dose});
      

      Map<String, dynamic> toJson(StayTest instance) => <String, dynamic>{
      'id': instance.id.toString(),
      'dose': instance.dose.toString()
    };



    }
    
 //'startTime': instance.startTime?.toIso8601String(),
 //'endTime': instance.endTime?.toIso8601String(),