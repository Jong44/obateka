import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:obateka/app/models/resep_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResepService {
  late SharedPreferences prefs;

  Future getRiwatResepFromJson() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/resep.json');
    final data = await json.decode(jsonString);
    return data;
  }

  Future getRiwayatResepById(String id) async {
    final data = await getRiwatResepFromJson();
    final List<dynamic> resep = [];
    for (final Map<String, dynamic> item in data) {
      if (item['id'] == id) {
        resep.add(item);
      }
    }
    return resep[0];
  }

  Future<List> getAllStatusResep() async {
    prefs = await SharedPreferences.getInstance();
    final String? value = prefs.getString('confirmeResep');
    if (value == null) {
      return [];
    }
    final List<dynamic> data = json.decode(value);
    return data;
  }

  Future<void> setStatusResep(Map<String, dynamic> resepStatus) async {
    prefs = await SharedPreferences.getInstance();
    final allStatusResep = await getAllStatusResep();
    if (allStatusResep.isEmpty) {
      final List<String> data = [];
      data.add(resepStatus['id']);
      prefs.setString('confirmeResep', json.encode(data));
    } else {
      if (allStatusResep.contains(resepStatus['id'])) {
        allStatusResep.remove(resepStatus['id']);
        prefs.setString('confirmeResep', json.encode(allStatusResep));
      } else {
        allStatusResep.add(resepStatus['id']);
        prefs.setString('confirmeResep', json.encode(allStatusResep));
      }
    }
  }
}
