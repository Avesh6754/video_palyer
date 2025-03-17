import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_palyer/screens/video_player.dart';

import '../provider/youtube_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<YoutubeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi, Avesh '),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: provider.fetch(), // Fetch data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching videos'));
          }

          if (!snapshot.hasData || snapshot.data!.categorylIst.isEmpty) {
            return const Center(child: Text('No Data Found'));
          }

          final category = snapshot.data!;

          return ListView.builder(
            itemCount: category.categorylIst[0].videoList.length,
            itemBuilder: (context, index) {
              var video = category.categorylIst[0].videoList[index];

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VideoPlayer(
                      description: video.description,
                      name: video.title,
                      subtitel: video.subtitle,
                      videoUrl: video.source.isNotEmpty ? video.source.first : '',
                    ),
                  ));
                  log("========askdjsu ============${ video.source.isNotEmpty ? video.source.first : ''}");
                },
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(video.thumb),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(video.thumb),
                      ),
                      title: Text(
                        video.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 2,
                        ),
                      ),
                      subtitle: Text(
                        video.subtitle,
                        style: const TextStyle(fontSize: 12, wordSpacing: 2),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home),
            Icon(Icons.local_fire_department),
            Icon(Icons.folder_copy_sharp),
            Icon(Icons.history),
          ],
        ),
      ),
    );
  }
}
