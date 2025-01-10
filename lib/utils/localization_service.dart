import 'dart:convert';
import 'package:flutter/services.dart';

class LocalizationService {
  static final LocalizationService _instance = LocalizationService._internal();

  factory LocalizationService() {
    return _instance;
  }

  LocalizationService._internal();

  Map<String, String>? _localizedStrings;

  Future<void> loadStrings(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = Map<String, String>.from(jsonMap);
  }

  /// Recupera una stringa dalla mappa
  String getString(String key) {
    return _localizedStrings?[key] ?? 'Stringa non trovata: $key';
  }
}
