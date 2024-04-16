import 'package:flutter/material.dart';
import 'package:movies_app/domain/models/show.dart';
import 'package:movies_app/presentation/widget/chip.dart';

class DetailScreen extends StatelessWidget {
  final Show show;

  const DetailScreen({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Image.network(
                  show.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white,size: 25,),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    show.name,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Row(
                    children: [
                      Icon(Icons.schedule,size: 18,color: Colors.grey,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          show.runtime.toString() + " minutes",
                          style: const TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: Color.fromARGB(255, 34, 33, 33),
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Premiered',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    show.premiered,
                                    style: const TextStyle(
                                        fontSize: 11, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              "Genre",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:SmallChip(label: show.genres.join(", "), onPressed: () {  },)
                              
                              
                              //  Text(show.genres.join(", "),
                              //     style: const TextStyle(
                              //         fontSize: 11, color: Colors.white)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    color: Color.fromARGB(255, 34, 33, 33),
                    height: 0,
                  ),
                  const Text(
                    'Summary',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    show.summary,
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
