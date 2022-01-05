/// weather : [{"main":"Clear","description":"clear sky","icon":"01n"}]

class Weather {
  Weather({
    String? main,
    String? description,
    String? icon,}){
    _main = main;
    _description = description;
    _icon = icon;
  }

  Weather.fromJson(dynamic json) {
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }
  String? _main;
  String? _description;
  String? _icon;

  String? get main => _main;
  String? get description => _description;
  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }


}