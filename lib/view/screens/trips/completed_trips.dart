import 'package:biotrips/view/components/trips/reusable_trip_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../helpers/constants.dart';

class CompletedTrips extends StatefulWidget {
  const CompletedTrips({Key? key}) : super(key: key);

  @override
  State<CompletedTrips> createState() => _CompletedTripsState();
}

class _CompletedTripsState extends State<CompletedTrips> {
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
              child: ReusableTripCard(),
            );
          },
        ),
      ),
    );
  }
}

