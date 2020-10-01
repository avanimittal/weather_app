import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:weatherapp/models/APIResponse.dart';
import 'package:weatherapp/models/weather.dart';
import 'package:weatherapp/services/WeatherService.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


 final placeName = TextEditingController();
 APIResponse<WeatherModel> apiResponse;
 WeatherService weatherService;

 String name;
 String temp;
 String tempFelt;
 String airPressure;
 String wind;
 String humidity;
 String status;

getWeatherDetails(){
  weatherService.getWeather(placeName.text.toString()).then((value){
    apiResponse = value;
    setState(() {
      name =  apiResponse.data.name;
      temp = apiResponse.data.temp;
      status = apiResponse.data.status;
      tempFelt = apiResponse.data.tempFelt;
      wind = apiResponse.data.wind;
      airPressure = apiResponse.data.airPressure;
      humidity = apiResponse.data.humidity;
    });
  });
}
  @override
  Widget build(BuildContext context) {
  return Stack(
      fit: StackFit.expand,
      children: [
        Image.network('https://media2.giphy.com/media/Eqz8ZFUScPHH2/giphy.gif',fit: BoxFit.fill,),
        Scaffold(
            backgroundColor:Colors.transparent,
            appBar: AppBar(
              leading: Icon(Icons.search,color: Colors.black,),
                backgroundColor:Colors.white.withOpacity(0.7),
                title: Center(
                    child:TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search for a place"
                    ),
                    controller: placeName,
                  )
                ),
              actions: [
                IconButton(
                  icon: Icon(Icons.done,color: Colors.black,),
                  onPressed: getWeatherDetails,
                )
              ],
            ),
            body: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.0),
                  height: 350.0,
                  child:Column(
                    children: [
                      Text(temp ?? " ",style: TextStyle(color: Colors.white,fontSize: 70.0),),
                    Text(status ?? " ",style: TextStyle(color: Colors.white),)],
                  ),
                ),
                Card(
                    margin: EdgeInsets.all(10.0),
                    color: Colors.white.withOpacity(0.1),
                    child: Column(
                      children: [
                        ListTile(
                          title:Text(tempFelt ?? " ",style: TextStyle(color:Theme.of(context).accentColor),),
                          subtitle:Text('Temperature Felt',style: TextStyle(color: Colors.white38),),
                          trailing:
                          FaIcon(FontAwesomeIcons.thermometerThreeQuarters,color: Colors.white,),),
                        ListTile(
                          title:Text(wind ?? " ",style: TextStyle(color:Theme.of(context).accentColor),),
                          subtitle:Text('Northerly Wind',style: TextStyle(color: Colors.white38),),
                          trailing:
                          FaIcon(FontAwesomeIcons.wind,color: Colors.white,),),
                        ListTile(
                          title:Text(airPressure ?? " ",style: TextStyle(color:Theme.of(context).accentColor),),
                          subtitle:Text('Air Pressure',style: TextStyle(color: Colors.white38),),
                          trailing:
                          FaIcon(FontAwesomeIcons.tachometerAlt,color: Colors.white,),),
                        ListTile(
                          title:Text(humidity ?? " ",style: TextStyle(color:Theme.of(context).accentColor),),
                          subtitle:Text('Humidity',style: TextStyle(color: Colors.white38),),
                          trailing: FaIcon(FontAwesomeIcons.tint,color: Colors.white,),),
                      ],
                    )
                ),
              ],
            )
        ),
      ]
    );
  }
}
