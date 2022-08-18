
import 'package:biotrips/view/screens/authentication/login.dart';
import 'package:biotrips/view/screens/authentication/verify_otp.dart';
import 'package:biotrips/view/screens/dashboard/dashboard.dart';
import 'package:biotrips/view/screens/home/trip_status.dart';
import 'package:biotrips/view/screens/onboarding/onboarding1.dart';
import 'package:biotrips/view/screens/onboarding/onboarding2.dart';
import 'package:biotrips/view/screens/onboarding/onboarding3.dart';
import 'package:biotrips/view/screens/profile/edit_profile.dart';
import 'package:biotrips/view/screens/profile/help_center.dart';
import 'package:biotrips/view/screens/profile/notifications.dart';
import 'package:biotrips/view/screens/trips/trip_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/OnBoarding1':
        return MaterialPageRoute(builder: (_) => OnBoarding1());
      case '/OnBoarding2':
        return MaterialPageRoute(builder: (_) => OnBoarding2());
      case '/OnBoarding3':
        return MaterialPageRoute(builder: (_) => OnBoarding3());
      case '/Login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/VerifyOtp':
        return MaterialPageRoute(builder: (_) => VerifyOtp());
      case '/Dashboard':
        return MaterialPageRoute(builder: (_) => Dashboard());
      case '/EditProfile':
        return MaterialPageRoute(builder: (_) => EditProfile());
      case '/Notifications':
        return MaterialPageRoute(builder: (_) => Notifications());
      case '/HelpCenter':
        return MaterialPageRoute(builder: (_) => HelpCenter());
      case '/TripDetails':
        return MaterialPageRoute(builder: (_) => TripDetails());
      case '/TripStatus':
        return MaterialPageRoute(builder: (_) => TripStatus());
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
