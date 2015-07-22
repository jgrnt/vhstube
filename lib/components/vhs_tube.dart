import 'package:polymer/polymer.dart';
import 'package:dart_config/default_browser.dart';
import 'fatal_dialog.dart';
import 'movie_model.dart';
import 'dart:developer';
/**
 * A Polymer vhs-tube element.
 */
@CustomTag('vhs-tube')

class VhsTube extends PolymerElement {

  @published MovieModel model = new MovieModel();

  @observable String searchterm;
  /// Constructor used to create instance of VhsTube.
  VhsTube.created() : super.created() {
  }


  /*
   * Optional lifecycle methods - uncomment if needed.
   *

  /// Called when an instance of vhs-tube is inserted into the DOM.
  attached() {
    super.attached();
  }

  /// Called when an instance of vhs-tube is removed from the DOM.
  detached() {
    super.detached();
  }

  /// Called when an attribute (such as  a class) of an instance of
  /// vhs-tube is added, changed, or removed.
  attributeChanged(String name, String oldValue, String newValue) {
  }
*/
  /// Called when vhs-tube has been fully prepared (Shadow DOM created,
  /// property observers set up, event listeners attached).
  ready() {

    loadConfig().then(
    (Map config) {
     print(config["elasticUrl"]);
     // continue with your app here!
    },
    onError: (error) => this.children.add(new FatalDialog("No config on server")));
  }
   

  
}
