import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movies_app/domain/models/show.dart';


class ShowRemoteDataSource {
  final String apiUrl = 'https://api.tvmaze.com/search/shows?q=spiderman';

  Future<List<Show>> fetchShows() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      List<Show> shows = [];
      for (var item in data) {
        shows.add(Show.fromJson(item['show']));
      }
      return shows;
    } else {
      throw Exception('Failed to load data');
    }
  }
}