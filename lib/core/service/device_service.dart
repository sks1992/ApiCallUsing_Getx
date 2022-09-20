import 'dart:convert';

import 'package:demo_flutter/core/service/url_service.dart';
import 'package:get/get.dart';

import '../model/device_model.dart';

class DeviceService extends GetConnect {
  final _urlService = Get.put(UrlService());

  @override
  void onInit() {
    httpClient.baseUrl = _urlService.getApiBaseUrl();
    super.onInit();
  }

  Future<DeviceModel> getDeviceData() async {
    var response = await get("/api");
    if (response.hasError) {
      return DeviceModel(device: []);
    } else {
      var result = DeviceModel.fromJson(json.decode(response.bodyString!));
      return result;
    }
  }
}
