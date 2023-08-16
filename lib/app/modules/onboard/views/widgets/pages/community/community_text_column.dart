import 'package:flutter/material.dart';

import '../../text_column.dart';

class CommunityTextColumn extends StatelessWidget {
  const CommunityTextColumn();

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Rumah Sakit Gading Pluit',
      text:
          'Menjadikan Rumah Sakit Gading Pluit sebagai RS yang bermutu dan menjadi pilihan masyarakat.',
    );
  }
}
