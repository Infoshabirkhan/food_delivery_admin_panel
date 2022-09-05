import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';
import 'dart:async';
import 'package:universal_html/html.dart' as html;

import 'package:firebase/firebase.dart' as fb;
class PickImageCard extends StatefulWidget {
  final String myDestination;
  const PickImageCard({Key? key, required this.myDestination,}) : super(key: key);

  @override
  State<PickImageCard> createState() => _PickImageCardState();
}

class _PickImageCardState extends State<PickImageCard> {


  Future getImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile
    ? image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 70,);

    if (image == null) return;

    sourceImage = File(image.path);

   // localFileStatus = true;

   // localFile = sourceImage;

    setState(() {});

    // var url = await uploadFile();
    // print(url);


   uploadedPhotoUrl = await uploadImageFile(sourceImage, imageName: sourceImage);

   print('================');
   print(uploadedPhotoUrl);
    //CategoriesFormProperties.imageUrl = url;
  }


  Future<Uri> uploadImageFile(html.File image,
      {required String imageName}) async {
    fb.StorageReference storageRef = fb.storage().ref('images/$imageName');
    fb.UploadTaskSnapshot uploadTaskSnapshot = await storageRef.put(image).future;

    Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
    return imageUri;
  }
  Future <String?>uploadFile() async {
    // ProgressDialog progressDialog = ProgressDialog((context),
    //     title: const Text('Uploading image..'),
    //     message: const Text('Please wait....'));

    if (sourceImage == null) return null;
   // progressDialog.show();
    // final fileName = imagePath!.path;
    // final destination = 'files/$fileName';

    final destination = widget.myDestination;
    try {

      // Reference _reference = FirebaseStorage.instance
      //     .ref()
      //     .child('images/${widget.myDestination}/${DateTime.now().microsecondsSinceEpoch}');
      // await _reference
      //     .putData(
      //   await sourceImage!.readAsBytes(),
      //   SettableMetadata(contentType: 'image/jpeg'),
      // )
      //     .whenComplete(() async {
      //   await _reference.getDownloadURL().then((value) {
      //     uploadedPhotoUrl = value;
      //   });
      // });
      final ref =
      FirebaseStorage.instance.ref(destination).child('IMG-${DateTime.now()}');
      await ref.putFile(sourceImage!.absolute);


     var url = await ref.getDownloadURL();

      // FirebaseFirestore.instance
      //     .collection('Users')
      //     .doc(UserModel.model!.userId)
      //     .update({'profile_image': url}).then((value) =>
      //     Fluttertoast.showToast(msg: 'Profile picture updated'));

      if (kDebugMode) {
        print(url);
      }

    //  progressDialog.dismiss();
      return url;

    } catch (e) {
  //    progressDialog.dismiss();
      if (kDebugMode) {
        print(e.toString());
        //Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  Uint8List webImage = Uint8List(8);


  var uploadedPhotoUrl;
  var sourceImage;

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8.sp),
      ),
      height: 60.h,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: sourceImage == null
                ? Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: const Text('Upload image...'),
                  )
                :
            //Image.memory(sourceImage)
            Text(sourceImage.toString())

            ,
          ),
          Expanded(
            child: InkWell(
              onTap: () async {
                // var picker = ImagePicker();
                //
                // XFile? image = await picker.pickImage(
                //   source: ImageSource.gallery,
                //   imageQuality: 85,
                // );
                //
                // if (image != null) {
                //   var f = await image.readAsBytes();
                //
                //   webImage = f;
                //
                //   setState(() {});
                //   sourceImage = webImage;
                // } else {
                //   debugPrint('no image selected');
                // }
                getImageFromGallery();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.sp),
                    bottomRight: Radius.circular(10.sp),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Browse',
                    style: GoogleFonts.roboto(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
