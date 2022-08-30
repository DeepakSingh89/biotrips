import 'package:biotrips/controller/profile_controller.dart';
import 'package:biotrips/helpers/constants.dart';
import 'package:biotrips/helpers/utils.dart';
import 'package:biotrips/view/screens/home/home.dart'; 
import 'package:biotrips/view/screens/trips/trips.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../profile/profile.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  final ProfileController _controller = Get.put(ProfileController());
  List tabs = [
    Home(),
    // Text('trips'),
    Trips(),
    Profile()
  ];

  @override
  void initState() {
    initializeGoogleMapWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: tabs[_selectedIndex],
          bottomNavigationBar: Container(
            child: BottomNavigationBar(
              elevation: 4,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              // selectedLabelStyle: TextStyle(color: Constants.themeColor, fontSize: Constants.width * 0.03),
              // unselectedLabelStyle: TextStyle(color: Colors.black),
              unselectedItemColor: Colors.black,
              selectedItemColor: Constants.themeColor,
              currentIndex: _selectedIndex,
              onTap: (index) {
                if (index == 2) {
                  _controller.getProfile();
                }
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    'assets/icons/homeFilled.png',
                    height: Constants.height * 0.03,
                  ),
                  icon: Image.asset(
                    'assets/icons/home.png',
                    height: Constants.height * 0.03,
                  ),
                  label: 'Home',
                  // backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/trips.png',
                    height: Constants.height * 0.03,
                  ),
                  activeIcon: Image.asset(
                    'assets/icons/tripsFilled.png',
                    height: Constants.height * 0.03,
                  ),
                  label: 'Trips',
                  // backgroundColor: Colors.green,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/profile.png',
                    height: Constants.height * 0.03
                  ),
                  activeIcon: Image.asset(
                    'assets/icons/profileFilled.png',
                    height: Constants.height * 0.03,
                  ),
                  label: 'Profile',
                  // backgroundColor: Colors.purple,
                ),
              ],
            ),
          )),
    );
  }

  void initializeGoogleMapWidget() {
    var initialCameraPosition =
        CameraPosition(target: LatLng(22.2170, 70.7525), zoom: 11.5);
    Utils.googleMapWidget = Expanded(
        child: GoogleMap(initialCameraPosition: initialCameraPosition));
  }
}
