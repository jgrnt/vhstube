import 'package:polymer/polymer.dart';
import 'movie_model.dart';
import '../config.dart';
import 'package:template_binding/template_binding.dart';
/**
 * A Polymer movie-grid element.
 */
@CustomTag('movie-grid')

class MovieGrid extends PolymerElement {

  ObservableList items;
  @observable int page = 0;
  @observable var selectedAlbum;

  @observable String videoServerUrl;
  /// Constructor used to create instance of MovieGrid.
  MovieGrid.created() : super.created() {
    Config.get("videoServerUrl").then((url)=>videoServerUrl=url);
  }

  transition(e) {
    if (this.page == 0) {
      this.selectedAlbum = nodeBind(e.target).templateInstance
      .model['item'];
      this.page = 1;
    } else {
      this.page = 0;
    }
  }
  /*
   * Optional lifecycle methods - uncomment if needed.
   *

  /// Called when an instance of movie-grid is inserted into the DOM.
  attached() {
    super.attached();
  }

  /// Called when an instance of movie-grid is removed from the DOM.
  detached() {
    super.detached();
  }

  /// Called when an attribute (such as  a class) of an instance of
  /// movie-grid is added, changed, or removed.
  attributeChanged(String name, String oldValue, String newValue) {
  }

  /// Called when movie-grid has been fully prepared (Shadow DOM created,
  /// property observers set up, event listeners attached).
  ready() {
  }
   
  */
  
}
