import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository})
      : super(WeatherInitialState()) {
    on<WeatherFetchSuccessEvent>((event, emit) async {
      emit(WeatherLoadingState());
      final result = await weatherRepository.fetchWeatherInfo(lat: event.lat, lon: event.lon);
      result.fold((data) => emit(WeatherSuccessState(weatherModel: data)),
          (error) => emit(WeatherFailedState(errorMsg: error)));
    });
  }
}
