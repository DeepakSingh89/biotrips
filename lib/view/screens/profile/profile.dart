import 'package:biotrips/helpers/constants.dart';
import 'package:biotrips/helpers/utils.dart';
import 'package:biotrips/view/components/profile/alert_dialog_on_logout.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: Constants.width,
            padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04, vertical: Constants.height * 0.02),
            color: Constants.themeColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Constants.height * 0.02,),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/profile/profilePhoto.png'),
                  radius: Constants.width * 0.1,
                ),
                SizedBox(height: Constants.height * 0.03,),
                Text(
                  'Abhijit Kumar',
                  style: TextStyle(
                    fontFamily: 'bold',
                    fontSize: Constants.width * 0.06
                  ),
                ),
                SizedBox(height: Constants.height * 0.01,),
                Text(
                  '+917878178186',
                  style: TextStyle(
                      fontFamily: 'medium',
                      fontSize: Constants.width * 0.04
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04, vertical: Constants.height * 0.03),
            child: Column(
              children: [
                ReusableProfileWidget(imageUrl: 'assets/icons/profile.png', title: 'Edit Profile', onClickEvent: (){
                  Navigator.pushNamed(context, '/EditProfile');
                },),
                ReusableProfileWidget(imageUrl: 'assets/icons/notification.png', title: 'Notifications', onClickEvent: (){
                  Navigator.pushNamed(context, '/Notifications');
                },),
                ReusableProfileWidget(imageUrl: 'assets/icons/helpCenter.png', title: 'Help Center', onClickEvent: (){
                  Navigator.pushNamed(context, '/HelpCenter');
                },),
                ReusableProfileWidget(imageUrl: 'assets/icons/privacyPolicy.png', title: 'Privacy Policy', onClickEvent: (){},),
                ReusableProfileWidget(imageUrl: 'assets/icons/logout.png', title: 'Logout', onClickEvent: (){
                  Utils.showAlertDialog(context, AlertDialogOnLogout(), true);
                },),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ReusableProfileWidget extends StatelessWidget {
  ReusableProfileWidget({this.imageUrl, this.title, this.onClickEvent});
  String? imageUrl;
  String? title;
  Function? onClickEvent;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onClickEvent!.call();
      },
      child: AbsorbPointer(
        child: Container(
          width: Constants.width,
          margin: EdgeInsets.only(bottom: Constants.height * 0.035),
          child: Row(
            children: [
              Image.asset(imageUrl ?? '', height: Constants.height * 0.025,),
              SizedBox(width: Constants.width * 0.06,),
              Text(
                title ?? '',
                style: TextStyle(
                  fontFamily: 'semiBold',
                  fontSize: Constants.width * 0.05
                ),
              ),
              Spacer(),
              Image.asset('assets/profile/rightArrow.png', height: Constants.height * 0.02,)
            ],
          ),
        ),
      ),
    );
  }
}

