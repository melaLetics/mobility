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
      Exercise ex = duration - sum > 1
          ? getRandomExercise(exercises, routine)
          : getRandomExercise(
              exercises.where((elem) => elem.double == false).toList(),
              routine);
      int randomDur = getDuration(ex.duration, duration, sum);
      ex.duration = [];
      ex.duration.add(randomDur);
      if (ex.double) {
        Exercise copy = Exercise(
            id: ex.id,
            description: "${ex.description} Left",
            instruction: ex.instruction,
            duration: ex.duration,
            double: ex.double,
            equipped: ex.equipped,
            stimulus: ex.stimulus);
        routine.add(copy);
        sum += (randomDur / 60);
        ex.description = "${ex.description} Right";
      }
      routine.add(ex);

      sum += (randomDur / 60);
    } while (sum < duration);

    return sortOrder(routine);
  }

  int getDuration(List<int> duration, int routineDuration, double sum) {
    if (routineDuration - sum == 1 || routineDuration == 10) return 60;

    final random = Random();
    return duration[random.nextInt(duration.length)];
  }

  Exercise getRandomExercise(List<Exercise> exercises, List<Exercise> chosen) {
    final random = Random();
    Exercise exercise = exercises[random.nextInt(exercises.length)];
    if (chosen.contains(exercise)) {
      return getRandomExercise(exercises, chosen);
    }
    return exercise;
  }

  List<Exercise> sortOrder(List<Exercise> exercises) {
    int order = 0;
    for (var elem in exercises.where((element) => element.equipped == true)) {
      elem.order = order;
      order++;
    }
    for (var elem in exercises
        .where((element) => element.equipped == false && element.id != "38")) {
      elem.order = order;
      order++;
    }
    int id = exercises.indexWhere((element) => element.id == "38");
    if (id > -1) {
      exercises[id].order = order;
    }
    return exercises;
  }
}
