import 'package:flutter/foundation.dart';

class UserResponses with ChangeNotifier {
  String _userName = '';
  String _userContact = '';
  String _selectedHardness = '';
  String _selectedDrivingStyle = '';
  String _selectedTireStructure = '';
  String _selectedEnvironment = '';
  String _selectedTireSize = '';
  String _selectedVehicleType = '';

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void setUserContact(String contact) {
    _userContact = contact;
    notifyListeners();
  }

  void setSelectedHardness(String hardness) {
    _selectedHardness = hardness;
    notifyListeners();
  }

  void setSelectedDrivingStyle(String drivingStyle) {
    _selectedDrivingStyle = drivingStyle;
    notifyListeners();
  }

  void setSelectedTireStructure(String tireStructure) {
    _selectedTireStructure = tireStructure;
    notifyListeners();
  }

  void setSelectedEnvironment(String environment) {
    _selectedEnvironment = environment;
    notifyListeners();
  }

  void setSelectedTireSize(String tireSize) {
    _selectedTireSize = tireSize;
    notifyListeners();
  }

  void setSelectedVehicleType(String vehicleType) {
    _selectedVehicleType = vehicleType;
    notifyListeners();
  }

  String get userName => _userName;
  String get userContact => _userContact;
  String get selectedHardness => _selectedHardness;
  String get selectedDrivingStyle => _selectedDrivingStyle;
  String get selectedTireStructure => _selectedTireStructure;
  String get selectedEnvironment => _selectedEnvironment;
  String get selectedTireSize => _selectedTireSize;
  String get selectedVehicleType => _selectedVehicleType;

  void clearAll() {
    _userName = '';
    _userContact = '';
    _selectedHardness = '';
    _selectedDrivingStyle = '';
    _selectedTireStructure = '';
    _selectedEnvironment = '';
    _selectedTireSize = '';
    _selectedVehicleType = '';
    notifyListeners();
  }
}
