import 'package:biotrips/controller/profile_controller.dart';
import 'package:biotrips/helpers/common_loader.dart';
import 'package:biotrips/helpers/constants.dart';
import 'package:biotrips/helpers/utils.dart';
import 'package:biotrips/model/profile_model.dart';
import 'package:biotrips/view/components/profile/alert_dialog_on_logout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final ProfileController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          profileInfo(),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Constants.width * 0.04,
                vertical: Constants.height * 0.03),
            child: Column(
              children: [
                ReusableProfileWidget(
                  imageUrl: 'assets/icons/profile.png',
                  title: 'Edit Profile',
                  onClickEvent: () {
                    Navigator.pushNamed(context, '/EditProfile');
                  },
                ),
                ReusableProfileWidget(
                  imageUrl: 'assets/icons/notification.png',
                  title: 'Notifications',
                  onClickEvent: () {
                    Navigator.pushNamed(context, '/Notifications');
                  },
                ),
                ReusableProfileWidget(
                  imageUrl: 'assets/icons/helpCenter.png',
                  title: 'Help Center',
                  onClickEvent: () {
                    Navigator.pushNamed(context, '/HelpCenter');
                  },
                ),
                ReusableProfileWidget(
                  imageUrl: 'assets/icons/privacyPolicy.png',
                  title: 'Privacy Policy',
                  onClickEvent: () {},
                ),
                ReusableProfileWidget(
                  imageUrl: 'assets/icons/logout.png',
                  title: 'Logout',
                  onClickEvent: () {
                    Utils.showAlertDialog(context, AlertDialogOnLogout(), true);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  profileInfo() {
    return Container(
          width: Constants.width,
          padding: EdgeInsets.symmetric(
              horizontal: Constants.width * 0.04,
              vertical: Constants.height * 0.02),
          color: Constants.themeColor,
          child: _controller.obx((state) =>
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Constants.height * 0.02,
              ),
              
        state?.profileImg != null  
              ? CircleAvatar( 
               backgroundColor: Colors.transparent,
               backgroundImage: NetworkImage("${state?.profileImg}"),
                radius: Constants.width * 0.1,)

              : CircleAvatar(
                  radius: Constants.width * 0.1,
                  backgroundImage: const AssetImage(
                     'assets/profile/profilePhoto.png', 
                    ),
              // child: state?.profileImg != null
              //     ? Image.network(
              //         state!.profileImg,
              //         fit: BoxFit.fill,
              //         errorBuilder: (context, error, stackTrace) =>
              //             Image.asset('assets/profile/profilePhoto.png',fit: BoxFit.fill,),
              //       )
              //     : Image.asset(
              //                 'assets/profile/profilePhoto.png',fit: BoxFit.fill,),
              ),
              SizedBox(
                height: Constants.height * 0.02,
              ),
              Text(
                state?.name ?? "Deepak2",
                style: TextStyle(
                    fontFamily: 'bold', fontSize: Constants.width * 0.06),
              ),
              SizedBox(
                height: Constants.height * 0.01,
              ),
              Text(
                state?.phone.toString() ?? "7895210xxx",
                style: TextStyle(
                    fontFamily: 'medium', fontSize: Constants.width * 0.04),
              ),
            ],
          ),
        ));
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
      onTap: () {
        onClickEvent!.call();
      },
      child: AbsorbPointer(
        child: Container(
          width: Constants.width,
          margin: EdgeInsets.only(bottom: Constants.height * 0.035),
          child: Row(
            children: [
              Image.asset(
                imageUrl ?? '',
                height: Constants.height * 0.025,
              ),
              SizedBox(
                width: Constants.width * 0.06,
              ),
              Text(
                title ?? '',
                style: TextStyle(
                    fontFamily: 'semiBold', fontSize: Constants.width * 0.05),
              ),
              Spacer(),
              Image.asset(
                'assets/profile/rightArrow.png',
                height: Constants.height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
