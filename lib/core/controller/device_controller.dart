import 'package:demo_flutter/core/model/device_model.dart';
import 'package:demo_flutter/core/service/device_service.dart';
import 'package:get/get.dart';

class DeviceController extends GetxController {
  final appApi = Get.put(DeviceService());
  var isLoading = false.obs;
  var errorMessage = "".obs;
  var deviceList = RxList<Device>([]);

  @override
  void onInit() {
    getDeviceData();
    super.onInit();
  }

  Future<void> getDeviceData() async {
    isLoading.value = true;
    var result = await appApi.getDeviceData();
    if (result.device.isEmpty) {
      isLoading.value = false;
      errorMessage.value = "Something Went Wrong";
    } else {
      isLoading.value = false;
      deviceList.value = result.device;
    }
  }
}
