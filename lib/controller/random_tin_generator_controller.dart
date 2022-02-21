import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:random_generator_tin/model/tin_model.dart';


class RandomTinGeneratorController extends ChangeNotifier {
  String tin = "";

  generateTin() {
    var tin = Tin();
    bool created = false;
    while (created == false) {
      String randomTin = Random().nextInt(999999999).toString();
      randomTin += Random().nextInt(99).toString();
      if (randomTin.length == 11) {
        created = tin.validateTin(randomTin);
      }
    }
    this.tin = tin.tin;
    notifyListeners();
  }
}
