import 'package:flutter/material.dart';
import 'package:inqcar/apps/console_app.dart';
import 'package:inqcar/extensions/type_extensions.dart';
import 'package:ionicons/ionicons.dart';

enum CarApplication {
  terminal,
  browser,
  apps,
  music,
  navigation,
  phone,
  settings,
  climate,
  camera,
  calendar,
  notes,
  calculator,
  weather,
  radio,
  podcast,
  audiobook,
  messages,
  email,
  contacts,
  gallery,
  carDiagnostics,
  voiceAssistant,
  parking,
  charging,
  userManual;

  String get name {
    return toString().split('.').last.replaceAll(RegExp(r'(?<!^)(?=[A-Z])'), ' ').capitalize();
  }

  IconData get icon {
    switch (this) {
      case CarApplication.terminal:
        return Ionicons.terminal_outline;
      case CarApplication.browser:
        return Ionicons.globe_outline;
      case CarApplication.apps:
        return Ionicons.grid_outline;
      case CarApplication.music:
        return Ionicons.musical_notes_outline;
      case CarApplication.navigation:
        return Ionicons.navigate_outline;
      case CarApplication.phone:
        return Ionicons.call_outline;
      case CarApplication.settings:
        return Ionicons.settings_outline;
      case CarApplication.climate:
        return Ionicons.thermometer_outline;
      case CarApplication.camera:
        return Ionicons.camera_outline;
      case CarApplication.calendar:
        return Ionicons.calendar_outline;
      case CarApplication.notes:
        return Ionicons.document_text_outline;
      case CarApplication.calculator:
        return Ionicons.calculator_outline;
      case CarApplication.weather:
        return Ionicons.partly_sunny_outline;
      case CarApplication.radio:
        return Ionicons.radio_outline;
      case CarApplication.podcast:
        return Ionicons.mic_outline;
      case CarApplication.audiobook:
        return Ionicons.headset_outline;
      case CarApplication.messages:
        return Ionicons.chatbubble_outline;
      case CarApplication.email:
        return Ionicons.mail_outline;
      case CarApplication.contacts:
        return Ionicons.people_outline;
      case CarApplication.gallery:
        return Ionicons.images_outline;
      case CarApplication.carDiagnostics:
        return Ionicons.car_outline;
      case CarApplication.voiceAssistant:
        return Ionicons.mic_outline;
      case CarApplication.parking:
        return Ionicons.location_outline;
      case CarApplication.charging:
        return Ionicons.battery_charging_outline;
      case CarApplication.userManual:
        return Ionicons.book_outline;
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
