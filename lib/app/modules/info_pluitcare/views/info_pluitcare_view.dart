import 'package:flutter/material.dart';
import 'package:gadingcare/app/modules/info_pluitcare/controllers/info_pluitcare_controller.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InfogadingcareView extends GetView<InfogadingcareController> {
  const InfogadingcareView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info GP Care'),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
        child: Text(
          'InfogadingcareView is working',
          style: GoogleFonts.nunito(fontSize: 20),
        ),
      ),
    );
  }
}
