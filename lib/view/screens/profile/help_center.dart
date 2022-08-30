import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

import '../../../helpers/constants.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.black,)),
          elevation: 0,
          backgroundColor: Constants.themeColor,
          centerTitle: true,
          title: Text(
            'Help Center',
            style: TextStyle(
                fontFamily: 'bold',
                fontSize: Constants.width * 0.04,
                color: Colors.black
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04, vertical: Constants.height * 0.02),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04, vertical: Constants.height * 0.02),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xffEAEAEB))
                ),
                child: Column(
                  children: [
                    Text(
                      'For any query you can send us mail & contact us on given number',
                      style: TextStyle(
                        fontFamily: 'medium',
                          fontSize: Constants.width * 0.035

                      ),
                    ),
                    SizedBox(height: Constants.height * 0.02,),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.02, vertical: Constants.height * 0.01),
                          decoration: BoxDecoration(
                              color: Constants.themeColor,
                              borderRadius: BorderRadius.circular(5),),
                          child: Image.asset('assets/icons/email.png', fit: BoxFit.fill, height: Constants.height * 0.02,),
                        ),
                        SizedBox(width: Constants.width * 0.02,),
                        Container(
                          width: Constants.width * 0.33,
                          child: Text(
                            'info@biotrips.com',
                            style: TextStyle(
                              fontFamily: 'medium',
                              color: Color(0xff565657),
                              fontSize: Constants.width * 0.03

                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.02, vertical: Constants.height * 0.01),
                          decoration: BoxDecoration(
                            color: Constants.themeColor,
                            borderRadius: BorderRadius.circular(5),),
                          child: Image.asset('assets/icons/phone.png', fit: BoxFit.fill, height: Constants.height * 0.02,),
                        ),
                        SizedBox(width: Constants.width * 0.02,),
                        Container(
                          width: Constants.width * 0.26,
                          child: Text(
                            '+917435436567',
                            style: TextStyle(
                                fontFamily: 'medium',
                                color: Color(0xff565657),
                              fontSize: Constants.width * 0.03
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: Constants.height * 0.02,),
              Expanded(
                child: ListView.builder( 
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      margin: EdgeInsets.only(bottom: Constants.height * 0.02),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 0.2,
                        child: GFAccordion(
                          titleChild: Text(
                            'What is Bio Trips?',
                            style: TextStyle(
                                fontFamily: 'semiBold'
                            ),
                          ),
                          contentChild: Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the',
                            style: TextStyle(
                                color: Color(0xff7A7A7B),
                                fontFamily: 'regular'
                            ),
                          ),
                          margin: EdgeInsets.all(0),
                          collapsedIcon: Icon(Icons.keyboard_arrow_down),
                          expandedIcon: Icon(Icons.keyboard_arrow_down),
                          expandedTitleBackgroundColor: Colors.white,
                          titleBorderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
