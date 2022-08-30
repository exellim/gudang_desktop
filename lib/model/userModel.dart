class UserModel {
  UserModel({
    int? id,
    String? username,
    String? password,
  }) {
    _id = id;
    _username = username;
    _password = password;
  }

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _password = json['password'];
  }
  int? _id;
  String? _username;
  String? _password;

  int? get id => _id;
  String? get username => _username;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['password'] = _password;
    return map;
  }
}
