class Show {
final String name;
final String premiered;
final List<String> genres;
final String summary;
final String imageUrl;
final int runtime;

  Show({ required this.name,required this.premiered,required this.genres, required this.summary,required this.imageUrl,required this.runtime});



  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      name: json['name'] ?? '',
      premiered: json['premiered'] ?? '',
      genres: List<String>.from(json['genres'] ?? []),
      summary: json['summary'] ?? '',
      imageUrl: json['image']?['medium'] ?? '',
      runtime: json['runtime'] != null ? json['runtime'] : 0,
    );
  }
Map<String, dynamic> toJson() {
    return {
      'name': name,
      'premiered': premiered,
      'genres': genres,
      'summary': summary,
      'image': {'medium': imageUrl},
      'runtime':runtime
    };
  }
}