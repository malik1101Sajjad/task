import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_task/controller/widget/age_gender_container.dart';
import 'package:work_task/model/family_member_model.dart';
import 'package:work_task/model/user_model.dart';
import 'package:work_task/navigator/navigation.dart';
import 'package:work_task/view/add_family_member_screen.dart';
import 'package:work_task/view/edite_profile_screen.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel? userModel = UserModel();
  FamilyModle familyModle = FamilyModle();
  // ! User Info Related Data .
  Future<void> getUserData() async {
    await firebaseFirestore
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data()!);
      print(value);
      setState(() {});
    });
  }

  // ! User Add Member Related Data .
  Future<void> getAddMemberData() async {
    await firebaseFirestore
        .collection("AddMember")
        .doc(user!.uid)
        .get()
        .then((value) {
      familyModle = FamilyModle.fromMap(value.data()!);
      print(value);
      setState(() {});
    });
  }

  // fetch this images
  Future<void> fetchThisImages() async {
    firebaseFirestore
        .collection("MemberImage")
        .doc(user!.uid)
        .get()
        .then((value) {
      familyModle = value.data()?["DownloadUrl"];
    });
    setState(() {});
  }

  @override
  void initState() {
    getUserData();

    fetchThisImages().then((value) {
      print("object");
    });

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await fetchThisImages();
    await getAddMemberData();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    String name = userModel!.firstName ?? "Doctor";
    String email = userModel!.email ?? "xyz@gmail.com";
    String phoneNo = userModel!.phoneNo ?? "03098620617";
    String dataofbarth = userModel!.dateOfBirth ?? "1 may 2024";
    String gender = userModel!.dateOfBirth ?? "Male";
    String relation = familyModle.realation ?? "relation";

    return Scaffold(
        backgroundColor: Colors.red.shade700,
        // appBar section
        appBar: profileAppBar(),
        // body Section
        body: Container(
          height: height,
          width: width,
          margin: EdgeInsets.only(top: height * 0.04),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white,
          ),
          child: ListView(children: [
            SizedBox(height: height * 0.06),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    margin: const EdgeInsets.only(left: 78),
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        color: Colors.orange, shape: BoxShape.circle),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(NavigationPage(
                            child: EditeProfileScreen(
                                name: name,
                                gmail: email,
                                phoneNo: phoneNo,
                                dateofbarth: dataofbarth,
                                gender: gender)));
                      },
                      child: const Icon(
                        Icons.camera_alt,
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Column(
              children: [
                Text(
                  name.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  email.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AgeGender(title: "23y 4m", subTitle: "Age"),
                    SizedBox(
                      width: width * 0.08,
                    ),
                    const AgeGender(title: "Male", subTitle: "Male"),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddFamilyMemberScreen(),
                        ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: const Text('+'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text(relation.toString())],
                  ),
                )
              ],
            )
          ]),
        ));
  }

// * AppBar Working
  AppBar profileAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: const Text(
        "Profile",
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: const Icon(Icons.menu, color: Colors.white),
      actions: const [
        Icon(
          Icons.settings,
          color: Colors.white,
        )
      ],
    );
  }
}
