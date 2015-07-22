import 'package:polymer/polymer.dart';
import 'movie_model.dart';
import 'package:elastic_dart/browser_client.dart';
import 'package:dart_config/default_browser.dart';
/**
 * A Polymer search-controller element.
 */
@CustomTag('search-controller')
class SearchController extends PolymerElement {

  MovieModel model;
  Elasticsearch es;

  @observable String searchterm;

  /// Constructor used to create instance of SearchController.
  SearchController.created() : super.created() {
    loadConfig().then(
            (Map config) {
          es = new Elasticsearch(config["elasticUrl"]);
          performSearch();
        });
  }

  /*
   * Optional lifecycle methods - uncomment if needed.
   *

  /// Called when an instance of search-controller is inserted into the DOM.
  attached() {
    super.attached();
  }

  /// Called when an instance of search-controller is removed from the DOM.
  detached() {
    super.detached();
  }
*/


  searchtermChanged() => performSearch();



  performSearch() {
    if (es != null) {
      es.search(index: 'movies').then((result) {
        var movies = result['hits']['hits'].map((elem) => elem['_source']).toList();
        model.changeData(movies);
      });
    }
  }


}