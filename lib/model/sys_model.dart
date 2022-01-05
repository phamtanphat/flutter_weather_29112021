/// sys : {"country":"VN"}
class Sys {
  Sys({
    String? country}){
    _country = country;;
  }

  Sys.fromJson(dynamic json) {
    _country = json['country'];
  }
  String? _country;

  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = _country;
    return map;
  }

}
