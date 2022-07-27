import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationService {
  final String key = 'AIzaSyBLM1PnZkDJk7GkiEvKFmlbgmB6F_tW5bA';

  Future<String> getPlaceId(String input) async{
    final String url = 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';

    var response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);

    var placeId = json['candidates'][0]['place_id'] as String;

    if (kDebugMode) {
      print(placeId);
    }

    return placeId;
  }

  // Future<Map<String, dynamic>> getPlace(String input) async{}
}