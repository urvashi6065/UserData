class UserDataModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  var email_verified_at;
  final String password;
  var otp;
  final String device_id;
  final String fcm_token;
  var image;
  var address;
  var city;
  var state;
  var pincode;
  var country;
  final String today_visitor;
  var plan_date;
  var expiry_date;
  var duration;
  final String subscription;
  var demo;
  var note1;
  var note2;
  var note3;
  var remember_token;
  final String created_at;
  final String updated_at;

  UserDataModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.device_id,
      required this.fcm_token,
      required this.today_visitor,
      required this.subscription,
      required this.created_at,
      required this.updated_at});

  factory UserDataModel.fromapi(Map map) {
    return UserDataModel(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        phone: map['phone'],
        password: map['password'],
        device_id: map['device_id'],
        fcm_token: map['fcm_token'],
        today_visitor: map['today_visitor'],
        subscription: map['subscription'],
        created_at: map['created_at'],
        updated_at: map['updated_at']);
  }
}
