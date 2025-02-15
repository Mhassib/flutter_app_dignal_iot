import 'package:flutter/material.dart';
import 'package:flutter_dignal_2025/models/models.dart';
import 'package:flutter_dignal_2025/services/my_server.dart';

class UsersProvider extends ChangeNotifier {
  UsersProvider() {
    getUsers();
  }

  bool isNewUser = true;

  late User selectedUser;

  bool _isLoading = false;
  get isLoading => _isLoading;
  set isLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  List<User> users = [];

  getUsers() async {
    _isLoading = true;
    notifyListeners();




    final usersList = await MyServer().getUsers();

    // Opción 1: Recibir un elemento de tipo List > User
    // Opción 2: null
    if (usersList == null) {
      return null;
    }

    users = usersList;



    _isLoading = false;
    notifyListeners();
  }

  addUser(User user) {
    users.add(user);
    notifyListeners();
  }
}
