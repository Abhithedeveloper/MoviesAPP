import 'package:flutter/material.dart';
import 'package:movies_app/data/repositories/movie_repository.dart';
import 'package:movies_app/domain/models/show.dart';
import 'package:movies_app/presentation/screens/detail_screens.dart';
import 'package:movies_app/presentation/widget/show_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final FetchShows _fetchShows;
  late Future<List<Show>> _fetchData;

  @override
  void initState() {
    super.initState();
    _fetchShows = FetchShows();
    _fetchData = _fetchShows.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Find Movies, Tv series, and more..',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            FutureBuilder<List<Show>>(
              future: _fetchData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final List<Show> data = snapshot.data!;
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: data.length > 5 ? 5 : data.length,
                      itemBuilder: (context, index) {
                        final show = data[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailScreen(show: show)),
                            );
                          },
                          child:widget_container(title: show.name, imageUrl: show.imageUrl,)
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
      bottomNavigationBar: BottomAppBar(
  color: Colors.black87,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
        icon: Icon(Icons.home),
        
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.play_arrow),
       color: Colors.orange,
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.person),
        color: Colors.grey,
        onPressed: () {},
      ),
    ],
  ),
),

    );
  }
}
