import 'package:biotrips/helpers/constants.dart';
import 'package:biotrips/helpers/utils.dart';
import 'package:biotrips/view/components/trips/reusable_passenger_card.dart';
import 'package:biotrips/view/screens/dashboard/dashboard.dart';
import 'package:biotrips/view/screens/trips/trip_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripStatus extends StatefulWidget {
  const TripStatus({Key? key}) : super(key: key);

  @override
  State<TripStatus> createState() => _TripStatusState();
}

class _TripStatusState extends State<TripStatus> {
  var initialCameraPosition =
      CameraPosition(target: LatLng(19.2307, 72.8117), zoom: 11);
  Marker _origin = Marker(
      markerId: MarkerId('origin'),
      infoWindow: InfoWindow(title: 'Origin'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(19.4564, 72.8567));

  Marker _destination = Marker(
      markerId: MarkerId('destination'),
      infoWindow: InfoWindow(title: 'Destination'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(19.2307, 72.8117));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
              // Navigator.pushNamed(context,'/Dashboard');
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: initialCameraPosition,
              markers: {
                _origin,
                _destination,
              },
              polylines: {
                Polyline(
                    polylineId: PolylineId('overview_polyline'),
                    color: Constants.themeColor,
                    width: 5,
                    points: [
                      _origin.position,
                      _destination.position,
                    ])
              },
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.3,
            maxChildSize: 1,
            initialChildSize: 0.3,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding:
                    EdgeInsets.symmetric(horizontal: Constants.width * 0.04),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    )),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Constants.height * 0.02,
                      ),
                      Center(
                        child: Container(
                          height: 4,
                          width: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xffEAEAEB),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      SizedBox(height: Constants.height * 0.03),
                      Row(
                        children: [
                          Text(
                            'Your ride is scheduled at',
                            style: TextStyle(
                                fontFamily: 'bold',
                                fontSize: Constants.width * 0.04),
                          ),
                          SizedBox(
                            width: Constants.width * 0.01,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3, vertical: 2),
                            color: Constants.themeColor,
                            child: Text(
                              '20:44',
                              style: TextStyle(
                                  fontFamily: 'bold',
                                  fontSize: Constants.width * 0.04),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Constants.height * 0.015,
                      ),
                      Text(
                        'DRIVER DETAILS',
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: Constants.width * 0.04),
                      ),
                      SizedBox(
                        height: Constants.height * 0.015,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset(
                              'assets/trips/profilePhoto.png',
                              fit: BoxFit.fill,
                              height: Constants.height * 0.06,
                              width: Constants.width * 0.13,
                            ),
                          ),
                          SizedBox(
                            width: Constants.width * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Avinash Singh',
                                style: TextStyle(
                                    fontFamily: 'bold',
                                    fontSize: Constants.width * 0.04),
                              ),
                              SizedBox(
                                height: Constants.height * 0.005,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/trips/star.png',
                                    height: Constants.height * 0.02,
                                  ),
                                  SizedBox(
                                    width: Constants.width * 0.02,
                                  ),
                                  Text(
                                    '4.3',
                                    style: TextStyle(
                                        color: Color(0xff7A7A7B),
                                        fontFamily: 'semiBold',
                                        fontSize: Constants.width * 0.04),
                                  )
                                ],
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Constants.width * 0.02,
                                    vertical: 5),
                                decoration: BoxDecoration(
                                  color: Constants.themeColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'BR 0123 1321',
                                      style: TextStyle(
                                          fontFamily: 'bold',
                                          fontSize: Constants.width * 0.03,
                                          color: Color(0xff282829)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Constants.height * 0.01,
                              ),
                              Text(
                                'Hyundai Verna',
                                style: TextStyle(
                                    fontFamily: 'bold',
                                    fontSize: Constants.width * 0.035,
                                    color: Color(0xff7A7A7B)),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: Constants.height * 0.025,
                      ),
                      Text(
                        'PASSENGERS',
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: Constants.width * 0.04),
                      ),
                      SizedBox(
                        height: Constants.height * 0.02,
                      ),
                      ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: 4,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          // return Text('sdfs');
                          return ReusablePassengerCard();
                        },
                      ),
                      SizedBox(
                        height: Constants.height * 0.02,
                      ),
                      Text(
                        'ROUTE DETAILS',
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: Constants.width * 0.04),
                      ),
                      SizedBox(
                        height: Constants.height * 0.02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/trips/stepperIcon.png',
                              height: Constants.height * 0.14),
                          SizedBox(
                            width: Constants.width * 0.04,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Pickup Location',
                                style: TextStyle(
                                    color: Color(0xff7A7A7B),
                                    fontFamily: 'regular'),
                              ),
                              SizedBox(
                                height: Constants.height * 0.01,
                              ),
                              Container(
                                width: Constants.width * 0.82,
                                child: const Text(
                                  'Dwarka, Sector -65, New Delhi sdf sd sd sd fsd fsdf ',
                                  style: TextStyle(
                                      color: Color(0xff565657),
                                      fontFamily: 'bold'),
                                ),
                              ),
                              SizedBox(
                                height: Constants.height * 0.02,
                              ),
                              Container(
                                width: Constants.width * 0.82,
                                height: 1,
                                color: Color(0xff7A7A7B),
                              ),
                              SizedBox(
                                height: Constants.height * 0.02,
                              ),
                              const Text(
                                'Drop Location',
                                style: TextStyle(
                                    color: Color(0xff7A7A7B),
                                    fontFamily: 'regular'),
                              ),
                              SizedBox(
                                height: Constants.height * 0.01,
                              ),
                              Container(
                                width: Constants.width * 0.82,
                                child: const Text(
                                  'DLF Cyber Hub, Gurgaon',
                                  style: TextStyle(
                                      color: Color(0xff565657),
                                      fontFamily: 'bold'),
                                ),
                              ),
                              SizedBox(
                                height: Constants.height * 0.02,
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Constants.width * 0.5,
                            //  padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.12, vertical: Constants.height * 0.015),
                            height: Constants.height * 0.06,
                            decoration: BoxDecoration(
                              color: Constants.themeColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icons/call.png',
                                    fit: BoxFit.fill,
                                    height: Constants.height * 0.025),
                                SizedBox(width: 8),
                                Text(
                                  "Call Driver",
                                  style: TextStyle(
                                      fontFamily: 'bold',
                                      fontSize: Constants.width * 0.05,
                                      color: Color(0xff282829)),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, '/EmergencyScreen'),
                            child: Container(
                              width: Constants.width * 0.4,
                              //  padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.12, vertical: Constants.height * 0.015),
                              height: Constants.height * 0.06,
                              decoration: BoxDecoration(
                                  color: Colors.red.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1.0, color: Color(0xffFF0000))),
                              alignment: Alignment.center,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 5),
                                  Text(
                                    "Emergency",
                                    style: TextStyle(
                                        fontFamily: 'bold',
                                        fontSize: Constants.width * 0.05,
                                        color: Color(0xffFF0000)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Constants.height * 0.02),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
