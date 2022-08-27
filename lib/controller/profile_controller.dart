import 'dart:developer';
import 'dart:io';

import 'package:biotrips/endpoint/provider/profile_repo.dart';
import 'package:biotrips/endpoint/server/api_client.dart';
import 'package:biotrips/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController with StateMixin<ProfileModel> {
  GlobalKey<FormState> profileFormkey = GlobalKey<FormState>();
  TextEditingController fName = TextEditingController();
  TextEditingController email = TextEditingController();
  // TextEditingController mobile = TextEditingController();
  final loading = false.obs;
  Rx<File> image = File("").obs;
  Rx<String?> imageUrl = (null as String?).obs;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  pickImage() async {
    ImagePicker picker = ImagePicker();
    var temp = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (temp != null) {
      log("temp ${temp.path}");
      await _imgFromGallery();
      //  _cropImage(temp.path);
    }
  }

  // _cropImage(filePath) async {
  //   log("temppath $filePath");
  //   ImageCropper imageCropper = ImageCropper();
  //   CroppedFile? croppedImage = await imageCropper.cropImage(
  //       sourcePath: filePath,
  //       maxWidth: 1080,
  //       maxHeight: 1080,
  //       aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0));
  //   log("imageCropper $filePath");
  //   if (croppedImage != null) {
  //     image.value = croppedImage as File;
  //     log("image.value ${image.value}");
  //     callUploadImageApi();
  //   }
  // }

  // void showPicker(context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return SafeArea(
  //           child: Container(
  //             child: Wrap(
  //               children: <Widget>[
  //                 ListTile(
  //                     leading: const Icon(Icons.photo_library),
  //                     title: Text('Library'),
  //                     onTap: () {
  //                       _imgFromGallery();
  //                       Navigator.of(context).pop();
  //                     }),
  //                 ListTile(
  //                   leading: const Icon(Icons.photo_camera),
  //                   title: Text('Camera'),
  //                   onTap: () {
  //                     _imgFromCamera();
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }
  // _imgFromCamera() async {
  //   ImagePicker _picker = ImagePicker();
  //   XFile? tempImage = await _picker.pickImage(
  //       source: ImageSource.camera,
  //       //  imageQuality: 50,
  //       preferredCameraDevice: CameraDevice.front);
  //   if (tempImage != null) {
  //     image.value = File(tempImage.path);
  //   }
  // }

  _imgFromGallery() async {
    ImagePicker _picker = ImagePicker();
    XFile? tempImage =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (tempImage != null) {
      image.value = File(tempImage.path);
      callUploadImageApi();
    }
  }

  callEditProfile() async {
    if (profileFormkey.currentState!.validate() && imageUrl != "") {
      Client client = Client();
      ProfileRepository repository = ProfileRepository(client: client.init());
      try {
        await repository.editProfileApi(
            fName.text, imageUrl.value.toString(), email.text);
        log("editP ${imageUrl.value}");
      } on Exception catch (e) {
        log("exception $e");
      }
    }
  }

  callUploadImageApi() async {
    log("callUploadImageApi ${image.value}");
    if (image.value.path != "") {
      Client client = Client();
      ProfileRepository userEndPointProvider =
          ProfileRepository(client: client.init());
      try {
        imageUrl.value =
            await userEndPointProvider.uploadImage(image.value.path);
        log("upload ${imageUrl.value}");
      } on Exception catch (e) {
        log("exc $e");
      }
    }
  }

  getProfile() {
    Client client = Client();
    ProfileRepository repository = ProfileRepository(client: client.init());
    try {
      repository.getProfileApi().then((value) {
        change(value, status: RxStatus.success());
      }, onError: (err) {
        log("onErrror $err");
        // change(null, status: RxStatus.error(err.toString()));
      });
    } on Exception catch (e) {
      log("excpt $e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
