import 'package:daytte/controllers/base_controller/baseController.dart';
import 'package:location/location.dart';

class PermissionController extends BaseController {
  Location location = new Location();

  // late bool _serviceEnabled;
  PermissionStatus? permissionGranted;
  late LocationData locationData;

  ///Create async methods for checking permission is granted or not
  Future<void> checkPermissions() async {
    final PermissionStatus permissionGrantedResult =
        await location.hasPermission();

    permissionGranted = permissionGrantedResult;

    
     if (permissionGranted == PermissionStatus.granted) {
        locationData = await location.getLocation();
      }
    if (permissionGranted == PermissionStatus.denied) requestPermission();
    print("permission status $permissionGranted  $locationData");
     update();
  }

  /// Create async method for requesting the permission
  Future<void> requestPermission() async {
    if (permissionGranted != PermissionStatus.granted) {
      final PermissionStatus permissionRequestedResult =
          await location.requestPermission();

      permissionGranted = permissionRequestedResult;

      update();
    } 
    
  }
}
