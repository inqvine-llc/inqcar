import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:inqcar/models/car_settings.dart';
import 'package:inqcar/models/profile_settings.dart';

abstract class AbstractLinuxService {
  CarSettings? currentCarSettings;
  Future<CarSettings> loadCarSettings();
  Future<void> saveCarSettings(CarSettings carSettings);

  ProfileSettings? currentProfileSettings;
  Future<ProfileSettings> loadProfileSettings();
  Future<void> saveProfileSettings(ProfileSettings profileSettings);

  Future<String> runShellCommand(String command);
  Stream<String> getDebugConsoleStream();

  Future<void> loadAllSettings();
}

class LinuxService implements AbstractLinuxService {
  static final LinuxService _instance = LinuxService._();
  LinuxService._();
  static LinuxService getInstance() {
    return _instance;
  }

  static const String settingsFilePath = '/home/pi/.pi_settings.json';

  @override
  CarSettings? currentCarSettings;

  @override
  ProfileSettings? currentProfileSettings;

  Future<Map<String, dynamic>> _loadSettings() async {
    final file = File(settingsFilePath);
    if (await file.exists()) {
      final content = await file.readAsString();
      return jsonDecode(content);
    }
    return {};
  }

  Future<void> _saveSettings(Map<String, dynamic> settings) async {
    final file = File(settingsFilePath);
    await file.writeAsString(jsonEncode(settings));
  }

  @override
  Future<CarSettings> loadCarSettings() async {
    final settings = await _loadSettings();
    currentCarSettings = CarSettings.fromJson(settings['car'] ?? {});
    return currentCarSettings!;
  }

  @override
  Future<void> saveCarSettings(CarSettings carSettings) async {
    final settings = await _loadSettings();
    settings['car'] = carSettings.toJson();
    await _saveSettings(settings);
    currentCarSettings = carSettings;
  }

  @override
  Future<ProfileSettings> loadProfileSettings() async {
    final settings = await _loadSettings();
    currentProfileSettings = ProfileSettings.fromJson(settings['profile'] ?? {});
    return currentProfileSettings!;
  }

  @override
  Future<void> saveProfileSettings(ProfileSettings profileSettings) async {
    final settings = await _loadSettings();
    settings['profile'] = profileSettings.toJson();
    await _saveSettings(settings);
    currentProfileSettings = profileSettings;
  }

  @override
  Future<String> runShellCommand(String command) async {
    final result = await Process.run('sh', ['-c', command]);
    if (result.exitCode != 0) {
      throw Exception('Command failed: ${result.stderr}');
    }
    return result.stdout.toString().trim();
  }

  @override
  Stream<String> getDebugConsoleStream() {
    return Stream.fromFuture(Process.start('journalctl', ['-f', '-n', '100'])).asyncExpand((Process process) {
      process.stderr.listen((event) {
        print('Error: ${utf8.decode(event)}');
      });

      return process.stdout.transform(utf8.decoder).transform(const LineSplitter());
    });
  }

  Future<void> stopDebugConsoleStream(StreamSubscription subscription) async {
    await subscription.cancel();
    final result = await runShellCommand('pkill journalctl');
    print('Stopped journalctl: $result');
  }

  @override
  Future<void> loadAllSettings() async {
    await loadCarSettings();
    await loadProfileSettings();
  }
}
