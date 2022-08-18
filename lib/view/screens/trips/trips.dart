import 'package:biotrips/helpers/constants.dart';
import 'package:biotrips/view/screens/trips/completed_trips.dart';
import 'package:biotrips/view/screens/trips/upcoming_trips.dart';
import 'package:flutter/material.dart';

class Trips extends StatefulWidget {
  const Trips({Key? key}) : super(key: key);

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('My Trips', style: TextStyle(color: Colors.black, fontFamily: 'bold'),),
            bottom: TabBar(
              tabs: [
                Tab(child: Text('UPCOMING', style: TextStyle(color: Colors.black, fontFamily: 'semiBold'),),),
                Tab(child: Text('COMPLETED', style: TextStyle(color: Colors.black, fontFamily: 'semiBold'),),)
              ],
              indicatorColor: Constants.themeColor,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Constants.themeColor
              ),
              padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.03),
            ),
          ),
          body: TabBarView(
            children: [
              UpcomingTrips(),
              CompletedTrips()
            ],
          ),
        ),
      ),
    );
  }
}
