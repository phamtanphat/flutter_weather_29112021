/// wind : {"speed":1.39"}

class Wind {
  Wind({
    double? speed
  }){
    _speed = speed;
  }

  Wind.fromJson(dynamic json) {
    _speed = json['speed'];
  }
  double? _speed;

  double? get speed => _speed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = _speed;
    return map;
  }

}