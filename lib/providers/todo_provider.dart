import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class TodoProvider extends ChangeNotifier {
  List todo=[];
  postData(String title ,String description)async{
    const postUrl='https://api.nstack.in/v1/todos';
    final body={
      'title':title,
      'description':description,
      'is_completed':false
    };
    try {
      final response=await http.post(Uri.parse(postUrl) ,
      
      headers: {
        'Content-Type': 'application/json',
      },
       body: jsonEncode(body));
      log(response.statusCode.toString());
      if (response.statusCode==201) {
        getallData();
      }else{
        throw Exception('Failed to post todo');
      }
    } catch (e) {  
      throw Exception('Failed to post todo');
    }
  }
 Future getallData()async{
  const getUrl='https://api.nstack.in/v1/todos?page=1&limit=16';
  final response= await http.get(Uri.parse(getUrl));
  if (response.statusCode==200) {
    final decodedData=jsonDecode(response.body)['items'] as List ;   
    todo=decodedData;
    notifyListeners();
  }else{    
    log('error');
  }
  }
 editData(String title ,String description ,String id)async{
  final editUrl='https://api.nstack.in/v1/todos/$id';
    final body={
      'title':title,
      'description':description,
      'is_completed':false
    };
    try {
      final response=await http.put(Uri.parse(editUrl) ,
      
      headers: {
        'Content-Type': 'application/json',
      },
       body: jsonEncode(body));
      log(response.statusCode.toString()); 
      if (response.statusCode==200) {
        getallData();
      }else{
        throw Exception('Failed to put todo');
      }
    } catch (e) {  
      throw Exception('Failed to put todo');
    }
  }
  Future<void> delete(String id ) async{
    final uri='https://api.nstack.in/v1/todos/$id';
    final response=await http.delete(Uri.parse(uri));
    log(response.statusCode.toString());
    if (response.statusCode==200) {
      getallData();
    }else{
      log('error');
    }
  }
}