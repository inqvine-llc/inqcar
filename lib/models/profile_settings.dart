class ProfileSettings {
  ProfileSettings({
    this.name = '',
    this.password = '',
    this.theme = 'light',
  });

  final String name;
  final String password;
  final String theme;

  factory ProfileSettings.fromJson(Map<String, dynamic> json) {
    return ProfileSettings(
      name: json['name'] ?? '',
      password: json['password'] ?? '',
      theme: json['theme'] ?? 'light',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
      'theme': theme,
    };
  }
}
