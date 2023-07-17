import 'package:hive/hive.dart';

part 'data_model.g.dart';

@HiveType(typeId: 1)
class SignUpModel {
  @HiveField(0)
  final String username;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String password;

  @HiveField(4)
  final String id;

  SignUpModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });
}

@HiveType(typeId: 2)
class PersonalDetails {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String gender;
  @HiveField(2)
  final String height;
  @HiveField(3)
  final String weight;
  @HiveField(4)
  final String bmi;
  @HiveField(5) 
  final String type;

  PersonalDetails(
      {required this.id,
      required this.gender,
      required this.height,
      required this.weight,
      required this.bmi,
      required this.type});
}
