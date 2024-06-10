class UserModel {
  UserModel({
    required this.user,
    required this.sms,
    required this.dateTime,
    this.isMe,
  });

  final String user;
  final String sms;
  final DateTime dateTime;
  bool? isMe;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'sms': sms,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'isMe': isMe,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      user: map['user'] as String,
      sms: map['sms'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      isMe: map['isMe'] != null ? map['isMe'] as bool : null,
    );
  }
}
