import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';


import '../modal/youtube_modal.dart';
import '../services/apihelper.dart';

class YoutubeProvider extends ChangeNotifier {
  YoutubeModal? youtubeModal;
  late VideoPlayerController controller;
  ChewieController? chewieController;

  Future<YoutubeModal?> fetch() async {
    final data = await ApiService.apiService.fetchApiData();
    youtubeModal = YoutubeModal.fromMap(data);
    notifyListeners();
    return youtubeModal;
  }

  YoutubeProvider() {
    fetch();
  }
  Future<void> videoControllerInitilisationMethod(String videoUrl) async {
    log("====================$videoUrl");
    String processedUrl = videoUrl.startsWith('https') ? videoUrl : videoUrl.replaceFirst('http', 'https');

    controller = VideoPlayerController.networkUrl(Uri.parse(processedUrl));

    await controller.initialize();
    notifyListeners();
  }




  Future<void> chewieControllerMethod(String videoUrl) async {
    print("Video URL: $videoUrl"); // Debugging
    await videoControllerInitilisationMethod(videoUrl);

    chewieController = ChewieController(
      videoPlayerController: controller,
      autoPlay: true,
      looping: false,
    );
    notifyListeners();
  }

}
