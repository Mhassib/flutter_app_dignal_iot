import 'package:flutter/material.dart';
import 'package:flutter_dignal_2025/models/models.dart';

class DevicesProvider extends ChangeNotifier {
  DevicesProvider() {
    getDevices();
  }

  late Device selectedDevice;
  // List<Device> devices = List.generate(
  //   20,
  //   (index) => Device(
  //     id: index + 1,
  //     name: 'Device ${index + 1}',
  //     active: Random().nextBool(),
  //   ),
  // );

  List<Device> devices = [];

  bool _isLoading = false;
  get isLoading => _isLoading;
  set isLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  getDevices() async {
    print('getDevices');
    _isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    _isLoading = false;
    notifyListeners();
  }

  void initSocket() {
    final socket = MyServer().socket;

    socket.connect();
  }
}
