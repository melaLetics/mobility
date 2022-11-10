class Exercise {
  String? id;
  String? description;
  List<String>? instruction;
  List<int>? duration;
  String? double;
  String? equipped;
  List<String>? stimulus;

  Exercise(
      {this.id,
      this.description,
      this.instruction,
      this.duration,
      this.double,
      this.equipped,
      this.stimulus});

  Exercise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    instruction = json['instruction'].cast<String>();
    duration = json['duration'].cast<int>();
    double = json['double'];
    equipped = json['equipped'];
    stimulus = json['stimulus'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['description'] = description;
    data['instruction'] = instruction;
    data['duration'] = duration;
    data['double'] = double;
    data['equipped'] = equipped;
    data['stimulus'] = stimulus;
    return data;
  }
}
