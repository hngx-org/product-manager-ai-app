import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String createdAt;
  @HiveField(1)
  int credit;
  @HiveField(2)
  String email;
  @HiveField(3)
  String id;
  @HiveField(4)
  String name;
  @HiveField(5)
  String updatedAt;

  User({
    required this.createdAt,
    required this.credit,
    required this.email,
    required this.id,
    required this.name,
    required this.updatedAt,
  });
}
