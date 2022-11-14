import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobility/model/import.dart';
import 'package:mobility/model/exercise.dart';

class ParseExercises {
  Future<String> getJson() {
    return rootBundle.loadString('assets/data.json');
  }

  void getExercises() async {
    var myData = json.decode(await getJson());
    final parsed = jsonDecode(myData).cast<Map<String, dynamic>>();
  }
}
