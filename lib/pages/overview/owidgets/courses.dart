class Courses {
  String clist;

  Courses({required this.clist});

  factory Courses.fromJson(Map<String, dynamic> json) {
    return Courses(clist: json['CourseID'] as String);
  }
}
