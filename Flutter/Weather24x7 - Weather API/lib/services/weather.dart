import 'dart:convert';
import 'location.dart';
import 'networking.dart';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time !';
    } else if (temp > 20) {
      return 'Time for shorts and ๐ !';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค !';
    } else {
      return 'Bring a ๐งฅ just in case !';
    }
  }

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getLocation();
    double longitude = location.getLongitude();
    double latitude = location.getLatitude();
    Networking networking = Networking(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=730a352941cd89d742500f6b851d8f8e&units=metric");
    String data = await networking.getData();
    var decodedData = jsonDecode(data);
    return decodedData;
  }

  Future<dynamic> getCityData(String city) async {
    Networking networking = Networking(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=730a352941cd89d742500f6b851d8f8e&units=metric");
    String data = await networking.getData();
    var decodedData = jsonDecode(data);
    return decodedData;
  }
}
