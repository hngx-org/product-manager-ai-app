// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  @HiveField(6)
  String cookie;

  User({
    required this.createdAt,
    required this.credit,
    required this.email,
    required this.id,
    required this.name,
    required this.updatedAt,
    required this.cookie,
  });

  @override
  String toString() {
    return 'User(createdAt: $createdAt, credit: $credit, email: $email, id: $id, name: $name, updatedAt: $updatedAt, cookie: $cookie)';
  }
}
