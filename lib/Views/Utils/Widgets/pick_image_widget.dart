import 'dart:html';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_admin_web/Controllers/Cubits/product_image_cubit.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/InventoryViews/BrandsViews/AddNewBrand/brands_static.dart';
import 'package:food_delivery_admin_web/Views/Utils/Widgets/my_loading_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';
import 'dart:async';

class PickImageCard extends StatefulWidget {
  final bool? isProduct;
  final String myDestination;
  const PickImageCard({Key? key, required this.myDestination, this.isProduct = false,}) : super(key: key);

  @override
  State<PickImageCard> createState() => _PickImageCardState();
}

class _PickImageCardState extends State<PickImageCard> {



  Future pickImageAndUpload()async{
    var input = FileUploadInputElement()..accept = 'image/';

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {

      if(input.files != null){
        final file = input.files!.first;
        setState(() {

        });


        showLoading = true;
        sourceImage = file;
        final reader = FileReader();
        reader.readAsDataUrl(file);
        reader.onLoadEnd.listen((event) async{


          var uploadFile =  firebaseStorage.ref().child('${widget.myDestination}/${DateTime.now().microsecondsSinceEpoch}');



       //   showPercentage = loading.bytesTransferred / loading.totalBytes * 100;

           var uploadTask = await uploadFile.putBlob(file);







          BrandStatic.imageUrl = await uploadTask.ref.getDownloadURL();

          context.read<ProductImageCubit>().getImage(imageUrl: BrandStatic.imageUrl);

          setState(() {
            showLoading = false;

          });



          print('=================? url');
          print(uploadedPhotoUrl);

        });

      }
    });
  }








  bool showLoading = false;
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
                    child: const Text('Choose Image....'),
                  )
                :
            //Image.memory(sourceImage)
            showLoading == true ? Center(child: MyLoadingIndicator(),): Text('Completed')

            ,
          ),
          Expanded(
            child: InkWell(
              onTap: () async {

                //getImageFromGallery();
                pickImageAndUpload();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
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

// Future getImageFromGallery() async {
//   final ImagePicker _picker = ImagePicker();
//   final XFile
//   ? image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 70,);
//
//   if (image == null) return;
//
//   //sourceImage = File(image.path);
//   sourceImage = image.readAsBytes();
//
//
//   Reference reference =
//   FirebaseStorage.instance.ref().child('${widget.myDestination}/${DateTime.now().microsecondsSinceEpoch}');
//
//   // var uploadImage = sourceImage;
//   // var uploadTask = await reference.putFile(sourceImage);
//
//
//   var uploadImage = await sourceImage;
//   var loading =  reference.putData(uploadImage).snapshot;
//
//
//   var uploadTask = await reference.putData(uploadImage);
//
//
//
//   setState(() {
//     showPercentage = loading.bytesTransferred / loading.bytesTransferred *100;
//
//   });
// //Upload the file to firebase
//   // var taskSnapshot = await uploadTask;
//
// // Waits till the file is uploaded then stores the download url
//   uploadedPhotoUrl = await uploadTask.ref.getDownloadURL();
//
//   // localFileStatus = true;
//
//   // localFile = sourceImage;
//
//   setState(() {});
//
//   // var url = await uploadFile();
//   // print(url);
//
//   //uploadedPhotoUrl = await uploadFileToStorage(image: sourceImage);
//
//
//
//
//   print('================');
//   print(uploadedPhotoUrl);
//   //CategoriesFormProperties.imageUrl = url;
//
//
// }
