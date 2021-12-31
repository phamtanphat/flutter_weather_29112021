import 'package:flutter/material.dart';
import 'package:flutter_weather_29112021/main.dart';

class WeatherPage extends StatefulWidget {
  late double width;
  late double height;

  static WeatherPage of(BuildContext context){
    return context.findAncestorWidgetOfExactType()!;
  }
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  @override
  Widget build(BuildContext context) {
    widget.width = MediaQuery.of(context).size.width;
    widget.height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            searchBox(),
            tempCity()
          ],
        ),
      ),
    );
  }

  Widget searchBox() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: "Input city name",
          suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {}),
      ),
    );
  }

  Widget tempCity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("31 \u00BA C" , style: TextStyle(color: Colors.yellow , fontSize: widget.width / 8))
      ],
    );
  }
}
