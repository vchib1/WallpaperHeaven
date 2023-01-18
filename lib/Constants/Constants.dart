import 'package:flutter/material.dart';

const Color primaryColor = Colors.purpleAccent;
Color greyColor = Colors.grey.shade200;

const TextStyle textStyle1 = TextStyle(
  color: Colors.white,
);
const TextStyle textStyle2 = TextStyle();

const BorderRadius onlyLeftRight = BorderRadius.only(
  topRight: Radius.circular(15),
  bottomLeft: Radius.circular(15),
  topLeft: Radius.circular(15),
  bottomRight: Radius.circular(5),
);

const BorderRadius borderAll = BorderRadius.all(Radius.circular(10));
const BorderRadius borderAll2 = BorderRadius.all(Radius.circular(30));

const TextStyle setStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
);

Border whiteBorder = Border.all(
  color: Colors.white.withOpacity(.5),
  width: 1.0,
);

Border mainBorder = Border.all(color: Colors.purpleAccent);
Border otherBorder = Border.all(color: Colors.grey);
