import 'package:dio/dio.dart';

import 'package:listess/models/etudiants_models.dart';

class EtudiantService {
  static final Dio _dio = Dio();

  static Future<List<Etudiant>> getAllEtudiants() async {
    try {
      final response = await _dio.get('http://localhost:8080/api/inscription');
      final List<dynamic> jsonData = response.data;
      return jsonData.map((item) => Etudiant.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Failed to fetch etudiants');
    }
  }

  static Future<List<Etudiant>> getEtudiantsByClasse(String classe) async {
    try {
      final response = await _dio.get('http://localhost:8080/api/inscription', queryParameters: {'classe': classe});
      final List<dynamic> jsonData = response.data;
      return jsonData.map((item) => Etudiant.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Failed to fetch etudiants by classe');
    }
  }
}
