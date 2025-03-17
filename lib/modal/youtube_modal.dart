class YoutubeModal {
  List<Category> categorylIst = [];

  YoutubeModal({required this.categorylIst});

  factory YoutubeModal.fromMap(Map<String, dynamic> m1) {
    return YoutubeModal(
      categorylIst: (m1['categories'] as List?)?.map((e) => Category.fromMap(e)).toList() ?? [],
    );
  }

}

class Category {
  List<Videos> videoList = [];

  Category({required this.videoList});

  factory Category.fromMap(Map<String, dynamic> m1) {
    return Category(
      videoList: (m1['videos'] as List?)?.map((e) => Videos.fromMap(e)).toList() ?? [],
    );
  }

}

class Videos {
  late String description, subtitle, thumb, title;
  List<String> source = [];

  Videos({
    required this.description,
    required this.title,
    required this.source,
    required this.subtitle,
    required this.thumb,
  });
  factory Videos.fromMap(Map<String, dynamic> m1) {
    return Videos(
      description: m1['description'] ?? '',
      title: m1['title'] ?? '',
      source: List<String>.from(m1["sources"].map((x) => x)),
      subtitle: m1['subtitle'] ?? '',
      thumb: m1['thumb'] ?? '',
    );
  }

}
