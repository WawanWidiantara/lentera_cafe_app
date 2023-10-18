class User {
  int? id;
  String? email;
  String? fullName;
  String? phoneNumber;
  dynamic profilePicture;
  String? dateJoined;
  String? lastLogin;
  bool? isActive;
  bool? isAdmin;
  bool? isSuperuser;

  User(
      {this.id,
      this.email,
      this.fullName,
      this.phoneNumber,
      this.profilePicture,
      this.dateJoined,
      this.lastLogin,
      this.isActive,
      this.isAdmin,
      this.isSuperuser});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    profilePicture = json['profile_picture'];
    dateJoined = json['date_joined'];
    lastLogin = json['last_login'];
    isActive = json['is_active'];
    isAdmin = json['is_admin'];
    isSuperuser = json['is_superuser'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['full_name'] = fullName;
    data['phone_number'] = phoneNumber;
    data['profile_picture'] = profilePicture;
    data['date_joined'] = dateJoined;
    data['last_login'] = lastLogin;
    data['is_active'] = isActive;
    data['is_admin'] = isAdmin;
    data['is_superuser'] = isSuperuser;
    return data;
  }
}
