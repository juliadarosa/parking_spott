
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controllers/parking_spot_controller.dart';
import '../models/parking_spot_model.dart';
import 'home_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required String title});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {

  @override
  void initState() {
    super.initState();
    // controller.listParkSpot();
  }
  TextEditingController spotController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController responsibleController = TextEditingController();
  TextEditingController apartmentController = TextEditingController();
  TextEditingController blockController = TextEditingController();

  var controller = ParkingSpotController.parkingSpotController;


  Future save() async {

    ParkingSpotModel parkingSpot = ParkingSpotModel(
        "",
        spotController.text,
        licenseController.text,
        brandController.text,
        modelController.text,
        colorController.text,
        "",
        responsibleController.text,
        apartmentController.text,
        blockController.text);


    var response =  await controller.post(parkingSpot);
    print(spotController.text);

    if(response != false){

      Get.snackbar(
        "Sucesso",
        "Salvo com Sucesso",
        icon: Icon(Icons.check, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.lightGreen,
        colorText: Colors.white,
      );


    }else{
      Get.snackbar(
          "Houve um erro",
          "Deu ruim",
          icon: Icon(Icons.error, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          //   borderColor: Colors.blue
          colorText: Colors.white
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    //  print(widget.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text('Estacionar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 100,bottom: 100,left: 18,right: 18),
          child: Container(
            height: 550,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white38,
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  textAlign: TextAlign.center,
                  controller: responsibleController,
                ),
                const Text(
                    'Responsável',
                    style: TextStyle(color: Colors.blue)
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: spotController,
                ),
                const Text(
                    'vaga',
                    style: TextStyle(color: Colors.blue)
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: licenseController,
                ),
                const Text(
                    'placa',
                    style: TextStyle(color: Colors.blue)
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: brandController,
                ),
                const Text(
                    'Informe o nome do carro',
                    style: TextStyle(color: Colors.blue)
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: modelController,
                ),
                const Text(
                    'Informe a modelo do carro',
                    style: TextStyle(color: Colors.blue)
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: colorController,
                ),
                const Text(
                    'Informe a cor do carro',
                    style: TextStyle(color: Colors.blue)
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: apartmentController,
                ),
                const Text(
                    'Informe O endereço',
                    style: TextStyle(color: Colors.blue)
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: blockController,
                ),
                const Text(
                    'Complemento',
                    style: TextStyle(color: Colors.blue)
                ),


                SizedBox(

                  width: 100,
                  child: TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.green
                      ),
                      onPressed:save, child: Text('Cadastrar',                              style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )
                  )),
                ),

              ],
            ),
          ),
        ),
      ),
    );

  }
}