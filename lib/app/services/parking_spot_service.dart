import 'dart:convert';


import 'package:http/http.dart' as http;

import '../models/parking_spot_list_model.dart';
import '../models/parking_spot_model.dart';


class ParkingSpotService{

  String urlGetListParkingSpot = "https://controle-vaga.herokuapp.com/parking-spot";
  String salvar = "https://controle-vaga.herokuapp.com/parking-spot";
  dynamic _response;
  ParkingSpotService(){
    _response="";
  }

  Future<ParkingSpotList> fetchListParkingSpot() async {
    _response = await http.get(Uri.parse(urlGetListParkingSpot));
    if (_response.statusCode == 200) {
      // Map<String, dynamic> retorno = json.decode(_response.body);
      // _response = await http.post(Uri.parse(urlGarage),body: jsonEncode(garage));
      List<dynamic> list = json.decode(_response.body);
      return ParkingSpotList.fromJson(list);
    } else {
      throw Exception('Failed to load cote');
    }
  }

  Future<dynamic> fetchPostGarage(ParkingSpotModel garage) async {
    _response = await http.post(Uri.parse(salvar),body: json.encode(garage.toJson()) ,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      }
    );
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      Map<String, dynamic> retorno = json.decode(_response.body);
      return ParkingSpotModel.fromJson(retorno) ;
    } else {
      return false;

    }

  }
  Future<dynamic> feteditarGarage(ParkingSpotModel garage) async {
    _response = await http.post(Uri.parse("https://controle-vaga.herokuapp.com/parking-spot/edit"),body: json.encode(garage.toJson()) ,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
    );
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      Map<String, dynamic> retorno = json.decode(_response.body);
      return ParkingSpotModel.fromJson(retorno) ;
    } else {
      return false;

    }

  }
  Future<dynamic> fetchDeleteGarage(ParkingSpotModel objeto) async {
    _response =
    await http.delete(Uri.parse(salvar + "/" + objeto.id.toString()));
    if (_response.statusCode == 200) {
      return _response.body;
    } else {
      throw Exception('Failed to load cote');
    }
  }




}







