import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
var data;
Future getWeather() async {
  var response=await http.get(
      Uri.encodeFull('http://api.openweathermap.org/data/2.5/weather?q=Bareilly&units=metric&appid=a3ad5f5871af6f892541a7f3c9fbe8d8'),
  );
  print('Got the data');
  setState(() {
    data=jsonDecode(response.body);
  });
}
@override
  void initState() {
    super.initState();
    this.getWeather();
  }
  @override
  Widget build(BuildContext context) {
  return data==null? Scaffold(body: Center(child: CircularProgressIndicator(),),):
      Stack(
      fit: StackFit.expand,
      children: [
        Image.network('https://media2.giphy.com/media/Eqz8ZFUScPHH2/giphy.gif',fit: BoxFit.fill,),
        Scaffold(
            backgroundColor:Colors.transparent,
            appBar: AppBar(backgroundColor:Colors.white,title: Center(child: Text('${data['name']}',style: TextStyle(color: Colors.white),))),
            body: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.0),
                  height: 350.0,
                  child:Column(
                    children: [
                      Text("${data['main']['temp']}\u00B0",style: TextStyle(color: Colors.white,fontSize: 70.0),),
                    Text("${data['weather'][0]['main']}",style: TextStyle(color: Colors.white),)],
                  ),
                ),
                Card(
                    margin: EdgeInsets.all(10.0),
                    color: Colors.white.withOpacity(0.1),
                    child: Column(
                      children: [
                        ListTile(
                          title:Text("${data['main']['feels_like']}\u00B0",style: TextStyle(color:Theme.of(context).accentColor),),
                          subtitle:Text('Temperature Felt',style: TextStyle(color: Colors.white38),),
                          trailing:
                          FaIcon(FontAwesomeIcons.thermometerThreeQuarters,color: Colors.white,),),
                        ListTile(
                          title:Text("${data['wind']['speed']}m/s",style: TextStyle(color:Theme.of(context).accentColor),),
                          subtitle:Text('Northerly Wind',style: TextStyle(color: Colors.white38),),
                          trailing:
                          FaIcon(FontAwesomeIcons.wind,color: Colors.white,),),
                        ListTile(
                          title:Text("${data['main']['pressure']}hPa",style: TextStyle(color:Theme.of(context).accentColor),),
                          subtitle:Text('Air Pressure',style: TextStyle(color: Colors.white38),),
                          trailing:
                          FaIcon(FontAwesomeIcons.tachometerAlt,color: Colors.white,),),
                        ListTile(
                          title:Text("${data['main']['humidity']}%",style: TextStyle(color:Theme.of(context).accentColor),),
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
