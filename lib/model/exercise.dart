class Exercise {
  String id = "";
  String description = "";
  List<String> instruction = [];
  List<int> duration = [];
  bool double = false;
  bool equipped = false;
  List<String> stimulus = [];
  int order = -1;

  Exercise(
      {required this.id,
      required this.description,
      required this.instruction,
      required this.duration,
      required this.double,
      required this.equipped,
      required this.stimulus});

  Exercise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    instruction = json['instruction'].cast<String>();
    duration = json['duration'].cast<int>();
    double = json['double'] == 'true' ? true : false;
    equipped = json['equipped'] == 'true' ? true : false;
    stimulus = json['stimulus'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
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
