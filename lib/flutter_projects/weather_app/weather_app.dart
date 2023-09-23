import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learn_flutter/flutter_projects/weather_app/additional_info_item.dart';
import 'package:learn_flutter/flutter_projects/weather_app/hourly_forecast_cart.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/flutter_projects/weather_app/weather_api.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  late Future<Map<String, dynamic>> weather;
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = "kathmandu";
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherApi',
        ),
      );
      final data = jsonDecode(res.body);
      if (int.parse(data['cod']) != 200) {
        throw data['message'];
      }
      /*
      👉👉futurebuilder ko satta ma yo pani use garna sakinxa
       but initially yesle 0 dekhauxa ani value fetch garxa 
       which is bad experience as well as future builder use garepaxi
       loading use garna painxa data fetch huda samma.
      setState(() {
        temp = (data['list'][0]['main']['temp']);
      });

      */

      //   print(data['list'][0]['main']['temp']);

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar part
      appBar: AppBar(
        //👉👉 leading le starting ma ani action le end ma space linxa.
        leading: const Icon(Icons.nights_stay),
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          // 👉👉GestureDetector pani use garna sakinxa inkwell ko thau ma
          //tarw inkwell ma less property hunxa
          // ani inkwell lai click garda click vayeko dekhinxa is called splash effect.
          /*  InkWell(
            onTap: () {},
            child: const Icon(Icons.refresh),
          ),
          👉👉icon ko lagi inkwell vanda iconbutton use garyo vane
          circle type ko splash hunxa click garda ani
          halka padding pani hunxa.
          
          */

          IconButton(
            onPressed: () {
              setState(() {
                weather = getCurrentWeather();
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      //body part
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          // print(snapshot);
          //  print(snapshot.runtimeType);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final data = snapshot.data!;
          final currentWeatherData = data['list'][0];
          final currentTemp = currentWeatherData['main']['temp'];
          final currentTempInC = currentTemp - 273.15;
          final currentSky = currentWeatherData['weather'][0]['main'];
          final humidity = currentWeatherData['main']['humidity'];

          //  print("$humidity");
          final windSpeed = currentWeatherData['wind']['speed'];
          final pressure = currentWeatherData['main']['pressure'];
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              //👉👉all elemet start from left and it use to another option of align widget in weather forcast text.s
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*  Placeholder(
                fallbackHeight: 250,
              ),
              👉👉it is mainly used for roughly design
              the outer raw UI for how it looks like
              */

                //main card
                SizedBox(
                  width: double.infinity,
                  //👉👉card to bubble container in little upside
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      //👉👉cliprect for set borderradius
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        //👉👉 it blur the outer side of cart & to check its design remove cliprect widget
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "${currentTempInC.toStringAsFixed(0)}°C",
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              currentSky == "Rain" || currentSky == "Clouds"
                                  ? Column(
                                      children: [
                                        const Icon(
                                          Icons.cloud,
                                          size: 64,
                                        ),
                                        currentSky == "Rain"
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    Icons.water_drop,
                                                    size: 12,
                                                  ),
                                                  Icon(
                                                    Icons.water_drop_outlined,
                                                    size: 12,
                                                  ),
                                                  Icon(
                                                    Icons.water_drop,
                                                    size: 12,
                                                  ),
                                                ],
                                              )
                                            : const SizedBox(),
                                      ],
                                    )
                                  : const Icon(Icons.sunny),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$currentSky",
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //👉👉to align text we use align widget then the container coz we need just align property.
                /*  const Align(
                alignment: Alignment.centerLeft,
                */
                const Text(
                  "Hourly Forecast",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //weather forecast card
                /* Placeholder(
                fallbackHeight: 100,
              ),*/
                /* 
                👉👉 to create loading item and yesko alternative
                 + best vaneko listview.builder ho so tyo use gareko 
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // card
                      for (int i = 1; i <= 12; i++)
                        HourlyForecastCard(
                          time: data['list'][i]['dt'].toString(),
                          icon:
                              data['list'][i]['weather'][0]['main'] == "Rain" ||
                                      data['list'][i]['weather'][0]['main'] ==
                                          "Clouds"
                                  ? Icons.cloud
                                  : Icons.sunny,
                          temperature:
                              (data['list'][i]['main']['temp'] - 273.15)
                                  .toStringAsFixed(0),
                        ),
                    ],
                  ),
                ), */
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 12,
                    itemBuilder: (BuildContext context, int index) {
                      /*  final dtTxt = data['list'][index + 1]['dt_txt'];
                      var time = dtTxt.substring(11, 16).toString();
                      // 👉👉11 means starting index ani 16 vaneko ending index ho dt_txt result ko. yo intl package ko alternative ho
                      final gettime = time;
                      */
                      final gettime =
                          DateTime.parse(data['list'][index + 1]['dt_txt']);
                      final icontype =
                          data['list'][index + 1]['weather'][0]['main'];
                      final temp =
                          (data['list'][index + 1]['main']['temp'] - 273.15)
                              .toStringAsFixed(0);
                      return HourlyForecastCard(
                        time: DateFormat.j().format(gettime),
                        icon: icontype == "Rain" || icontype == "Clouds"
                            ? Icons.cloud
                            : Icons.sunny,
                        temperature: temp,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //additional information
                const Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalInfoItem(
                      icon: Icons.water_drop_outlined,
                      label: "Humidity",
                      value: humidity.toString(),
                    ),
                    AdditionalInfoItem(
                      icon: Icons.air,
                      label: "Wind Speed",
                      value: windSpeed.toString(),
                    ),
                    AdditionalInfoItem(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: pressure.toString(),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
