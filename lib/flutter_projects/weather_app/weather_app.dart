import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learn_flutter/flutter_projects/weather_app/additional_info_item.dart';
import 'package:learn_flutter/flutter_projects/weather_app/hourly_forecast_cart.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar part
      appBar: AppBar(
        //👉👉 leading le starting ma ani action le end ma space linxa.
        leading: const Icon(Icons.list),
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
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      //body part
      body: Padding(
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
                          const Text(
                            "23° C",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Rain",
                            style: TextStyle(
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
              "Weather Forecast",
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  // card
                  HourlyForecastCard(
                    time: "6:00",
                    icon: Icons.sunny_snowing,
                    value: "28",
                  ),
                  HourlyForecastCard(
                    time: "7:00",
                    icon: Icons.cloud,
                    value: "30",
                  ),
                  HourlyForecastCard(
                    time: "8:00",
                    icon: Icons.sunny,
                    value: "32",
                  ),
                  HourlyForecastCard(
                    time: "9:00",
                    icon: Icons.sunny_snowing,
                    value: "30",
                  ),
                  HourlyForecastCard(
                    time: "10:00",
                    icon: Icons.cloud,
                    value: "30",
                  ),
                  HourlyForecastCard(
                    time: "11:00",
                    icon: Icons.sunny,
                    value: "32",
                  ),
                  HourlyForecastCard(
                    time: "12:00",
                    icon: Icons.sunny,
                    value: "33",
                  )
                ],
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
              children: const [
                AdditionalInfoItem(
                  icon: Icons.water_drop,
                  label: "Humidity",
                  value: "94",
                ),
                AdditionalInfoItem(
                  icon: Icons.air,
                  label: "Wind Speed",
                  value: "7.67",
                ),
                AdditionalInfoItem(
                  icon: Icons.beach_access,
                  label: "Pressure",
                  value: "1000",
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
