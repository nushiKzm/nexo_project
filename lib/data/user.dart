class UserEntity {
  final int id;
  final String name;
  final int age;
  final String date;

  UserEntity.fromJson(Map<String, dynamic> json)
      : id = json['ID'],
        name = json['Nmae'],
        age = json['Age'],
        date = json['Date'];
}
