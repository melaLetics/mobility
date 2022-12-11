import './exercise.dart';

class Import {
  List<Exercise>? exercises;

  Import({this.exercises});

  Import.fromJson(Map<String, dynamic> json) {
    if (json['exercises'] != null) {
      exercises = <Exercise>[];
      json['exercises'].forEach((v) {
        exercises!.add(Exercise.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (exercises != null) {
      data['exercises'] = exercises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
