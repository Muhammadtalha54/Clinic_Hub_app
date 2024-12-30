import 'package:get/get.dart';

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
