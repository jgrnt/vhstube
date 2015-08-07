import 'package:polymer/polymer.dart';
import 'package:videoplay/api.dart';
import 'package:videoplay/html5.dart';
import 'movie_model.dart';
import '../config.dart';
import 'dart:html';
import 'dart:async';
/**
 * A Polymer movie-player element.
 */
@CustomTag('movie-player')
class MoviePlayer extends PolymerElement {

  @observable Movie video;

  @observable var chapter;
  var _videoServerUrl;
  Future<VideoPlayer> _player;

  /// Constructor used to create instance of MoviePlayer.
  MoviePlayer.created() : super.created()
  {
    Config.get("videoServerUrl").then((url) => _videoServerUrl = url);

  }


  videoChanged() async {
    var player = await _player;
    if (video == null) {
      player.stop();
    } else {
      var fileName = Uri.decodeComponent(video.fileName);
      player.loadVideo("$_videoServerUrl/$fileName");
      $["videoplayer"].children[0].load();
      player.play();

    };
  }

  /*
   * Optional lifecycle methods - uncomment if needed.
   *

  /// Called when an instance of movie-player is inserted into the DOM.
  attached() {
    super.attached();
  }

  /// Called when an instance of movie-player is removed from the DOM.
  detached() {
    super.detached();
  }

  /// Called when an attribute (such as  a class) of an instance of
  /// movie-player is added, changed, or removed.
  attributeChanged(String name, String oldValue, String newValue) {
  }

*/
  /// Called when movie-player has been fully prepared (Shadow DOM created,
  /// property observers set up, event listeners attached).
  ready() {
    var videoDiv = $["videoplayer"];
    Html5Attributes attr = new Html5Attributes();
    attr.supportedExtensions = ["mp4"];
    attr.width = null;
    attr.height = null;

    _player = embedHtml5(videoDiv, "/null", attr);

  }


}
