import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobility/model/import.dart';
import 'package:mobility/model/exercise.dart';

class ParseExercises {
  Future<String> getJson() {
    return rootBundle.loadString('assets/data.json');
  }

  Future<List<Exercise>> getExercises() async {
    List<Exercise> tmp = [];
    var myData = json.decode(await getJson());
    var import = Import.fromJson(myData);
    return import.exercises ?? tmp;
  }

  Future<List<Exercise>> getRoutine(int duration, bool equipped) async {
    List<Exercise> routine = [];
    List<Exercise> exercises = await getExercises();
    double sum = 0;

    if (!equipped) {
      exercises.removeWhere((element) => element.equipped == true);
    }

    do {
      Exercise ex = getRandomExercise(exercises);
      int randomDur = getDuration(ex.duration);
      ex.duration = [];
      ex.duration.add(randomDur);
      if (ex.double) {
        Exercise copy = Exercise(
            id: ex.id,
            description: "${ex.description} Left",
            instruction: ex.instruction,
            duration: ex.duration,
            double: ex.double,
            equipped: ex.equipped);
        routine.add(copy);
        sum += (randomDur / 60);
        ex.description = "${ex.description} Right";
      }
      routine.add(ex);

      sum += (randomDur / 60);
    } while (sum < duration);

    for (var elem in routine) {
      print(elem.description);
    }

    return routine;
  }

  int getDuration(List<int> duration) {
    final random = Random();
    return duration[random.nextInt(duration.length)];
  }

  Exercise getRandomExercise(List<Exercise> exercises) {
    final random = Random();
    return exercises[random.nextInt(exercises.length)];
  }

  List<Exercise> sortOrder(List<Exercise> exercises) {
    return exercises;
  }
}
