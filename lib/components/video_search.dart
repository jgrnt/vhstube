import 'package:polymer/polymer.dart';


import 'dart:developer';
/**
 * A Polymer vhs-tube element.
 */
@CustomTag('video-search')
class VideoSearch extends PolymerElement {


  @published String searchterm = "Hh";

  /// Constructor used to create instance of VhsTube.
  VideoSearch.created() : super.created() {
  }


  /// Called when an attribute (such as  a class) of an instance of
  /// search-controller is added, changed, or removed.
  attributeChanged(String name, String oldValue, String newValue) {
    debugger();
  }

  searchtermChanged() => debugger();


}
