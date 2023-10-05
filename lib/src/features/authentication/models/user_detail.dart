// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserDetail {
  final String? name;
  final String? email;
  final String? id;
  final int? credits;
  final String? cookie;

  UserDetail({
    this.name,
    this.email,
    this.id,
    this.credits,
    this.cookie,
  });

  @override
  String toString() {
    return 'UserDetail(name: $name, email: $email, id: $id, credits: $credits, cookies: $cookie)';
  }
}
