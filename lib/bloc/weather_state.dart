part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
  
  @override
  List<Object> get props => [];
}

final class WeatherInitialState extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}
final class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherModel;

  const WeatherSuccessState({required this.weatherModel});
  @override
  List<Object> get props => [weatherModel];
}
final class WeatherFailedState extends WeatherState {
  final String errorMsg;

  const WeatherFailedState({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}

