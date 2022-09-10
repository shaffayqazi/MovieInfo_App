import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'DataModel.dart';

class DataService{

 late String category;
 late String MovieName;
 late bool isbuttonSelected;
  var apikey = "a0a4092bd760fd676f181bf62114726f";
 var data;
 var imageurl= 'https://image.tmdb.org/t/p/w300/rugyJdeoJm7cSJL1q4jBpTNbxyU.jpg';

  Future<void> getProduct( category, isbuttonSelected, MovieName ) async
  {const kThemoviedbSearchURL = "https://api.themoviedb.org/3/search/movie";
     var finalresponse  = isbuttonSelected ?
     "$kThemoviedbSearchURL/?api_key=$apikey&language=en-US&page=1&include_adult=false&query=$MovieName":
     "https://api.themoviedb.org/3/movie/$category?api_key=$apikey&language=en-US";
    final response = await http.get(Uri.parse(
      finalresponse));
    print(response.body.toString());
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    }
  }
}