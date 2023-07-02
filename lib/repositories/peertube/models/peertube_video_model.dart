class PeertubeVideoModel {
  final String name;
  final int likes;
  final String description;
  final String avatarPath;
  final List<dynamic> tags;
  final String playlistUrl;
  final List<String> comments;

  PeertubeVideoModel(
      {required this.name,
      required this.likes,
      required this.description,
      required this.avatarPath,
      required this.tags,
      required this.playlistUrl,
      required this.comments});
}
