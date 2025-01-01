import 'package:get/get.dart';
// this isthe controller used by the patient for the favourite doctor functionality
class FavouriteDoctorsController extends GetxController {
  var likedDoctors = <int>[].obs; // Use observable list to track liked doctors

  void toggleLike(int index) {
    if (likedDoctors.contains(index)) {
      likedDoctors.remove(index);
    } else {
      likedDoctors.add(index);
    }
  }
}
