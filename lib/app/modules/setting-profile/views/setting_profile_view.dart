import 'package:flutter/material.dart';
import 'package:rsaverin/app/data/componen/fetch_data.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rsaverin/app/data/componen/data_regist_model.dart';
import 'package:rsaverin/app/data/componen/images.dart';
import 'package:rsaverin/app/data/componen/local_storage.dart';
import 'package:rsaverin/app/data/componen/publics.dart';

import '../../../data/componen/my_font_size.dart';
import '../../../routes/app_pages.dart';
import '../controllers/setting_profile_controller.dart';

class SettingProfileView extends StatefulWidget {
  const SettingProfileView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SettingProfileViewState createState() => _SettingProfileViewState();
}

class _SettingProfileViewState extends State<SettingProfileView> {
  // this enable our app to able to pull down
  bool _obscured = true;
  final textFieldFocusNode = FocusNode();
  final controller = Get.put(SettingProfileController());

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return; // If focus is on text field, dont unfocus
      }
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Color(0xfff6f9fe)
          : Color(0xff2C3333),
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Color(0xff2C3333),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          iconSize: 40,
          color: Colors.blue,
          icon: const Icon(Icons.arrow_circle_left_rounded),
        ),
        title: Text(
          "Pengaturan",
          style: GoogleFonts.nunito(
              fontSize: MyFontSize.large1, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 5, top: 10, right: 5),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white
                    : Color(0xff404258),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      width: 80,
                      child: Text(
                        "Profile",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            controller.dataRegist.value.fotoPasien != 'null'
                                ? controller.dataRegist.value.fotoPasien!
                                : controller.dataRegist.value.jenisKelamin ==
                                        'L'
                                    ? Avatar.lakiLaki
                                    : Avatar.perempuan,
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Nama',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  ' : ',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  controller.dataRegist.value.namaPasien ?? '',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'NIK',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 36,
                                ),
                                Text(
                                  ' : ',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  controller.dataRegist.value.noKtp ?? '',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Email',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Text(
                                  ' : ',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  controller.dataRegist.value.email ?? '',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white
                    : Color(0xff404258),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
                        child: const Text(
                          'Ubah Profile',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) => UbahPassword(context),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ubah kata Sandi',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) => InfoAplikasi(),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Info Aplikasi',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => showModalBottomSheet(
                context: context,
                showDragHandle: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) => buildSheet(),
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 4,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: const Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Keluar',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget InfoAplikasi() {
    return SizedBox(
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Info Aplikasi',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.transparent,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Aplikasi Versi 11'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                          child: Column(
                        children: [
                          Text('Aplikasi masih pada tahap mengembangan'),
                          Text('mohon maaf atas ketidak nyamanan '),
                          Text('saat menggunakan aplikasi Pluit Care '),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget UbahPassword(context) {
    final controller = Get.put(SettingProfileController());
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
        padding: mediaQueryData.viewInsets,
        child: Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                    child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Password Lama",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: const Color(0x6cc7d1db)),
                              ),
                              child: TextFormField(
                                obscureText: _obscured,
                                controller: controller.pwlamaController,
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                    child: GestureDetector(
                                      onTap: _toggleObscured,
                                      child: Icon(
                                        _obscured
                                            ? Icons.visibility_off_rounded
                                            : Icons.visibility_rounded,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 13, right: 15),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Password Baru",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: const Color(0x6cc7d1db)),
                              ),
                              child: TextFormField(
                                obscureText: _obscured,
                                controller: controller.pwbaruController,
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                    child: GestureDetector(
                                      onTap: _toggleObscured,
                                      child: Icon(
                                        _obscured
                                            ? Icons.visibility_off_rounded
                                            : Icons.visibility_rounded,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 13, right: 15),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Comfirm Password Baru",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: const Color(0x6cc7d1db)),
                              ),
                              child: TextFormField(
                                obscureText: _obscured,
                                controller: controller.confirmpwbaruController,
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                    child: GestureDetector(
                                      onTap: _toggleObscured,
                                      child: Icon(
                                        _obscured
                                            ? Icons.visibility_off_rounded
                                            : Icons.visibility_rounded,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 13, right: 15),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10, left: 10, top: 20),
                      child: GestureDetector(
                        onTap: () async {
                          if (controller.pwbaruController.text.isNotEmpty &&
                              controller
                                  .confirmpwbaruController.text.isNotEmpty) {
                            Get.defaultDialog(
                              backgroundColor: Colors.white,
                              content: CircularProgressIndicator(),
                              title: 'Loading',
                              barrierDismissible: true,
                            );
                            final postUbahPassword = await API.postUbahPassword(
                              email: Publics.controller.getDataRegist.value
                                      .password ??
                                  '',
                              pw_baru: controller.pwbaruController.text,
                              pw_lama: controller.pwlamaController.text,
                            );
                            if (postUbahPassword.code == 200) {
                            } else {
                              Get.defaultDialog(
                                title: (postUbahPassword.code ?? 0).toString(),
                                content: Text(postUbahPassword.msg ?? ''),
                              );
                            }
                          } else {
                            Get.snackbar('500',
                                'Password dan Confirm Password harus sama');
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.blue,
                          ),
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Text("Ubah Password",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  Widget buildSheet() {
    return Container(
      height: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
      ),
      child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            const Text("Apakah anda ingin Logout ?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/images/logout_apps.png",
              gaplessPlayback: true,
              fit: BoxFit.fitHeight,
              height: 170,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 70, left: 10, top: 20),
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.blue,
                      ),
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "Kembali",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.redAccent,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        final getRegist = Publics.controller.getDataRegist;
                        await LocalStorages.boxDataRegist.erase();
                        await LocalStorages.boxToken.erase();
                        await LocalStorages.setDataRegist(
                          DataRegist(
                            email: getRegist.value.email,
                            password: getRegist.value.password,
                            ingatSaya: getRegist.value.ingatSaya,
                          ),
                        );
                        Publics.controller.getDataRegist.value =
                            LocalStorages.getDataRegist;
                        Publics.controller.getToken.value =
                            LocalStorages.getToken;
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ])),
    );
  }

  TextButton submenu(String title, void Function()? routes) {
    return TextButton(
      onPressed: routes,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff4babe7),
            ),
          ],
        ),
      ),
    );
  }
}
