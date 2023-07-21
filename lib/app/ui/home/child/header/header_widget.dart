import 'package:flutter/material.dart';
import 'package:poc_ui_arch/app/domain/get_header_use_case.dart';

class HeaderWidget extends StatelessWidget {
  final Header header;

  const HeaderWidget({
    Key? key,
    required this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header.title,
            style: const TextStyle(fontSize: 18),
          ),
          Text(header.subtitle),
        ],
      );
}
