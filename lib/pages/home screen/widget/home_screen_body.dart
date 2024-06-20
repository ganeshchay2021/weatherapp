// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:weatherapp/bloc/weather_bloc.dart';
import 'package:weatherapp/pages/home%20screen/widget/weather_details.dart';

class HomeScreenBody extends StatefulWidget {
  final double latitude;
  final double longitude;

  const HomeScreenBody({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
    print(widget.latitude);
    print(widget.longitude);

    context.read<WeatherBloc>().add(
        WeatherFetchSuccessEvent(lat: widget.latitude, lon: widget.longitude));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF676BD0),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          String formattedDate = DateFormat('EEEE, MMMM yyyy').format(
            DateTime.now(),
          );
          String formattedTime = DateFormat('hh:mm a').format(
            DateTime.now(),
          );
          if (state is WeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ),
            );
          } else if (state is WeatherSuccessState) {
            return Padding(
              padding: EdgeInsets.all(height * 0.018),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: WeatherDetails(
                        weatherModel: state.weatherModel,
                        fotmattedDate: formattedDate,
                        fotmattedTime: formattedTime,
                      ))
                    ],
                  )
                ],
              ),
            );
          } else if (state is WeatherFailedState) {
            return Center(
              child: Text(state.errorMsg),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
