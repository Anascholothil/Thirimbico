import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart'as http;

import '../constance/callfunction.dart';
import '../mdlclss.dart';
import '../mdlclss.dart';
import '../mdlclss.dart';
import '../mdlclss.dart';
import '../mdlclss.dart';
import '../mdlclss.dart';

class MainProvider extends ChangeNotifier {
  int count = 0;
  int currentindex = 0;
  int value = 0;

  FirebaseFirestore db = FirebaseFirestore.instance;
  Reference ref = FirebaseStorage.instance.ref("IMAGEURL");

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController adrss1stnameController =TextEditingController();
  TextEditingController adrss2ndnameController =TextEditingController();
  TextEditingController adressController =TextEditingController();
  TextEditingController cityController =TextEditingController();
  TextEditingController adresszipController =TextEditingController();


  void incrementCounter() {
    value++;
    notifyListeners();
  }

  void decrementCounter() {
    value--;
    notifyListeners();
  }

  void currentindx(int index) {
    currentindex = index;
    notifyListeners();
  }

  TimeOfDay _time = TimeOfDay.now();
  DateTime _date = DateTime.now();
  DateTime scheduledTime = DateTime.now();
  DateTime scheduledDate = DateTime.now();
  String scheduledDayNode = "";

  var outputTimeFormat = DateFormat('hh:mm a');

  TextEditingController timeController = TextEditingController();
  DateTime focusDate = DateTime.now();
  DateTime? selectDate = DateTime.now();

  Future<void> selectTime(
      BuildContext context, DateTime selectedDate, date) async {
    selectDate = date;
    notifyListeners();

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if (picked != null) {
      // Combine selected date with picked time
      DateTime scheduledDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        picked.hour,
        picked.minute,
      );
      timeController.text = outputTimeFormat.format(scheduledDateTime);
      notifyListeners();
    }
  }
  void timeclear(){
    timeController.clear();
  }

  // Future<void> selectTime(BuildContext context) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: _time,
  //   );
  //
  //   if (picked != null) {
  //     _time = picked;
  //     scheduledDayNode =
  //         _date.year.toString() + '/' + _date.month.toString() + '/' +
  //             _date.day.toString();
  //     scheduledTime = DateTime(
  //         _date.year, _date.month, _date.day, _time.hour, _time.minute);
  //     timeController.text = outputTimeFormat.format(scheduledTime);
  //   }
  // }

  List<String> carouselimg = [
    'assets/confirm.png',
    'assets/slider1.png',
    'assets/carosilnaked.png',
    'assets/carsoilultimate.png',
    'assets/carosilconquor.png',
    // 'assets/slider4.png',
    // 'assets/carosilfav.png',
    // 'assets/slider4.png',
    'assets/slider4.png',
    // 'assets/carosilfavi.png',
    'assets/slider4.png',
  ];
  List<String> images = [
    "assets/shirtN.png",
    "assets/t-shirtN.png",
    "assets/pantsN.png",
    "assets/shortsN.png",
    "assets/forkN.png",
    "assets/jacketN.png"
  ];
  List<Color> colors = [
    Color(0xffffd9d9),
    Color(0xfffffbd9),
    Color(0xffdeffdb),
    Color(0xffdffdff),
    Color(0xfffedcf1),
    Color(0xffdad9ff),
    Color(0xffdeffdb),
  ];
  List<String> text = [
    'Shirt',
    'T-shirt',
    'Pants/jeans',
    'Shorts',
    'Dress',
    'Jackets',
  ];

  List<String> price = [
    '₹12',
    '₹10',
    '₹12',
    '₹6',
    '₹20',
    '₹21',
  ];

  void Increment(int index) {
    if (clothtypeList[index].count >= 0) {
      clothtypeList[index].count++;
      notifyListeners();
    }

    print(clothtypeList[index].count.toString() + "kkkkk");
    notifyListeners();
  }

  void Decrement(int index) {
    if (clothtypeList[index].count > 0) {
      clothtypeList[index].count--;
      notifyListeners();
    }
    print(clothtypeList[index].count.toString() + "hhhhh");
  }

  double getTotalPrice() {
    double value = 0.0;
    for (var initloop in clothtypeList) {
      if (initloop.count > 0) {
        value =
            value + (initloop.count * double.parse(initloop.Price.toString()));
        notifyListeners();
      }
    }
    return value;
  }

   File? profilefileImage=null;
  String fileimg="";
  void profclear(){
    adresszipController.clear();
    cityController.clear();
    adressController.clear();
    adrss1stnameController.clear();
    adrss2ndnameController.clear();
    nameController.clear();
    phoneController.clear();
    fileimg = "";
    profilefileImage = null ;
  }

  Future<void> adddata() async {
    print("ytdytsre");
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();
    map["USER_NAME"] = nameController.text;
    map["USER_ID"] = id;
    map["PHONE_NUMBER"] = phoneController.text;
    map["STATUS"] = "REQUEST";

    if (profilefileImage != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(profilefileImage!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['PHOTO'] = fileimg;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    db.collection("CUSTOMERS").doc(id).set(map);
    notifyListeners();
  }
  void setImageprofile(File image) {
    profilefileImage = image;
    notifyListeners();
  }

  Future profileImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // print("hjkl"+pickedImage.path);
      profilecropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future profileImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      profilecropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }
  Future<void> profilecropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      profilefileImage = File(croppedFile.path);
      notifyListeners();
    }
  }
  List<UserDetails> UserDetailsList = [];

  void getrequesteduser() {
    db.collection("CUSTOMERS").where("STATUS",isEqualTo: "REQUEST").get().then((value) {
      if (value.docs.isNotEmpty) {
        UserDetailsList.clear();
        for (var element in value.docs) {
          UserDetailsList.add(
            UserDetails(
              element.id,
              element.get("PHOTO").toString(),
              element.get("USER_NAME").toString(),
              element.get("PHONE_NUMBER").toString(),
            ),
          );
          notifyListeners();

        }
      }
      notifyListeners();
    });


  }
  void getUserInfo(){
    db.collection("CUSTOMERS").where("STATUS",isEqualTo: "APPROVED").get().then((value) {
      if (value.docs.isNotEmpty) {
        UserDetailsList.clear();
        for (var element in value.docs) {
          UserDetailsList.add(
            UserDetails(
              element.id,
              element.get("PHOTO").toString(),
              element.get("USER_NAME").toString(),
              element.get("PHONE_NUMBER").toString(),
            ),
          );
          notifyListeners();

        }
      }
      notifyListeners();
    });
  }


  void statusApprv(String id, String name,String phone,BuildContext ctxt) {
    Map<String, dynamic> dataMap = HashMap();
    Map<String, dynamic>  userMap = HashMap();
    dataMap["STATUS"] = "APPROVED";
    db.collection("CUSTOMERS").doc(id).set(dataMap, SetOptions(merge: true));

    userMap["USER_NAME"] = nameController.text;
    userMap["PHONE_NUMBER"] = "+91${phoneController.text}";
    userMap["TYPE"] = "USER";
    userMap["USER_ID"] = id;
    db.collection("USERS").doc(id).set(userMap);

    ScaffoldMessenger.of(ctxt).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          "Approved successfully ",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xffedb1f7)),
        )));

    getrequesteduser();
    notifyListeners();
    finish(ctxt);
  }

  void statusReject(String id, BuildContext contxt) {
    Map<String, dynamic> dataMap = HashMap();
    dataMap["STATUS"] = "REJECT";
    db.collection("CUSTOMERS").doc(id).set(dataMap, SetOptions(merge: true));
    finish(contxt);
    ScaffoldMessenger.of(contxt).showSnackBar(
      SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            "Rejected successfully ",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.red),
          )),
    );
    getrequesteduser();
    notifyListeners();
  }





  File? serviceimgfile;
  String imgurl = "";

  TextEditingController servicecntroller = TextEditingController();
  TextEditingController serviceAmontcntroller = TextEditingController();

  Future<void> addservice() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> servicemap = HashMap();
    servicemap["Services"] = servicecntroller.text;
    servicemap["Services_Id"] = id;
    servicemap["Date"] = DateTime.now();
    servicemap["Price"] = num.parse(serviceAmontcntroller.text);

    if (serviceimgfile != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(serviceimgfile!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          servicemap["PHOTO"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      servicemap['PHOTO'] = imgurl;
      // editMap['IMAGE_URL'] = imageUrl;
    }

    db.collection("LSERVICES").doc(id).set(servicemap);
    getServices();
    notifyListeners();
  }

  void setImage(File image) {
    serviceimgfile = image;
    notifyListeners();
  }

  Future getImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // print("hjkl"+pickedImage.path);
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  List<Services> ServiceList = [];
// get
  void getServices() {
    db.collection("LSERVICES").get().then((value) {
      if (value.docs.isNotEmpty) {
        ServiceList.clear();
        for (var element in value.docs) {
          ServiceList.add(
            Services(
              element.id,
              element.get("PHOTO").toString(),
              element.get("Services").toString(),
              element.get("Price").toString(),
            ),
          );
          notifyListeners();

          print(ServiceList.length.toString());
        }
      }
      notifyListeners();
    });
  }

  Future<void> cropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      serviceimgfile = File(croppedFile.path);
      print(serviceimgfile.toString() + "fofiifi");
      notifyListeners();
    }
  }

  void clearservices() {
    serviceimgfile = null;
    servicecntroller.clear();
  }

  File? clothtypeimgfile;
  String clothimgurl = "";

  TextEditingController clothnamecntroller = TextEditingController();
  TextEditingController clothpricecntroller = TextEditingController();
  List<Clothtype> clothtypeList = [];

  Future<void> addclothtype() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> servicemap = HashMap();
    servicemap["Clothname"] = clothnamecntroller.text;
    servicemap["Clothprice"] = clothpricecntroller.text;
    servicemap["Clothtype_Id"] = id;

    if (clothtypeimgfile != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(clothtypeimgfile!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          servicemap["PHOTO"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      servicemap['PHOTO'] = clothimgurl;
      // editMap['IMAGE_URL'] = imageUrl;
    }

    db.collection("CLOTHTYPE").doc(id).set(servicemap);

    print(servicemap);
    getClothType();

    notifyListeners();
  }

  void clothsetImage(File image) {
    clothtypeimgfile = image;
    notifyListeners();
  }

  Future clothgetImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      ClothCropImage(pickedImage.path, "");
      print("hjkl" + pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future clothgetImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> ClothCropImage(String path, String from) async {
    final clothCroppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (clothCroppedFile != null) {
      clothtypeimgfile = File(clothCroppedFile.path);
      print(serviceimgfile.toString() + "fofiifi");
      notifyListeners();
    }
  }

  void getClothType() {
    db.collection("CLOTHTYPE").get().then((value) {
      print(value.docs.length.toString() + "jhsghdgs");
      if (value.docs.isNotEmpty) {
        clothtypeList.clear();
        for (var element in value.docs) {
          clothtypeList.add(Clothtype(
              element.id,
              element.get("PHOTO").toString(),
              element.get("Clothname").toString(),
              element.get("Clothprice").toString(),
              0));
          notifyListeners();

          print(clothtypeList.length.toString());
        }
      }
      notifyListeners();
    });
  }

  void clearclothtype() {
    clothnamecntroller.clear();
    clothpricecntroller.clear();
    clothtypeimgfile = null;
  }



  // void getFcm(){
  //   print("sh");
  //   FirebaseMessaging.instance.getToken().then((fcmValue) {
  //
  //     fcmid=fcmValue.toString();
  //
  //     print("yteuweyeywety"+fcmid.toString());
  //   });
  //   notifyListeners();
  // }


  void razorpayGateway(String name,num amount,String desc){


    Razorpay razorpay = Razorpay();
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': amount*100,
      'name': name,
      'description': desc,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': '7736310880',
        // 'email': 'test@razorpay.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };
    razorpay.on(
        Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
        handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
        handleExternalWalletSelected);
    razorpay.open(options);

  }
  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */

  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    log(response.data.toString()+"suceeassss");


  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {

  }
  // String fcmid='';
  //
  // void getFcm(){
  //   FirebaseMessaging.instance.getToken().then((fcmValue) {
  //
  //     fcmid=fcmValue.toString();
  //     print("yteuweyeywety"+fcmid.toString());
  //   });
  //   notifyListeners();
  //   }


  Future<bool> callOnFcmApiSendPushNotifications(
      {required String title,
        required String body,
        required String fcmId,
        required String imageLink}) async {
    print(fcmId + "kmfmkfmkmk");

    Uri postUrl = Uri.parse('https://fcm.googleapis.com/fcm/send');
    final data = {
      "to":
       'dn4X3bl3R7acrewSPA7_3l:APA91bFNexg-As8vgJsI8PyUzN0vGOtEDcMqOw3BHH8gedB-a6ERXZbeKyMJ0SsSulvLd444Mp1l63I3iY6JfzZXjPdAw-T_OogpTrdv1iD-tjSAx209Y__FcQ4lvGVPlXTtrUOFDiTO',
      "notification": {
        "title": title,
        "body": body,
      },
      "data": {
        "type": '0rder',
        "id": '28',
        "click_action": 'FLUTTER_NOTIFICATION_CLICK',
      }
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization':
      'key=AAAAR9w5UhE:APA91bHG3H_fyRzBTZ5G23Oho4hvJ4ezSq7j4y_j1lufNlhJ8oX0-kcbYcWOjznF8dZhs6vKFDpiykdmrTZJ_aDHPXpAZg04sTOJxrYIIZjtrF-Kvj0bl5ht8z1nwNBfu7Gqv0IsPVvU',
      // 'key=YOUR_SERVER_KEY'cx
      'project_id': '308637422097'
    };

    final response = await http.post(postUrl,
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);
    print("${response.body}aaaaaaa");

    if (response.statusCode == 200) {
      // on success do sth
      print('test ok push CFM');
      return true;
    } else {
      print(' CFM error');
      // on failure do sth
      return false;
    }
  }
  String fcmid = '';

  getAdminFcmId() {
    print("ooaoaoaooa" + fcmid);
    print("kjkndvdknefvlknefv");
    db.collection("USERS").where("TYPE", isEqualTo: "ADMIN").get().then((event) {
      if (event.docs.isNotEmpty) {
        print("jsjsjs");
        // fcmid='';
        for (var element in event.docs) {
          Map<dynamic, dynamic> notificationMap = element.data();
          fcmid = notificationMap["FCM_ID"] ?? "";
          notifyListeners();
        }
        print("smncbwndbc");
      }
    });
  }
}
