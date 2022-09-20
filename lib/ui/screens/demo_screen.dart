import 'package:demo_flutter/core/controller/device_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_card.dart';

class DemoScreen extends StatelessWidget {
  DemoScreen({Key? key}) : super(key: key);

  final controller = Get.put(DeviceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Device Data"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue,
                ))
              : controller.errorMessage.value != ""
                  ? Center(
                      child: Container(
                        width: Get.width-20,
                        height: 30,
                        decoration:  BoxDecoration(
                            color: Colors.red,
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: Obx(
                          () => Center(
                            child: Text(controller.errorMessage.value),
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.deviceList.length,
                      itemBuilder: (context, index) {
                        var data = controller.deviceList[index];
                        return CustomCard(
                          deviceName: data.deviceName,
                          deviceType: data.deviceType,
                          userId: data.userId,
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
