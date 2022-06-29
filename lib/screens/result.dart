import 'dart:async';
import 'package:borauai/class%20and%20components/calc.dart';
import 'package:borauai/widgets/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _Result();
}
final appKey = GlobalKey();

class _Result extends State<Result> {
  @override
    Widget build(BuildContext context) {

    final calc = context.watch<Calckm>();
    filtro() {
        PlacesController.to.raio.value = calc.calculo()/1000;
        PlacesController.to.filterPlaces();
      }
    Timer.periodic(const Duration(seconds: 1), (_){filtro();});
    final controller = Get.put(PlacesController());

    return GestureDetector(
      onTap: (){
      FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        key: appKey,
        backgroundColor: const Color.fromRGBO(105, 30, 210, 2.0),
          body: Column(
            children: [
               Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                 child: Container(
                    padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.bottom),
                   child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Container(
                       width: 40,
                       decoration: const BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.white,
                       ),
                       child: IconButton(
                       icon: const Icon(Icons.arrow_back_outlined,
                       color: Color.fromRGBO(105, 30, 210, 2.0),
                       ),
                       onPressed: (){
                         Navigator.pop(context);
                       }
                      ),
                      ),
                      SvgPicture.asset(
                      'assets/desenho.svg',
                      width: 200,
                      ),
                     ],
                   ),
                 ),
               ),
          
              Expanded(
                child: GetBuilder<PlacesController>(
                    init: controller,
                      builder: (context){
                        // ignore: prefer_collection_literals
                        final Set<Circle> circle = Set.from([
                         Circle(circleId: const CircleId('1'),
                         center: LatLng(controller.lat.value, controller.long.value),
                         radius: calc.calculo(), 
                         strokeWidth: 1,
                         fillColor: Colors.blue.shade100.withOpacity(0.5),
                         strokeColor: const Color.fromRGBO(105, 30, 210, 2.0),
                         ),
                         ]
                         );

                        return Center(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45),
                            ),

                            child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                            target: LatLng(controller.lat.value, controller.long.value),
                            zoom: 11.5),
                            polylines: Set<Polyline>.of(controller.polylines.values),
                            zoomControlsEnabled: true,
                            mapType: MapType.normal,
                            myLocationEnabled: true,
                            onMapCreated: controller.onMapCreated,
                            markers: Set.from(controller.markers),
                            circles: circle, 
                           ),
                          ),
                        );
                       }
                      ),
                    ),
                 ],
               ),
             ),
           );
         }
       }
       