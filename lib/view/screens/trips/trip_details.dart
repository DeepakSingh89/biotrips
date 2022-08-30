import 'package:biotrips/view/components/trips/reusable_passenger_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../helpers/constants.dart';

class TripDetails extends StatefulWidget {
  const TripDetails({Key? key}) : super(key: key);

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Image.asset('assets/icons/close.png', fit: BoxFit.fill, height: Constants.height * 0.04)),
          elevation: 0,
          backgroundColor: Constants.themeColor,
          centerTitle: true,
          title: Text(
            'Trip Details',
            style: TextStyle(
                fontFamily: 'bold',
                fontSize: Constants.width * 0.04,
                color: Colors.black
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04, vertical: Constants.height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              // SizedBox(height: Constants.height * 0.04,),
              Text(
                  'DRIVER DETAILS',
                  style: TextStyle(
                      fontFamily: 'bold',
                      fontSize: Constants.width * 0.04
                  ),
                ),
                SizedBox(height: Constants.height * 0.015,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Image.asset('assets/trips/profilePhoto.png', fit: BoxFit.fill, height: Constants.height * 0.06, width: Constants.width * 0.13,),
                    ),
                    SizedBox(width: Constants.width * 0.03,),
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
                SizedBox(height: Constants.height * 0.02,),
                Text(
                  'PASSENGERS',
                  style: TextStyle(
                      fontFamily: 'bold',
                      fontSize: Constants.width * 0.04
                  ),
                ),
                SizedBox(height: Constants.height * 0.02,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index){
                    return ReusablePassengerCard();
                  },
                ),
                SizedBox(height: Constants.height * 0.02,),
                Row(
                  children: [
                    Text(
                      'ROUTE DETAILS',
                      style: TextStyle(
                        fontFamily: 'bold',
                        fontSize: Constants.width * 0.04
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.06, vertical: Constants.height * 0.01),
                      decoration: BoxDecoration(
                          color: Color(0xffFEFCEB),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Color(0xff282829))
                      ),
                      child: Text(
                        'Trip started',
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: Constants.width * 0.03

                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: Constants.height * 0.015,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/trips/stepperIcon.png', height: Constants.height * 0.12,),
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
        ),
      ),
    );
  }
}
