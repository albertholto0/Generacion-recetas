class QuestionnaireData {
  static final QuestionnaireData _instance = QuestionnaireData._internal();
  factory QuestionnaireData() => _instance;
  QuestionnaireData._internal();

  List<String> tools = [];
  String? allergies;
  String? dislikes;
  String? exclusions;
  String? time;
  int? age;
  int? people;
  List<String> restrictions = [];
  String? otherRestriction;

  Map<String, dynamic> toMap() {
    return {
      'tools': tools,
      'allergies': allergies,
      'dislikes': dislikes,
      'exclusions': exclusions,
      'cooking_time': time,
      'age': age,
      'people_count': people,
      'restrictions': restrictions,
      'other_restriction': otherRestriction,
    };
  }
}
