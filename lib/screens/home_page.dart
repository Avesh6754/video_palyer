import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_palyer/screens/video_player.dart';

import '../provider/youtube_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var providerTrue = Provider.of<YoutubeProvider>(context, listen: true);
    var providerFalse = Provider.of<YoutubeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, Avesh '),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: (providerTrue.youtubeModal != null)
          ? FutureBuilder(
              future: providerFalse.fetch(),
              builder: (context, snapshot) {
                if (snapshot.hasError && snapshot.hasData) {
                  return Center(child: Text('Video Not Fetch'));
                }
                final category = snapshot.data!;
                return ListView.builder(
                  itemCount: category.categorylIst[0].videoList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => VideoPlayer(
                                description: category.categorylIst[0]
                                    .videoList[index].description,
                                name: category
                                    .categorylIst[0].videoList[index].title,
                                subtitel: category
                                    .categorylIst[0].videoList[index].subtitle,
                                videoUrl: category
                                    .categorylIst[0].videoList[index].source,
                              )));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                category.categorylIst[0].videoList[index].thumb,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(category
                                .categorylIst[0].videoList[index].thumb),
                          ),
                          title: Text(
                            category.categorylIst[0].videoList[index].title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                wordSpacing: 2),
                          ),
                          subtitle: Text(
                            category.categorylIst[0].videoList[index].subtitle,
                            style: TextStyle(fontSize: 12, wordSpacing: 2),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text('No Data Found'),
            ),
      bottomNavigationBar: BottomAppBar(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home,
            ),
            Icon(
              Icons.local_fire_department,
            ),
            Icon(
              Icons.folder_copy_sharp,
            ),
            Icon(
              Icons.history,
            )
          ],
        ),
      ),
    );
  }
}
