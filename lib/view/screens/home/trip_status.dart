import 'package:biotrips/helpers/constants.dart';
import 'package:biotrips/helpers/utils.dart';
import 'package:biotrips/view/components/trips/reusable_passenger_card.dart';
import 'package:biotrips/view/screens/trips/trip_details.dart';
import 'package:flutter/material.dart';

class TripStatus extends StatefulWidget {
  const TripStatus({Key? key}) : super(key: key);

  @override
  State<TripStatus> createState() => _TripStatusState();
}

class _TripStatusState extends State<TripStatus> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.black,)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Utils.googleMapWidget,
          DraggableScrollableSheet(
            minChildSize: 0.4,
            maxChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04),
                color: Colors.white,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Constants.height * 0.02,),
                      Row(
                        children: [
                          Text(
                            'Your ride is scheduled at',
                            style: TextStyle(
                                fontFamily: 'bold',
                                fontSize: Constants.width * 0.04
                            ),
                          ),
                          SizedBox(width: Constants.width * 0.01,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                            color: Constants.themeColor,
                            child: Text(
                              '20:44',
                              style: TextStyle(
                                  fontFamily: 'bold',
                                  fontSize: Constants.width * 0.04
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Constants.height * 0.03,),
                      Text(
                        'DRIVER DETAILS',
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: Constants.width * 0.04
                        ),
                      ),
                      SizedBox(height: Constants.height * 0.03,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset('assets/trips/profilePhoto.png', fit: BoxFit.fill, height: Constants.height * 0.06, width: Constants.width * 0.13,),
                          ),
                          SizedBox(width: Constants.width * 0.04,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Avinash Singh',
                                style: TextStyle(
                                    fontFamily: 'bold',
                                    fontSize: Constants.width * 0.04
                                ),
                              ),
                              SizedBox(height: Constants.height * 0.005,),
                              Row(
                                children: [
                                  Image.asset('assets/trips/star.png', height: Constants.height * 0.02,),
                                  SizedBox(width: Constants.width * 0.02,),
                                  Text(
                                    '4.3',
                                    style: TextStyle(
                                        color: Color(0xff7A7A7B),
                                        fontFamily: 'semiBold',
                                        fontSize: Constants.width * 0.04
                                    ),
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
                                padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.02, vertical: 5),
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
                                          color: Color(0xff282829)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: Constants.height * 0.01,),
                              Text(
                                'Hyundai Verna',
                                style: TextStyle(
                                    fontFamily: 'bold',
                                    fontSize: Constants.width * 0.035,
                                    color: Color(0xff7A7A7B)
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: Constants.height * 0.03,),
                      Text(
                        'PASSENGERS',
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: Constants.width * 0.04
                        ),
                      ),
                      SizedBox(height: Constants.height * 0.02,),
                      ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index){
                          // return Text('sdfs');
                          return ReusablePassengerCard();
                        },
                      ),
                      SizedBox(height: Constants.height * 0.03,),
                      Text(
                        'ROUTE DETAILS',
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: Constants.width * 0.04
                        ),
                      ),
                      SizedBox(height: Constants.height * 0.02,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/trips/stepperIcon.png', height: Constants.height * 0.14),
                          SizedBox(width: Constants.width * 0.04,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pickup Location',
                                style: TextStyle(
                                    color: Color(0xff7A7A7B),
                                    fontFamily: 'regular'
                                ),
                              ),
                              SizedBox(height: Constants.height * 0.01,),
                              Container(
                                width: Constants.width * 0.82,
                                child: Text(
                                  'Dwarka, Sector -65, New Delhi sdf sd sd sd fsd fsdf ',
                                  style: TextStyle(
                                      color: Color(0xff565657),
                                      fontFamily: 'bold'
                                  ),
                                ),
                              ),
                              SizedBox(height: Constants.height * 0.02,),
                              Container(
                                width: Constants.width * 0.82,
                                height: 1,
                                color: Color(0xff7A7A7B),
                              ),
                              SizedBox(height: Constants.height * 0.02,),
                              Text(
                                'Drop Location',
                                style: TextStyle(
                                    color: Color(0xff7A7A7B),
                                    fontFamily: 'regular'
                                ),
                              ),
                              SizedBox(height: Constants.height * 0.01,),
                              Container(
                                width: Constants.width * 0.82,
                                child: Text(
                                  'DLF Cyber Hub, Gurgaon',
                                  style: TextStyle(
                                      color: Color(0xff565657),
                                      fontFamily: 'bold'
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),

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


