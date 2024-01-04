import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work_task/controller/images/imagesUrl.dart';
import 'package:work_task/controller/widget/text_widget.dart';
import 'package:work_task/controller/widget/texteditingwidget.dart';
import 'package:work_task/model/user_model.dart';

class EditeProfileScreen extends ConsumerStatefulWidget {
  const EditeProfileScreen(
      {super.key,
      required this.name,
      required this.gmail,
      required this.phoneNo,
      required this.dateofbarth,
      required this.gender});
  final String name;
  final String gmail;
  final String phoneNo;
  final String dateofbarth;
  final String gender;

  @override
  ConsumerState<EditeProfileScreen> createState() => _EditeProfileScreenState();
}

class _EditeProfileScreenState extends ConsumerState<EditeProfileScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user;
  // ignore: unused_field
  File? _image;
  // User Model
  UserModel? userModel;
  // textFeld .
  TextEditingController fullNametextEditingController = TextEditingController();
  TextEditingController gmailtextEditingController = TextEditingController();
  TextEditingController phoneNumbertextEditingController =
      TextEditingController();
  TextEditingController dateofbarthtextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    fullNametextEditingController.text = widget.name.toString();
    gmailtextEditingController.text = widget.gmail.toString();
    phoneNumbertextEditingController.text = widget.phoneNo.toString();
    dateofbarthtextEditingController.text = widget.dateofbarth.toString();
    // selectedRadio = widget.gender.toString();
    // updateMethod();
  }

  Future<void> updateMethod() async {
    var updateUserInfo = UserModel(
      id: user!.uid,
      dateOfBirth: dateofbarthtextEditingController.text,
      email: gmailtextEditingController.text,
      firstName: "",
      lastName: fullNametextEditingController.text,
      gender: selectedRadio.toString(),
      phoneNo: phoneNumbertextEditingController.text,
      userImages: "",
    );
    await firebaseFirestore
        .collection("users")
        .doc(user!.uid)
        .update(updateUserInfo.toMap());
  }

  String? selectedRadio;

  setSelectedRadio(String val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Edite Profile',
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
          ),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              // ! Images Section
              Positioned(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: _image != null
                          ? DecorationImage(
                              image: FileImage(_image!), fit: BoxFit.cover)
                          : DecorationImage(
                              image: NetworkImage(
                                byDefaultImages,
                              ),
                              fit: BoxFit.fill)),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  margin: const EdgeInsets.only(left: 78),
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: Colors.orange, shape: BoxShape.circle),
                  child: InkWell(
                      onTap: () => imagePickerTypeBottomSheet(),
                      child: const Icon(Icons.camera_alt)),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(name: 'Full Name'),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldWidget(
                  textEditingController: fullNametextEditingController,
                  hintText: 'Muhammad Sajjad',
                  valiDator: (value) {
                    return null;
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(name: 'Email'),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldWidget(
                  textEditingController: gmailtextEditingController,
                  hintText: 'abc@gmail.com',
                  valiDator: (value) {
                    return null;
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(name: 'Phone Number'),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldWidget(
                  textEditingController: phoneNumbertextEditingController,
                  hintText: '03116227886',
                  valiDator: (value) {
                    return null;
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(name: 'Date of birth'),
                const SizedBox(
                  height: 10,
                ),
                TextFormFieldWidget(
                  textEditingController: dateofbarthtextEditingController,
                  hintText: '03 jan 2024',
                  valiDator: (value) {
                    return null;
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(name: 'Birth Gender'),
                RadioListTile(
                  activeColor: Colors.red.shade700,
                  value: 'Male',
                  groupValue: selectedRadio,
                  title: Text(
                    'Male',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: selectedRadio == 'Male'
                            ? Colors.red.shade700
                            : Colors.black),
                  ),
                  onChanged: (value) {
                    setSelectedRadio(value.toString());
                  },
                ),
                RadioListTile(
                  activeColor: Colors.red.shade700,
                  value: 'Female',
                  groupValue: selectedRadio,
                  title: Text(
                    'Female',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: selectedRadio == 'Female'
                            ? Colors.red.shade700
                            : Colors.black),
                  ),
                  onChanged: (value) {
                    setSelectedRadio(value.toString());
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red.shade700),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () async {
                  await updateMethod();
                },
                child: const Text(
                  'Update',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }

  void getimage({required ImageSource source}) async {
    final image = await ImagePicker().pickImage(source: source);
    setState(() {
      _image = File(image!.path);
    });
  }

  imagePickerTypeBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const SizedBox(width: 20),
                const Text(
                  'Profile photo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
                const SizedBox(width: 15),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imagePickerIcon(
                    onTap: () {
                      getimage(source: ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                    icon: Icons.photo_camera_back_rounded,
                    text: 'Gallary'),
                const SizedBox(width: 30),
                imagePickerIcon(
                    onTap: () {
                      getimage(source: ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                    icon: Icons.camera_alt_rounded,
                    text: 'Camera'),
              ],
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }

  imagePickerIcon({
    required VoidCallback onTap,
    required IconData icon,
    required String text,
  }) {
    return Column(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(icon),
          color: Colors.red.shade700,
          iconSize: 70,
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            color: Colors.red.shade700,
          ),
        ),
      ],
    );
  }
}
