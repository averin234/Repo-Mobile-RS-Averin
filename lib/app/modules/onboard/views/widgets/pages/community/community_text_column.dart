import 'package:flutter/material.dart';

import '../../text_column.dart';

class CommunityTextColumn extends StatelessWidget {
  const CommunityTextColumn();

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Rumah Sakit Averin',
      text:
          'Menjadikan Rumah Sakit Averin sebagai RS yang bermutu dan menjadi pilihan masyarakat.',
    );
  }
}
