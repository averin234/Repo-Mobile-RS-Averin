import 'package:flutter/material.dart';
import 'package:rsaverin/app/modules/info_pluitcare/controllers/info_pluitcare_controller.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InforsaverinView extends GetView<InforsaverinController> {
  const InforsaverinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info RS Averin'),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
        child: Text(
          'InforsaverinView is working',
          style: GoogleFonts.nunito(fontSize: 20),
        ),
      ),
    );
  }
}
