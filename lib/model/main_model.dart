/// main : {"temp":20,"pressure":1016,"humidity":81}

class Main {
  Main({
    int? temp,
    int? pressure,
    int? humidity
  }){
    _temp = temp;
    _pressure = pressure;
    _humidity = humidity;
  }

  Main.fromJson(dynamic json) {
    _temp = json['temp'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
  }
  int? _temp;
  int? _pressure;
  int? _humidity;

  int? get temp => _temp;
  int? get pressure => _pressure;
  int? get humidity => _humidity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = _temp;
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    return map;
  }

}