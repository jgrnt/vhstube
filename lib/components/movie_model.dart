import 'package:polymer/polymer.dart';
import 'dart:html';

class Movie extends Observable{

  @observable String title;

  Movie.fromJson(Map json):title=json['Title'];

}

/**
 * A Polymer movie-model element.
 */
@CustomTag('movie-model')

class MovieModel extends Observable {

  @observable ObservableList<Movie> items=new ObservableList();




  changeData(List<Map> json) {
    items.clear();
    items.addAll(json.map((elem)=>new Movie.fromJson(elem)));
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
