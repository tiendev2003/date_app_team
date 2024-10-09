import 'dart:developer';

import 'package:date_app_team/core/api/api.dart';
import 'package:date_app_team/core/config/config.dart';
import 'package:date_app_team/features/plan/data/model/plan_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class PremiumProvider extends ChangeNotifier {
  int selectedPlan = -1;
  int selectedPlanPrice = 0;
  int selectedPayment = -1;
  String selectedPaymentName = "";

  var selectedPaymentattributes;

  updatePaymentName(String value) {
    selectedPaymentName = value;
    notifyListeners();
  }

  updateAttributes(value) {
    selectedPaymentattributes = value;
    notifyListeners();
  }

  updateSelectPlan(int value) {
    selectedPlan = value;
    notifyListeners();
  }

  updateSelectPlanPrice(int value) {
    selectedPlanPrice = value;
    notifyListeners();
  }

  updateSelectPayment(int value) {
    selectedPayment = value;
    notifyListeners();
  }

  final Api _api = Api();
  late PlanModel planmodel;
  bool isLoding = true;

  planDataApi(context, uid) async {
    Map data = {"uid": uid};
    try {
      Response response = await _api.sendRequest
          .post("${Config.baseUrlApi}${Config.userInfo}", data: data);
      if (response.statusCode == 200) {
        if (response.data["Result"] == "true") {
          planmodel = PlanModel.fromJson(response.data);
          isLoding = false;
          notifyListeners();
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
