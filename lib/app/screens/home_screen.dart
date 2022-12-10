import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:parking_spot/app/screens/register_screen.dart';

import '../controllers/parking_spot_controller.dart';
import '../models/parking_spot_model.dart';
import 'editar.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var controller = ParkingSpotController.parkingSpotController;

  @override
  void initState() {
    super.initState();
    controller.listParkingSpot();
    // controller.listCurrecies();
  }
  void _incrementCounter() {
    setState(() {

      _counter  ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        drawer:
        Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text("julia@mail.com"),
                accountName: Text("julia"),
                currentAccountPicture: CircleAvatar(
                  child: Text("SZ"),
                ),


              ),

              ListTile(
                leading: Icon(Icons.person),
                title: Text("register"),
                onTap: () {

                  Navigator.push(
                      context ,
                      MaterialPageRoute(builder: (context) => RegisterPage(title: 'cadastrar'))
                  );
                },
              ),


              // ListTile(
              //   leading: Icon(Icons.favorite),
              //   title: Text("Favoritos"),
              //   onTap: () {
              //     Navigator.pop(context);
              //     //Navegar para outra página
              //   },
              // ),
            ],
          ),
        ),
        body:
        Obx(() =>
        controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            :
        Container(

          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: controller.listParkingSpotObs.length,
              itemBuilder: (BuildContext context, int index) {
                return
                  Card(
                    child: ListTile(
                      trailing:
                      IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed:() async {


                            var response = await controller.delet(controller.listParkingSpotObs[index]);

                           if(response != false){
                             Get.snackbar(
                               "Sucesso",
                               "excluido com sucesso",
                               icon: Icon(Icons.check, color: Colors.white),
                               snackPosition: SnackPosition.BOTTOM,
                               backgroundColor: Colors.lightGreen,
                               colorText: Colors.white,
                             );

                             controller.listParkingSpot();

                           }else{
                             Get.snackbar(
                               "Errrrr",
                               "deu ruim",
                               icon: Icon(Icons.check, color: Colors.white),
                               snackPosition: SnackPosition.BOTTOM,
                               backgroundColor: Colors.red,
                               colorText: Colors.white,
                             );

                           }
                      }  ),
                      iconColor: Colors.red,
                      onTap: (){
                        Get.to(EditarPage(objeto: controller.listParkingSpotObs[index])) ;
                      },



                      //leading: FlutterLogo(),
                      title: Text(controller.listParkingSpotObs[index].responsibleName.toString()),


                    ),
                  );
                // Column(
                //   children: [
                //     Text(controller.listParkingSpotObs[index].responsibleName),
                //     Text(controller.listParkingSpotObs[index].modelCar),
                //     Text(controller.listParkingSpotObs[index].licensePlateCar),
                //     Text(controller.listParkingSpotObs[index].modelCar),
                //     Text(controller.listParkingSpotObs[index].colorCar),
                //     Text(controller.listParkingSpotObs[index].registrationDate),
                //     Text(controller.listParkingSpotObs[index].responsibleName),
                //     Text(controller.listParkingSpotObs[index].apartment),
                //   ],
                // );
              }),
        )
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}