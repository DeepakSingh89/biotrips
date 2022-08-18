import 'package:biotrips/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:intl/intl.dart';

import '../../components/trips/reusable_trip_card.dart';

class UpcomingTrips extends StatefulWidget {
  const UpcomingTrips({Key? key}) : super(key: key);

  @override
  State<UpcomingTrips> createState() => _UpcomingTripsState();
}

class _UpcomingTripsState extends State<UpcomingTrips> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.03, vertical: Constants.height * 0.03),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/TripDetails');
              },
              child: ReusableTripCard()
            );
          },
        ),
      ),
    );
  }
}
