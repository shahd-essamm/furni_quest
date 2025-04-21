class UserModel {
  final String id;
  final String status;
  final String message;
  final String accountType;

  UserModel({
    required this.id,
    required this.status,
    required this.message,
    required this.accountType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user_id'],
      status: json['status'],
      message: json['message'],
      accountType: json['account_type'],
    );
  }
}
