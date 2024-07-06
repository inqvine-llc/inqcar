class ProfileSettings {
  ProfileSettings({
    this.name = '',
    this.password = '',
  });

  final String name;
  final String password;

  factory ProfileSettings.fromJson(Map<String, dynamic> json) {
    return ProfileSettings(
      name: json['name'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
    };
  }
}
