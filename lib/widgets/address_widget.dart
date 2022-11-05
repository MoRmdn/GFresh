import 'package:flutter/material.dart';
import 'package:gfresh/models/location.dart';

import '../config/app_color.dart';

class AddressWidget extends StatelessWidget {
  final UserLocation uLocation;
  const AddressWidget({super.key, required this.uLocation});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: size.width * 0.5,
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColor.kAddressColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        title: Text(uLocation.name),
        subtitle: Text(uLocation.location),
      ),
    );
  }
}
