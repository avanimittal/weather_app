class WeatherModel{

  String name;
  String temp;
  String tempFelt;
  String airPressure;
  String wind;
  String humidity;
  String status;

  WeatherModel({
    this.name,
    this.airPressure,
    this.humidity,
    this.temp,
    this.wind,
    this.status,
    this.tempFelt
  });

  factory WeatherModel.fromJson(Map<String,dynamic> item){
    return WeatherModel(
      name: item["name"],
      temp: item['main']['temp'],
      status: item['weather'][0]['main'],
      tempFelt: item['main']['feels_like'],
      wind: item['wind']['speed'],
      airPressure: item['main']['pressure'],
      humidity: item['main']['humidity']
    );
  }

}