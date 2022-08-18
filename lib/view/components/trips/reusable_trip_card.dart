import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../helpers/constants.dart';

class ReusableTripCard extends StatefulWidget {
  const ReusableTripCard({Key? key}) : super(key: key);

  @override
  State<ReusableTripCard> createState() => _ReusableTripCardState();
}

class _ReusableTripCardState extends State<ReusableTripCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Constants.height * 0.02),
      padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.03, vertical: Constants.height * 0.02),
      decoration: BoxDecoration(
          color: Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xffEAEAEB))
      ),
      child: Column(
        children: [
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
                  Text(
                    DateFormat('dd-MM-yyyy').format(DateTime.now()),
                    style: TextStyle(
                        color: Color(0xff7A7A7B),
                        fontFamily: 'semiBold',
                        fontSize: Constants.width * 0.035
                    ),
                  ),
                  SizedBox(height: Constants.height * 0.01,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04, vertical: Constants.height * 0.01),
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
              )
            ],
          ),
          SizedBox(height: Constants.height * 0.02,),
          Container(
            width: Constants.width,
            height: 2,
            color: Color(0xffEAEAEB),
          ),
          SizedBox(height: Constants.height * 0.02,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/trips/stepperIcon.png', height: Constants.height * 0.11,),
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
                    width: Constants.width * 0.77,
                    child: Text(
                      'Dwarka, Sector -65, New Delhi',
                      style: TextStyle(
                          color: Color(0xff565657),
                          fontFamily: 'bold'
                      ),
                    ),
                  ),
                  SizedBox(height: Constants.height * 0.02,),
                  Container(
                    // width: Constants.width * 0.78,
                    width: Constants.width * 0.76,
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
                    width: Constants.width * 0.77,
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
          )
        ],
      ),
    );
  }
}
