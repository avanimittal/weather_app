class WeatherModel{

  String name;
  String temp;
  String airPressure;
  String wind;
  String humidity;

  WeatherModel({
    this.name,
    this.airPressure,
    this.humidity,
    this.temp,
    this.wind
  });

  factory WeatherModel.fromJson(Map<String,dynamic> item){
    return WeatherModel(
      name: item["name"],
    );
  }

}