class UserModel {
  String uid;
  bool isOnboarding;
  String userName;
  String email;
  bool isFirst;
  String interest;
  String introduction;
  String country;
  int coupon;

  UserModel({
    required this.uid,
    required this.isOnboarding,
    required this.userName,
    required this.email,
    required this.isFirst,
    required this.interest,
    required this.introduction,
    required this.country,
    required this.coupon,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'isOnboarding': isOnboarding,
        'userName': userName,
        'email': email,
        'isFirst': isFirst,
        'interest': interest,
        'introduction': introduction,
        'country': country,
      };

  factory UserModel.fromDoc(userDoc) {
    return UserModel(
      uid: userDoc['uid'] ?? '',
      isOnboarding: userDoc['isOnboarding'] ?? false,
      userName: userDoc!['userName'] ?? '',
      email: userDoc['email'] ?? '',
      isFirst: userDoc['isFirst'] ?? false,
      interest: userDoc['interest'] ?? '',
      introduction: userDoc['introduction'] ?? '',
      country: userDoc['country'] ?? '',
      coupon: userDoc['coupon'] ?? 0,
    );
  }

  factory UserModel.init() {
    return UserModel(
      uid: '',
      isOnboarding: false,
      userName: '',
      email: '',
      isFirst: true,
      interest: '',
      introduction: '',
      country: '',
      coupon: 0,
    );
  }
}
