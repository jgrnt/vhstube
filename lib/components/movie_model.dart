import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:core';


class Timecode extends Duration {

  Timecode({int microseconds: 0
           }):super(microseconds:microseconds);

  String toString() {


    String twoDigits(int n) {

      if (n >= 10) return "$n";

      return "0$n";

    }


    if (inMicroseconds < 0) {

      return "-${-this}";

    }

    String twoDigitHours= twoDigits(inHours);
    String twoDigitMinutes = twoDigits(inMinutes.remainder(Duration.MINUTES_PER_HOUR));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(Duration.SECONDS_PER_MINUTE));



    return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";

  }
}

class _IntermediateClass extends ObservableList<Chapter> {
  _IntermediateClass();
}

class Movie extends _IntermediateClass {

  @observable String title;
  @observable String fileName;

  Movie.fromJson(Map json):super(),
  title=json['Title'],
  fileName=Uri.encodeComponent(json['FileName']) {
    addAll(new ObservableList.from(json['Chapters'].map((elem) => new Chapter.fromJson(elem))));
  }


}


class Chapter extends Observable {

  @observable String name;
  @observable Timecode start;
  @observable Timecode thumbnailTime;
  @observable Timecode end;


  Chapter.fromJson(Map json):name=json['Name'], start=new Timecode(microseconds:json['Start']~/1000), end=new Timecode(microseconds:json['End']~/1000),thumbnailTime=new Timecode(microseconds:json['Start']~/1000+Duration.MICROSECONDS_PER_SECOND);

}

/**
 * A Polymer movie-model element.
 */
@CustomTag('movie-model')

class MovieModel extends Observable {

  @observable ObservableList<Movie> items=new ObservableList();




  changeData(List<Map> json) {
    items.clear();
    addData(json);
  }

  addData(List<Map> json) {
    items.addAll(json.map((elem) => new Movie.fromJson(elem)));
  }


  /*
   * Optional lifecycle methods - uncomment if needed.
   *

  /// Called when an instance of movie-model is inserted into the DOM.
  attached() {
    super.attached();
  }

  /// Called when an instance of movie-model is removed from the DOM.
  detached() {
    super.detached();
  }

  /// Called when an attribute (such as  a class) of an instance of
  /// movie-model is added, changed, or removed.
  attributeChanged(String name, String oldValue, String newValue) {
  }
*/
  /// Called when movie-model has been fully prepared (Shadow DOM created,
  /// property observers set up, event listeners attached).
  ready() {
    print(document.querySelector('#model'));
  }
   

  
}
