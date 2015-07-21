import 'package:polymer/polymer.dart';
import 'dart:html';

import 'package:polymer_expressions/polymer_expressions.dart';
/**
 * A Polymer fatal-dialog element.
 */
@CustomTag('fatal-dialog')

class FatalDialog extends PolymerElement {

  @observable String message;

  factory FatalDialog (String message){
    Element e=  new Element.tag('fatal-dialog');
    e.message=message;
    return e;
  }
    /// Constructor used to create instance of FatalDialog.
    FatalDialog.created()
   : super.created() {
  }

  /*
   * Optional lifecycle methods - uncomment if needed.
   *

  /// Called when an instance of fatal-dialog is inserted into the DOM.
  attached() {
    super.attached();
  }

  /// Called when an instance of fatal-dialog is removed from the DOM.
  detached() {
    super.detached();
  }

  /// Called when an attribute (such as  a class) of an instance of
  /// fatal-dialog is added, changed, or removed.
  attributeChanged(String name, String oldValue, String newValue) {
  }

  /// Called when fatal-dialog has been fully prepared (Shadow DOM created,
  /// property observers set up, event listeners attached).
  ready() {
  }
   
  */
  
}
