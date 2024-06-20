import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weatherapp/api%20key/api_key.dart';
import 'package:weatherapp/model/weather_model.dart';

class WeatherRepository {
  Dio dio = Dio();
  Future<Either<WeatherModel, String>> fetchWeatherInfo(
      {required double lon, required double lat}) async {
    try {
      final response = await dio.get(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey");
      final result = WeatherModel.fromJson(response.data);
      return Left(result);
    } on DioException catch (e) {
      return Right(
          e.response?.data["message"] ?? "Unabel to show Weather Information");
    } catch (e) {
      return Right(e.toString());
    }
  }
}
