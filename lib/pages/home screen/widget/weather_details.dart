// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weatherapp/image%20path/image_path.dart';

import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/pages/home%20screen/widget/weather_info_card.dart';
import 'package:weatherapp/text%20style/my_text_style.dart';

class WeatherDetails extends StatelessWidget {
  final WeatherModel weatherModel;
  final String fotmattedDate;
  final String fotmattedTime;

  const WeatherDetails({
    super.key,
    required this.weatherModel,
    required this.fotmattedDate,
    required this.fotmattedTime,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        //location name
        Text(
          weatherModel.name,
          style: myTextStyle(
              fontsize: height * 0.0311,
              color: Colors.white,
              fontweight: FontWeight.bold),
        ),

        //location temperature
        Text(
          "${weatherModel.temperature.current.toStringAsFixed(2)} °C",
          style: myTextStyle(
            fontsize: height * 0.049,
            fontweight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        Text(
          weatherModel.weather[0].main,
          style: myTextStyle(
            fontsize: height * 0.024,
            fontweight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(
          height: height * .037,
        ),

        //for current date and time
        Text(
          fotmattedDate,
          style: myTextStyle(
            fontsize: height * 0.022,
            fontweight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          fotmattedTime,
          style: myTextStyle(
            fontsize: height * 0.022,
            fontweight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(
          height: height * .037,
        ),
        Container(
          height: height * 0.24,
          width: width * 0.51,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(imagePath))),
        ),

        SizedBox(
          height: height * .037,
        ),

        //for more weather details
        Container(
          height: height * 0.31,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.024, horizontal: width * 0.0255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WeatherInfoCard(
                      color: Colors.white,
                      height: height,
                      width: width,
                      iconData: Icons.wind_power,
                      title: "wind",
                      value: "${weatherModel.wind.speed} km/h",
                    ),
                    WeatherInfoCard(
                      height: height,
                      color: Colors.white,
                      width: width,
                      iconData: Icons.sunny,
                      title: "Max",
                      value:
                          "${weatherModel.maxTemperature.toStringAsFixed(2)}°C",
                    ),
                    WeatherInfoCard(
                      color: Colors.white,
                      height: height,
                      width: width,
                      iconData: Icons.wind_power,
                      title: "Min",
                      value:
                          "${weatherModel.minTemperature.toStringAsFixed(2)}°C",
                    ),
                  ],
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WeatherInfoCard(
                      color: Colors.amber,
                      height: height,
                      width: width,
                      iconData: Icons.water_drop,
                      title: "Humidity",
                      value: "${weatherModel.humidity}%",
                    ),
                    WeatherInfoCard(
                      color: Colors.amber,
                      height: height,
                      width: width,
                      iconData: Icons.air,
                      title: "Pressure",
                      value: "${weatherModel.pressure}hpa",
                    ),
                    WeatherInfoCard(
                      color: Colors.amber,
                      height: height,
                      width: width,
                      iconData: Icons.leaderboard,
                      title: "Sea-Level",
                      value: "${weatherModel.seaLevel}m",
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
