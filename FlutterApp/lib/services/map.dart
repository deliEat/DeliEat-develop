import 'package:map_view/map_view.dart';

const mapApiKey = 'AIzaSyAUwIOaSol54P8-pWjK1_ii9-MnSGTPjo4';

void initializeGoogleMaps() {
  MapView.setApiKey(mapApiKey);
}

class MapService {
  static final _instance = new MapService._internal();
  static final staticMapProvider = new StaticMapProvider(mapApiKey);

  factory MapService() {
    return _instance;
  }

  MapService._internal();
}
