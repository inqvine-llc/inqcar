import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ApplicationService {
  static final ApplicationService _instance = ApplicationService._();
  ApplicationService._();
  static ApplicationService getInstance() {
    return _instance;
  }
}
