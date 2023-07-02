import 'package:dio/dio.dart';
import 'package:peertube_shorts/repositories/peertube/abstract_peertube_repository.dart';

import 'models/peertube_video_model.dart';

class PeertubeRepository implements AbstractPeertubeRepository {
  final String host = "videos.redeyes.site";
  final String apiVersion = "v1";
  @override
  Future<List<PeertubeVideoModel>> getVideoList(
      {int? categoryOneOf = 100,
      int count = 15,
      bool excludeAlreadyWatched = true,
      bool hasHLSFiles = true,
      bool isLive = false,
      bool isLocal = true,
      bool nsfw = false,
      int start = 0,
      List<String> tagsOneOf = const []}) async {
    String url = "https://$host/api/$apiVersion/videos?" +
        "count=$count"
            "&categoryOneOf=$categoryOneOf" +
        "&excludeAlreadyWatched=$excludeAlreadyWatched" +
        "&hasHLSFiles=$hasHLSFiles" +
        "&isLive=$isLive" +
        "&isLocal=$isLocal" +
        "&nsfw$nsfw" +
        "&start=$start";
    if (tagsOneOf.isNotEmpty) {
      for (var element in tagsOneOf) {
        url += "&tagsOneOf=$element";
      }
    }
    print("api: " + url);

    final response = await Dio().get(url);

    if (response.statusCode == 200) {
      final videoListData = response.data["data"] as List<dynamic>;

      List<dynamic> idList = videoListData.map((id) {
        print("id=${id["id"]}");
        return id["id"];
      }).toList();

      List<PeertubeVideoModel> videoList =
          await Future.wait(idList.map((id) async {
        final response =
            await Dio().get("https://videos.redeyes.site/api/v1/videos/$id");
        final videoData = response.data;
        return PeertubeVideoModel(
          name: videoData["name"],
          likes: videoData["likes"],
          description: videoData["description"] ?? "",
          avatarPath: "",
          tags: videoData["tags"] ?? [],
          comments: ["e", "w"],
          playlistUrl: videoData["streamingPlaylists"][0]["playlistUrl"],
        );
      }).toList());
      print(videoList.length);
      return videoList;
    } else {
      throw Exception("Failed to fetch video list");
    }
  }
}
