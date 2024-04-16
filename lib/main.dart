import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/data/repositories/show_repo.dart';

import 'package:movies_app/presentation/screens/home_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),);

  }
}







// class SpiderManShowsPage extends StatefulWidget {
//   @override
//   _SpiderManShowsPageState createState() => _SpiderManShowsPageState();
// }

// class _SpiderManShowsPageState extends State<SpiderManShowsPage> {
//   late Future<List<Map<String, dynamic>>> futureSpiderManShows;

//   @override
//   void initState() {
//     super.initState();
//     futureSpiderManShows = fetchSpiderManShows();
//   }

//   Future<List<Map<String, dynamic>>> fetchSpiderManShows() async {
//     final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=spiderman'));

//     if (response.statusCode == 200) {
//       // If the server returns a 200 OK response, parse the JSON
//       List<dynamic> data = jsonDecode(response.body);
//       List<Map<String, dynamic>> spiderManShows = [];
//       for (var item in data) {
//         spiderManShows.add(item['show']);
//       }
//       return spiderManShows;
//     } else {
//       // If the server did not return a 200 OK response, throw an exception.
//       throw Exception('Failed to load Spider-Man shows');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Spider-Man Shows'),
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: futureSpiderManShows,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Image.network(
//                     snapshot.data![index]['image']['medium'],
//                     width: 60,
//                     height: 60,
//                     fit: BoxFit.cover,
//                   ),
//                   title: Text(snapshot.data![index]['name']),
//                   onTap: () {
//                     // Handle onTap event
//                     // Navigate to details page, etc.
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }


// class SpiderManShow {
//   final String name;
//   final String image;
//   final String summary;
//   final String premiered;
//   final String genre;
//   final double rating;

//   SpiderManShow({
//     required this.name,
//     required this.image,
//     required this.summary,
//     required this.premiered,
//     required this.genre,
//     required this.rating,
//   });
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Spider-Man Shows',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SpiderManHomePage(),
//     );
//   }
// }

// class SpiderManHomePage extends StatefulWidget {
//   @override
//   _SpiderManHomePageState createState() => _SpiderManHomePageState();
// }

// class _SpiderManHomePageState extends State<SpiderManHomePage> {
//   late Future<List<SpiderManShow>> futureSpiderManShows;

//   @override
//   void initState() {
//     super.initState();
//     futureSpiderManShows = fetchSpiderManShows();
//   }

//   Future<List<SpiderManShow>> fetchSpiderManShows() async {
//     final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=spiderman'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       List<SpiderManShow> spiderManShows = [];
//       for (var item in data) {
//         spiderManShows.add(SpiderManShow(
//           name: item['show']['name'],
//           image: item['show']['image'] != null ? item['show']['image']['medium'] : '',
//           summary: item['show']['summary'],
//           premiered: item['show']['premiered'],
//           genre: item['show']['genres'].join(', '),
//           rating: item['show']['rating'] != null ? double.parse(item['show']['rating']['average'].toString()) : 0,
//         ));
//       }
//       return spiderManShows;
//     } else {
//       throw Exception('Failed to load Spider-Man shows');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Spider-Man Shows'),
//       ),
//       body: FutureBuilder<List<SpiderManShow>>(
//         future: futureSpiderManShows,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SpiderManDetailPage(show: snapshot.data![index])),
//                     );
//                   },
//                   child: Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.network(snapshot.data![index].image),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             snapshot.data![index].name,
//                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class SpiderManDetailPage extends StatelessWidget {
//   final SpiderManShow show;

//   const SpiderManDetailPage({Key? key, required this.show}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(show.name),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(show.image),
//             SizedBox(height: 16),
//             Text(
//               'Premiered: ${show.premiered}',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Genre: ${show.genre}',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Rating: ${show.rating}',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Summary:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               show.summary,
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class SpiderManShow {
//   final String name;
//   final String image;
//   final String summary;
//   final String premiered;
//   final String genre;
//   final double rating;

//   SpiderManShow({
//     required this.name,
//     required this.image,
//     required this.summary,
//     required this.premiered,
//     required this.genre,
//     required this.rating,
//   });
// }



// class SpiderManHomePage extends StatefulWidget {
//   @override
//   _SpiderManHomePageState createState() => _SpiderManHomePageState();
// }

// class _SpiderManHomePageState extends State<SpiderManHomePage> {
//   late Future<List<SpiderManShow>> futureSpiderManShows;

//   @override
//   void initState() {
//     super.initState();
//     futureSpiderManShows = fetchSpiderManShows();
//   }

//   Future<List<SpiderManShow>> fetchSpiderManShows() async {
//     final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=spiderman'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       List<SpiderManShow> spiderManShows = [];
//       for (var item in data) {
//         double rating = 0.0;
//         if (item['show']['rating'] != null && item['show']['rating']['average'] != null) {
//           rating = double.tryParse(item['show']['rating']['average'].toString()) ?? 0.0;
//         }
//         spiderManShows.add(SpiderManShow(
//           name: item['show']['name'],
//           image: item['show']['image'] != null ? item['show']['image']['medium'] : '',
//           summary: item['show']['summary'],
//           premiered: item['show']['premiered'],
//           genre: item['show']['genres'].join(', '),
//           rating: rating,
//         ));
//       }
//       return spiderManShows;
//     } else {
//       throw Exception('Failed to load Spider-Man shows');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Spider-Man Shows'),
//       ),
//       body: FutureBuilder<List<SpiderManShow>>(
//         future: futureSpiderManShows,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SpiderManDetailPage(show: snapshot.data![index])),
//                     );
//                   },
//                   child: Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.network(snapshot.data![index].image),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             snapshot.data![index].name,
//                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class SpiderManDetailPage extends StatelessWidget {
//   final SpiderManShow show;

//   const SpiderManDetailPage({Key? key, required this.show}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(show.name),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(show.image),
//             SizedBox(height: 16),
//             Text(
//               'Premiered: ${show.premiered}',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Genre: ${show.genre}',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Rating: ${show.rating}',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Summary:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               show.summary,
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class SpiderManShow {
//   final String name;
//   final String image;
//   final String summary;
//   final String premiered;
//   final String genre;
//   final double rating;

//   SpiderManShow({
//     required this.name,
//     required this.image,
//     required this.summary,
//     required this.premiered,
//     required this.genre,
//     required this.rating,
//   });
// }



// class SpiderManHomePage extends StatefulWidget {
//   @override
//   _SpiderManHomePageState createState() => _SpiderManHomePageState();
// }

// class _SpiderManHomePageState extends State<SpiderManHomePage> {
//   late Future<List<SpiderManShow>> futureSpiderManShows;

//   @override
//   void initState() {
//     super.initState();
//     futureSpiderManShows = fetchSpiderManShows();
//   }

//   Future<List<SpiderManShow>> fetchSpiderManShows() async {
//     final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=spiderman'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       List<SpiderManShow> spiderManShows = [];
//       for (var item in data) {
//         double rating = 0.0;
//         if (item['show']['rating'] != null && item['show']['rating']['average'] != null) {
//           rating = double.tryParse(item['show']['rating']['average'].toString()) ?? 0.0;
//         }
//         spiderManShows.add(SpiderManShow(
//           name: item['show']['name'] ?? '',
//           image: item['show']['image'] != null ? item['show']['image']['medium'] ?? '' : '',
//           summary: item['show']['summary'] ?? '',
//           premiered: item['show']['premiered'] ?? '',
//           genre: (item['show']['genres'] != null && (item['show']['genres'] as List).isNotEmpty)
//               ? item['show']['genres'].join(', ')
//               : '',
//           rating: rating,
//         ));
//       }
//       return spiderManShows;
//     } else {
//       throw Exception('Failed to load Spider-Man shows');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Spider-Man Shows'),
//       ),
//       body: FutureBuilder<List<SpiderManShow>>(
//         future: futureSpiderManShows,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SpiderManDetailPage(show: snapshot.data![index])),
//                     );
//                   },
//                   child: Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.network(snapshot.data![index].image),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             snapshot.data![index].name,
//                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class SpiderManDetailPage extends StatelessWidget {
//   final SpiderManShow show;

//   const SpiderManDetailPage({Key? key, required this.show}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(show.name),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(show.image),
//             SizedBox(height: 16),
//             Text(
//               'Premiered: ${show.premiered}',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Genre: ${show.genre}',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Rating: ${show.rating}',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Summary:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               show.summary,
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Spider-Man Shows',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SpiderManHomePage(),
//     );
//   }
// }

// class SpiderManHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Find Movies, Tv series, and more..',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 children: [
//                   _buildCard('Spider-Man (1967)', 'https://static.tvmaze.com/uploads/images/medium_portrait/23/58041.jpg', context),
//                   _buildCard('Knives Out (2019)', 'https://static.tvmaze.com/uploads/images/medium_portrait/207/518882.jpg', context),
//                   _buildCard('Onward (2020)', 'https://static.tvmaze.com/uploads/images/medium_portrait/280/701552.jpg', context),
//                   _buildCard('Mulan (2020)', 'https://static.tvmaze.com/uploads/images/medium_portrait/311/779525.jpg', context),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCard(String title, String imageUrl, BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => SpiderManDetailPage(title: title)),
//         );
//       },
//       child: Card(
//         elevation: 5,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(
//               imageUrl,
//               height: 150,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 title,
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SpiderManDetailPage extends StatelessWidget {
//   final String title;

//   const SpiderManDetailPage({Key? key, required this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Screen'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(
//               'https://static.tvmaze.com/uploads/images/medium_portrait/23/58041.jpg',
//               height: 200,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(height: 16),
//             Text(
//               title,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Spider-Man',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Row(
//               children: [
//                 Icon(Icons.schedule),
//                 SizedBox(width: 8),
//                 Text('30 minutes', style: TextStyle(fontSize: 16)),
//               ],
//             ),
//             SizedBox(height: 8),
//             Row(
//               children: [
//                 Icon(Icons.star),
//                 SizedBox(width: 8),
//                 Text('6.7 (IMDb)', style: TextStyle(fontSize: 16)),
//               ],
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Premiered',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Sept 1, 1967',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Genre',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Action, Sci-Fi',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Summary',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'First airing on the ABC television network in 1967, the series revolves around the scientific-minded teenager Peter Parker who, after being bitten by a radioactive spider, develops amazing strength and spider-like powers. He decides to become a crime-fighting, costumed superhero; all the while dealing with his personal problems and the insecurities resulting from being a teenager.',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// class SpiderManHomePage extends StatefulWidget {
//   @override
//   _SpiderManHomePageState createState() => _SpiderManHomePageState();
// }

// class _SpiderManHomePageState extends State<SpiderManHomePage> {
//   late Future<List<Map<String, dynamic>>> _fetchData;

//   @override
//   void initState() {
//     super.initState();
//     _fetchData = fetchData();
//   }

//   Future<List<Map<String, dynamic>>> fetchData() async {
//     final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=spiderman'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       return List<Map<String, dynamic>>.from(data.map((e) => e['show']));
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Find Movies, Tv series, and more..',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             FutureBuilder<List<Map<String, dynamic>>>(
//               future: _fetchData,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else {
//                   final List<Map<String, dynamic>> data = snapshot.data!;
//                   return Expanded(
//                     child: ListView.builder(
//                       itemCount: data.length,
//                       itemBuilder: (context, index) {
//                         final show = data[index];
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => SpiderManDetailPage(show: show)),
//                             );
//                           },
//                           child: Card(
//                             elevation: 5,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 children: [
//                                   Image.network(
//                                     show['image']['medium'],
//                                     height: 100,
//                                     width: 100,
//                                     fit: BoxFit.cover,
//                                   ),
//                                   SizedBox(width: 10),
//                                   Expanded(
//                                     child: Text(
//                                       show['name'],
//                                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SpiderManDetailPage extends StatelessWidget {
//   final Map<String, dynamic> show;

//   const SpiderManDetailPage({Key? key, required this.show}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Screen'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(
//               show['image']['medium'],
//               height: 200,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(height: 20),
//             Text(
//               show['name'],
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Premiered: ${show['premiered']}',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Genre: ${show['genres'].join(", ")}',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Summary: ${show['summary']}',
//               style: TextStyle(fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class SpiderManHomePage extends StatefulWidget {
  @override
  _SpiderManHomePageState createState() => _SpiderManHomePageState();
}

class _SpiderManHomePageState extends State<SpiderManHomePage> {
  late Future<List<Map<String, dynamic>>> _fetchData;

  @override
  void initState() {
    super.initState();
    _fetchData = fetchData();
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=spiderman'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data.map((e) => e['show']));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Find Movies, Tv series, and more..',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _fetchData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final List<Map<String, dynamic>> data = snapshot.data!;
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final show = data[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SpiderManDetailPage(show: show)),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                show['image']['medium'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SpiderManDetailPage extends StatelessWidget {
  final Map<String, dynamic> show;

  const SpiderManDetailPage({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              show['image']['medium'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              show['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Premiered: ${show['premiered']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Genre: ${show['genres'].join(", ")}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Summary: ${show['summary']}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}



