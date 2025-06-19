import 'package:flutter/services.dart';

class HealthConnectService {
  static const _channel = MethodChannel('com.example.healthmate/healthconnect');

  static Future<String> readHeartRate() async =>
      await _invokeMethod('readHeartRate');

  static Future<String> readBloodGlucose() async =>
      await _invokeMethod('readBloodGlucose');

  static Future<String> readBloodPressure() async =>
      await _invokeMethod('readBloodPressure');

  static Future<String> readWeight() async =>
      await _invokeMethod('readWeight');

  static Future<String> _invokeMethod(String method) async {
    try {
      final result = await _channel.invokeMethod(method);
      return result.toString();
    } catch (e) {
      return '오류: $e';
    }
  }

  static Future<double> getWeight() async {
    try {
      final result = await _channel.invokeMethod('getWeight');
      return result ?? -1.0;
    } catch (e) {
      print('오류: $e');
      return -1.0;
    }
  }
  
}