import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/componen/fetch_data.dart';
import '../../home/views/widgets/widget_cardantri.dart';
import '../../home/views/widgets/widget_no_antri.dart';
import '../controllers/register_telemedic_controller.dart';

class RegisterTelemedicView extends GetView<RegisterTelemedicController> {
  const RegisterTelemedicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi Telemedical'),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
        child: FutureBuilder(
          future: API.getJadwalPx(
            noKtp: controller.dataRegist.value.noKtp ?? '',
            tgl: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState != ConnectionState.waiting &&
                snapshot.data != null) {
              if (snapshot.data!.code == 200) {
                final data = snapshot.data!.list!.first;
                return FutureBuilder(
                    future: API.getDataPx(
                        noKtp: controller.dataRegist.value.noKtp ?? ''),
                    builder: (context, snapshot1) {
                      if (snapshot1.hasData &&
                          snapshot1.connectionState !=
                              ConnectionState.waiting &&
                          snapshot1.data != null) {
                        final scan = snapshot1.data!;
                        return WidgetCard(lists: {'data': data, 'scan': scan});
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    });
              } else {
                return const WidgetNoAntri();
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
