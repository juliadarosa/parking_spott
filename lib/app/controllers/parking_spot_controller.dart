import 'package:get/get.dart';

import '../models/parking_spot_model.dart';
import '../services/parking_spot_service.dart';

class ParkingSpotController extends GetxController {

  ParkingSpotService parkingSpotService = ParkingSpotService();
  var isLoading = false.obs;
  var listParkingSpotObs = <ParkingSpotModel>[].obs;

  static ParkingSpotController get parkingSpotController => Get.find();

  Future<dynamic> listParkingSpot()  async {
    isLoading.value = true;
    var list = await parkingSpotService.fetchListParkingSpot();
    listParkingSpotObs.value = list.listParkingSpotModel;
    isLoading.value = false;
    update();
    return listParkingSpotObs;
  }


  Future<dynamic> post(ParkingSpotModel objeto)  async {
    isLoading.value = true;
    var list = await parkingSpotService.fetchPostGarage(objeto);
    isLoading.value = false;
    update();
    return list;
  }


  Future<dynamic> put(ParkingSpotModel objeto)  async {
    isLoading.value = true;
    var list = await parkingSpotService.feteditarGarage(objeto);
    isLoading.value = false;
    update();
    return list;
  }
  Future<dynamic> delet(ParkingSpotModel objeto)  async {
    isLoading.value = true;
    var list = await parkingSpotService.fetchDeleteGarage(objeto);
    isLoading.value = false;
    update();
    return list;
  }





}

