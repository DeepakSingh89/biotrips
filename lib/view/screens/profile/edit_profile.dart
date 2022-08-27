import 'dart:developer';

import 'package:biotrips/controller/profile_controller.dart';
import 'package:biotrips/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          elevation: 0,
          backgroundColor: Constants.themeColor,
          centerTitle: true,
          title: Text(
            'Edit Profile',
            style: TextStyle(
                fontFamily: 'bold',
                fontSize: Constants.width * 0.04,
                color: Colors.black),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Constants.width * 0.04,
              vertical: Constants.height * 0.03),
          child: Form(
            key: controller.profileFormkey,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: Constants.height * 0.02,
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          // backgroundImage:
                          //     AssetImage('assets/profile/profilePhoto.png'),
                          radius: Constants.width * 0.17,
                          child: ClipOval(
                            child: Obx(
                              () => controller.image.value.path == ""
                                  ? Image.network(
                                      controller.imageUrl.value ?? "",
                                      errorBuilder: (context, _, __) => 
                                          Image.asset(
                                            'assets/profile/profilePhoto.png',
                                            fit: BoxFit.fill,
                                          )
                                          )
                                  : Image.file(
                                      controller.image.value,
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: Constants.height * 0.13,
                          left: Constants.width * 0.27,
                          child: Material(
                            elevation: 4,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Constants.width * 0.01,
                                  vertical: 5),
                              color: Colors.white,
                              child: GestureDetector(
                                onTap: () => controller.pickImage(),
                                child: Image.asset(
                                  'assets/icons/edit.png',
                                  scale: 1.1,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Constants.height * 0.07,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 2, horizontal: Constants.width * 0.05),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: TextFormField(
                        controller: controller.fName,
                        validator: (val) {
                          if (val == "") {
                            return "Enter Name";
                          }
                        },
                        // maxLength: 10,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                          // prefixStyle: TextStyle(fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Constants.height * 0.04,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/authentication/indianFlag.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Expanded(
                            child: TextField(
                              // controller: controller.mobile,
                              keyboardType: TextInputType.phone,
                              enabled: false,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "99xxxxxxxx",
                                prefixText: '+91  ',
                                // prefixStyle: TextStyle(fontWeight: FontWeight.bold)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Constants.height * 0.04,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 2, horizontal: Constants.width * 0.05),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: TextFormField(
                        controller: controller.email,
                        validator: (val) {
                          if (val == "") {
                            return "Enter email";
                          }
                        },
                        // maxLength: 10,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          // prefixStyle: TextStyle(fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Constants.height * 0.2,
                    ),
                    InkWell(
                      onTap: () {
                        controller.callEditProfile();
                        log("clk");
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
                            'Save Changes',
                            style: TextStyle(
                                fontFamily: 'bold',
                                fontSize: Constants.width * 0.045),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
