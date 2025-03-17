import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_palyer/screens/home_page.dart';
import 'package:video_player/video_player.dart';

import '../provider/youtube_provider.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({
    super.key,
    required this.name,
    required this.description,
    required this.subtitel,
    required this.videoUrl,
  });

  final videoUrl;
  final name;
  final subtitel;
  final description;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      log("message=======================${widget.videoUrl}");
      Provider.of<YoutubeProvider>(context, listen: false)
          .chewieControllerMethod(widget.videoUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    var providerTrue = Provider.of<YoutubeProvider>(context, listen: true);
    var providerFalse = Provider.of<YoutubeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
        }, icon: Icon(Icons.arrow_back)),
        title: Text('Video Player'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (providerTrue.chewieController != null &&
              providerTrue.controller.value.isInitialized)
            AspectRatio(
              aspectRatio: providerTrue.controller.value.aspectRatio,
              child: Chewie(controller: providerTrue.chewieController!),
            ),

          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Column(
              children: [
                Text(
                  '${widget.name + widget.subtitel}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Text(
                  '${widget.description}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/image/images-removebg-preview.png'),
            ),
            title: Text("Video Player Project",style: TextStyle(fontWeight: FontWeight.w700),),
            subtitle: Text("Subscription ",style: TextStyle(fontWeight: FontWeight.w400),),
            trailing: ElevatedButton(onPressed: () {

            }, child: Text('Subscribe')),
          ),
          Divider(),
          Expanded(
            child: FutureBuilder(
              future: providerFalse.fetch(), // Fetch data
              builder: (context, snapshot) {
                log("Fetching Data: ${snapshot.connectionState}");

                if (snapshot.hasError) {
                  log("Error: ${snapshot.error}");
                  return const Center(child: Text('Error fetching videos'));
                }

                if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(child: Text('No Data Available'));
                }

                final category = snapshot.data!;

                if (category.categorylIst.isEmpty ||
                    category.categorylIst[0].videoList.isEmpty) {
                  return const Center(child: Text('No videos available'));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: category.categorylIst[0].videoList.length,
                  itemBuilder: (context, index) {
                    var video = category.categorylIst[0].videoList[index];

                    return GestureDetector(
                        onTap: () {
                          log("Video URL: ${video.source.isNotEmpty ? video.source.first : 'No Source'}");
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VideoPlayer(
                              description: video.description,
                              name: video.title,
                              subtitel: video.subtitle,
                              videoUrl: video.source.isNotEmpty
                                  ? video.source.first
                                  : '',
                            ),
                          ));
                        },
                        child: ListTile(
                          leading:  Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: NetworkImage(video.thumb),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            video.title,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            video.subtitle,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
