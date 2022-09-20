class DeviceModel {
  DeviceModel({
    required this.device,
  });
  late final List<Device> device;

  DeviceModel.fromJson(Map<String, dynamic> json){
    device = List.from(json['device']).map((e)=>Device.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['device'] = device.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Device {
  Device({
    required this.id,
    required this.deviceName,
    required this.deviceType,
    required this.userId,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
  late final String id;
  late final String deviceName;
  late final String deviceType;
  late final String userId;
  late final String token;
  late final String createdAt;
  late final String updatedAt;
  late final int v;

  Device.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    deviceName = json['device_name'];
    deviceType = json['device_type'];
    userId = json['userId'];
    token = json['token'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['device_name'] = deviceName;
    data['device_type'] = deviceType;
    data['userId'] = userId;
    data['token'] = token;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}