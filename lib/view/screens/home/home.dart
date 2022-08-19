import 'package:biotrips/helpers/utils.dart';
import 'package:biotrips/view/components/trips/reusable_trip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../helpers/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedWeekDayIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: Constants.width * 0.01),
          child: Image.asset('assets/logo.png', height: Constants.height * 0.05, fit: BoxFit.fill,)),
        actions: [
          Image.asset('assets/icons/notification.png', width: Constants.width * 0.05,),
          SizedBox(width: Constants.width * 0.04,)
        ],
        backgroundColor: Colors.grey.withOpacity(0.01),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            width: Constants.width,
            padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04, vertical: Constants.height * 0.02),
            color: Colors.grey.withOpacity(0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Abhijit!',
                  style: TextStyle(
                    fontFamily: 'regular',
                    fontSize: Constants.width * 0.04
                  ),
                ),
                SizedBox(height: Constants.height * 0.01,),
                Text(
                  'Here are your Trips for Tuesday',
                  style: TextStyle(
                      fontFamily: 'semiBold',
                      fontSize: Constants.width * 0.04
                  ),
                ),
                SizedBox(height: Constants.height * 0.035,),
                Container(
                  height: Constants.height * 0.09,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index){
                      return WeekDayWidget(
                        day: 'M',
                        date: '15',
                        backgroundColor: selectedWeekDayIndex == index ? Color(0xff282829) : Colors.white,
                        textColor: selectedWeekDayIndex == index ? Colors.white : Color(0xff616161),
                        onTap: (){
                          setState((){
                            selectedWeekDayIndex = index;
                          });
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: Constants.height * 0.02,),
                Utils.googleMapWidget,
              ],
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.4,
            maxChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04),
                decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ) 
                ),                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Constants.height * 0.02,),
                    Center(
                      child: Container(
                        height: 4,
                        width: 60,
                        decoration: BoxDecoration(
                   color: Colors.grey,
                  borderRadius: BorderRadius.circular(50),
                ),    
                ),
              ),
                    SizedBox(height: Constants.height * 0.02,),
                    Text(
                      'You have 3 Trips Today.',
                      style: TextStyle(
                        fontFamily: 'bold',
                        fontSize: Constants.width * 0.04
                      ),
                    ),
                    SizedBox(height: Constants.height * 0.03,),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, '/TripStatus');
                            },
                            child: ReusableTripCard());
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class WeekDayWidget extends StatelessWidget {
  WeekDayWidget({this.day, this.date, this.backgroundColor, this.textColor, this.onTap});
  String? day;
  String? date;
  Color? backgroundColor;
  Color? textColor;
  Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          onTap!.call();
        },
        child: Container(
          margin: EdgeInsets.only(right: Constants.width * 0.04),
          padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: backgroundColor,

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day ?? '',
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'semiBold',
                  fontSize: Constants.width * 0.05
                ),
              ),
              Text(
                date ?? '',
                style: TextStyle(
                    color: textColor,
                    fontFamily: 'semiBold',
                    fontSize: Constants.width * 0.05

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var initialCameraPosition = CameraPosition(target: LatLng(22.2170, 70.7525), zoom: 11.5);
  @override
  Widget build(BuildContext context) {
    return GoogleMap(initialCameraPosition: initialCameraPosition);
  }
}


