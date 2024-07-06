import 'package:flutter/material.dart';
import 'package:inqcar/apps/console_app.dart';
import 'package:ionicons/ionicons.dart';

enum CarApplication {
  terminal,
  browser,
  apps;

  String get name {
    switch (this) {
      case CarApplication.terminal:
        return 'Terminal';
      case CarApplication.browser:
        return 'Browser';
      case CarApplication.apps:
        return 'Apps';
      default:
        return 'Unknown';
    }
  }

  IconData get icon {
    switch (this) {
      case CarApplication.terminal:
        return Ionicons.terminal_outline;
      case CarApplication.browser:
        return Ionicons.globe_outline;
      case CarApplication.apps:
        return Ionicons.grid_outline;
      default:
        return Ionicons.help_outline;
    }
  }

  Widget get widget {
    switch (this) {
      case CarApplication.terminal:
        return const ConsoleApp();
      default:
        return const Placeholder();
    }
  }
}
