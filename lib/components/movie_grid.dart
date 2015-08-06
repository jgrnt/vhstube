import 'package:polymer/polymer.dart';
import 'dart:html';
import 'movie_model.dart';
import '../config.dart';
import 'package:template_binding/template_binding.dart';
import 'package:core_elements/core_list_dart.dart';
import 'package:route_hierarchical/client.dart';
/**
 * A Polymer movie-grid element.
 */
@CustomTag('movie-grid')

class MovieGrid extends PolymerElement {

  @observable ObservableList items;
  @observable int page = 0;
  @observable var selectedVideo;
  @observable var selectedChapter;
  @observable ObservableList groups=new ObservableList();
  @observable String videoServerUrl;

  final Router router =new Router(useFragment:true);
  /// Constructor used to create instance of MovieGrid.
  MovieGrid.created() : super.created() {
    Config.get("videoServerUrl").then((url)=>videoServerUrl=url);

  }

  transition(e) {
    if (this.page == 1) {
      router.gotoUrl("/");
    }
  }
  ready(){
    items.listChanges.listen((changes)=>updateGroups());
    router.root
    ..addRoute(name: 'video', path: '/video/:videoname/:chapter', enter: showVideo)
      ..addRoute(name: 'videonochapter', path: '/video/:videoname', enter: showVideo)
    ..addRoute(name: 'home', defaultRoute: true, path: '/', enter: showHome);

  router.listen();
  }
  updateGroups(){
    groups..clear()..addAll(items.map((elem)=>new CoreListGroup(data:{'title':elem.title,'fileName':elem.fileName,'imageUrl':"$videoServerUrl/thumb.php?src=${elem.fileName}&size=200"})));
  }

  loadMore(){
    document.querySelector('vhs-tube').shadowRoot.querySelector('#searchcontroller').more().then( (newResults) => $['threshold'].clearLower(true));
  }

   showHome(RouteEvent e) {
     selectedVideo=null;
     selectedChapter=null;
     page=0;
  // nothing to parse from path, since there are no groups
}

 showVideo(RouteEvent e) {
   print(e);
  var videoname = e.parameters['videoname'];
   selectedVideo=items.firstWhere((elem)=>elem.fileName==videoname,orElse:()=> null );
   if(selectedVideo!=null)
   {
     //TODO
   }
   selectedChapter= e.parameters['chapter'];
   page=1;
  // show article page with loading indicator

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
