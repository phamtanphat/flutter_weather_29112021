import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_weather_29112021/api/dio_client.dart';
import 'package:flutter_weather_29112021/api/request/temp_request.dart';
import 'package:flutter_weather_29112021/base/resource_model.dart';
import 'package:flutter_weather_29112021/model/demo_model.dart';
import 'package:flutter_weather_29112021/model/weather_model.dart';
import 'package:flutter_weather_29112021/repository/temp_repository.dart';

class WeatherPage extends StatefulWidget {
  late double width;
  late double height;

  static WeatherPage of(BuildContext context) {
    return context.findAncestorWidgetOfExactType()!;
  }

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late TempRequest tempRequest;
  late TempRepository repository;
  late Completer<ResourceModel<WeatherModel>> completer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tempRequest = TempRequest();
    repository = TempRepository(tempRequest);
    // completer = Completer();
    //
    // .then((value) {
    //   value.when(
    //       success: (WeatherModel model) =>
    //           completer.complete(ResourceModel.success(model)),
    //       loading: () => completer.complete(ResourceModel.loading()),
    //       error: ([String? message]) =>
    //           completer.completeError(ResourceModel.error(message)));
    // });
  }

  @override
  Widget build(BuildContext context) {
    widget.width = MediaQuery.of(context).size.width;
    widget.height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightBlueAccent,
              Colors.blue,
            ],
          )),
          constraints: BoxConstraints.expand(),
          padding: const EdgeInsets.all(5),
          child: FutureBuilder<ResourceModel<WeatherModel>>(
            future: repository.getTempCity("hanoi"),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Expanded(child: notFoundCity());
              }
              if (snapshot.hasData) {
                snapshot.data!.when(
                    success: (WeatherModel model){
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            searchBox(),
                            Expanded(flex: 5, child: tempCity()),
                            Expanded(flex: 2, child: detailTemp())
                          ]);
                    },
                    loading: (){
                      return Center(child: CircularProgressIndicator(color: Colors.blue,));
                    },
                    error: ([String? message]){
                      return Expanded(child: notFoundCity());
                    }
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget searchBox() {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        hintText: "Input city name",
        suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {}),
      ),
    );
  }

  Widget tempCity() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("31 \u00BA C",
            style: TextStyle(color: Colors.yellow, fontSize: widget.width / 4)),
        Text("Lagos,NG",
            style: TextStyle(color: Colors.white, fontSize: widget.width / 10)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://openweathermap.org/img/wn/04n@2x.png",
              width: widget.width / 2,
              height: widget.width / 3,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              width: 5,
            ),
            Text("broken clouds",
                style: TextStyle(
                    fontSize: widget.width / 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 107, 106, 102)))
          ],
        )
      ],
    );
  }

  Widget detailTemp() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Card(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/ic_humidity.png"),
                  Text("1013",
                      style: TextStyle(
                          fontSize: widget.width / 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900])),
                  Text("Humidity",
                      style: TextStyle(
                          fontSize: widget.width / 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500])),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/ic_wind.png"),
                  Text("1013",
                      style: TextStyle(
                          fontSize: widget.width / 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900])),
                  Text("Wind",
                      style: TextStyle(
                          fontSize: widget.width / 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500])),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/ic_air_pressure.png"),
                  Text("1013",
                      style: TextStyle(
                          fontSize: widget.width / 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900])),
                  Text("Air pressure",
                      style: TextStyle(
                          fontSize: widget.width / 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500])),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget notFoundCity() {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/ic_not_found.png"),
          Text("Seems like you aren't on earth",
              style:
                  TextStyle(fontSize: widget.width / 23, color: Colors.white)),
        ],
      ),
    );
  }
}
