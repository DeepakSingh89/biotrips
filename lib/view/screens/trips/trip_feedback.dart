import 'package:biotrips/helpers/constants.dart';
import 'package:biotrips/helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class TripFeedback extends StatefulWidget {
  const TripFeedback({Key? key}) : super(key: key);

  @override
  State<TripFeedback> createState() => _TripFeedbackState();
}

class _TripFeedbackState extends State<TripFeedback> {
  List<String> contList = ["Cleanliness", "Driving", "Politeness", "Other"];
  Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            margin: EdgeInsets.only(left: Constants.width * 0.01),
            child: Image.asset(
              'assets/logo.png',
              height: Constants.height * 0.05,
              fit: BoxFit.fill,
            )),
        actions: [
          Image.asset(
            'assets/icons/notification.png',
            width: Constants.width * 0.05,
          ),
          SizedBox(
            width: Constants.width * 0.04,
          )
        ],
        backgroundColor: Colors.grey.withOpacity(0.01),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            width: Constants.width,
            padding: EdgeInsets.symmetric(
                horizontal: Constants.width * 0.04,
                vertical: Constants.height * 0.02),
            color: Colors.grey.withOpacity(0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Constants.height * 0.02,
                ),
                Utils.googleMapWidget,
              ],
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.4,
            maxChildSize: 1,
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
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Constants.height * 0.02,
                    ),
                    Text(
                      'You have arrived',
                      style: TextStyle(
                          fontFamily: 'bold', fontSize: Constants.width * 0.04),
                    ),
                    SizedBox(
                      height: Constants.height * 0.03,
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
                          width: Constants.width * 0.04,
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
                    const Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: Constants.height * 0.03,
                    ),
                    Center(
                      child: Text(
                        'HOW WAS YOUR TRIP?',
                        style: TextStyle(
                            fontFamily: 'bold',
                            fontSize: Constants.width * 0.04),
                      ),
                    ),
                    SizedBox(
                      height: Constants.height * 0.03,
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Color(0xffF5DC1B),
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(height: Constants.height * 0.03),
                    SizedBox(
                      height: Constants.height * 0.08,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: contList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                _color = const Color(0xffF5DC1B);
                              });
                            },
                            child: Container(
                              height: Constants.height * 0.08,
                              width: Constants.width * 0.08,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                 color: _color,
                                 borderRadius: BorderRadius.circular(5),
                                 border: Border.all(
                                  color: Color(0xffF5DC1B),
                                  width: 1.0
                                 )
                              ),
                               child: Text(
                                contList[index],

                               ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: Constants.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        width: Constants.width,
                        padding: EdgeInsets.symmetric(
                            horizontal: Constants.width * 0.12,
                            vertical: Constants.height * 0.015),
                        decoration: BoxDecoration(
                            color: Constants.themeColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Submit Feedback',
                            style: TextStyle(
                                fontFamily: 'bold',
                                fontSize: Constants.width * 0.045),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Constants.height * 0.02,
                    ),
                     InkWell(
                      onTap: () => Get.back(),
                       child: Center(
                            child: Text(
                              'Close',
                              style: TextStyle(
                                  fontFamily: 'bold',
                                  fontSize: Constants.width * 0.045),
                            ),
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
