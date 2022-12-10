
import 'package:parking_spot/app/models/parking_spot_model.dart';

class ParkingSpotList {

  final List<ParkingSpotModel> listParkingSpotModel;

  ParkingSpotList(this.listParkingSpotModel);

  ParkingSpotList.fromJson(List<dynamic> json):
        listParkingSpotModel = List.from(json).map((item) => ParkingSpotModel.fromJson(item)).toList() ;

}
