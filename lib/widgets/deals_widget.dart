import 'package:flutter/cupertino.dart';

class DealsOfTheDay extends StatefulWidget {
  const DealsOfTheDay({super.key});

  @override
  State<DealsOfTheDay> createState() => _DealsOfTheDayState();
}

class _DealsOfTheDayState extends State<DealsOfTheDay> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3 < 200 ? 200 : size.height * 0.3,
      width: size.width,
      child: Container(),
    );
  }
}
