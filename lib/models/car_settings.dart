class CarSettings {
  CarSettings({
    this.name = '',
    this.model = '',
    this.color = '',
  });

  final String name;
  final String model;
  final String color;

  factory CarSettings.fromJson(Map<String, dynamic> json) {
    return CarSettings(
      name: json['name'] ?? '',
      model: json['model'] ?? '',
      color: json['color'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'model': model,
      'color': color,
    };
  }
}
