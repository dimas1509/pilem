import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "005b054be8066f98294121fc1ae5bbbe";

  Future<List<Map<String, dynamic>>> getAllMovies(String query) async {
      final response = await http.get(Uri.parse("$baseUrl/movie/now_playing?api_key=$apiKey"));
      final data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data['results']);
      
  }
  Future<List<Map<String, dynamic>>> getTrendingMovies(String query) async {
      final response = await http.get(Uri.parse("$baseUrl/movie/week?api_key=$apiKey"));
      final data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data['results']);
      
  }
  Future<List<Map<String, dynamic>>> getPopularMovies(String query) async {
      final response = await http.get(Uri.parse("$baseUrl/movie/popularMovies?api_key=$apiKey"));
      final data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data['results']);
      
  }
}