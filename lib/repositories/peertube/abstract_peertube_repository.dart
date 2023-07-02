import 'models/peertube_video_model.dart';

abstract class AbstractPeertubeRepository {
  getVideoList({
    int categoryOneOf = 100,
    int count = 15,
    bool excludeAlreadyWatched = true,
    bool hasHLSFiles = true,
    bool isLive = false,
    bool isLocal = true,
    bool nsfw = false,
    int start = 0,
    List<String> tagsOneOf = const [],
  }) {}
}
