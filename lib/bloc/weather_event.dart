// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherFetchSuccessEvent extends WeatherEvent {
  final double lat;
  final double lon;
  const WeatherFetchSuccessEvent({
    required this.lat,
    required this.lon,
  });

  @override
  List<Object> get props => [lat, lon];
}
