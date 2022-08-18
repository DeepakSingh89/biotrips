import 'package:biotrips/helpers/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04),
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: Constants.height * 0.08,),
              Image.asset('assets/onboarding/onBoarding1Asset.png', fit: BoxFit.fill,),
              SizedBox(height: Constants.height * 0.03,),
              Text(
                'Easily Commute to Office',
                style: TextStyle(
                  fontFamily: 'bold',
                  fontSize: Constants.width * 0.075
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Constants.height * 0.03,),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                style: TextStyle(
                    fontFamily: 'regular',
                    color: Color(0xff7A7A7B),
                    fontSize: Constants.width * 0.04
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Constants.height * 0.03,),
              Image.asset('assets/onboarding/dot1.png', height: Constants.height * 0.01, fit: BoxFit.fill,),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamedAndRemoveUntil(context, '/Login', (route) => false);
                    },
                    child: Text(
                      'SKIP',
                      style: TextStyle(
                        fontFamily: 'semiBold',
                        color: Color(0xff7A7A7B),
                        fontSize: Constants.width * 0.045
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/OnBoarding2');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.12, vertical: Constants.height * 0.015),
                      decoration: BoxDecoration(
                        color: Constants.themeColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                                fontFamily: 'bold',
                                fontSize: Constants.width * 0.045
                            ),
                          ),
                          SizedBox(width: Constants.width * 0.02,),
                          Image.asset('assets/icons/arrowRight.png', width: Constants.width * 0.03,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: Constants.height * 0.03,)
            ],
          ),
        ),
      ),
    );
  }
}
