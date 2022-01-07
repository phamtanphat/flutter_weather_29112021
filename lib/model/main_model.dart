/// main : {"temp":20,"pressure":1016,"humidity":81}

class Main {
  Main({
    num? temp,
    num? pressure,
    num? humidity
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
  num? _temp;
  num? _pressure;
  num? _humidity;

  num? get temp => _temp;
  num? get pressure => _pressure;
  num? get humidity => _humidity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = _temp;
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    return map;
  }

}