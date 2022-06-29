import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../class and components/navdrawer.dart';
import '../db/db.dart';

class AddPlaces extends StatefulWidget {
  const AddPlaces({Key? key}) : super(key: key);

  @override
  State<AddPlaces> createState() => _AddPlaces();
}

class _AddPlaces extends State<AddPlaces> {

final TextEditingController _nome = TextEditingController();
final TextEditingController _imagem = TextEditingController();
final TextEditingController _type = TextEditingController();
final TextEditingController _geohash = TextEditingController();
final TextEditingController _geolat = TextEditingController();
final TextEditingController _geolong = TextEditingController();

  @override
    Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){FocusScope.of(context).requestFocus(FocusNode());},
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(105, 30, 210, 2.0),
        drawer: const NavigationDrawer(),
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
                child: Container(
                   decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                     ),
                     child: SingleChildScrollView(
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         const SizedBox(height: 9),
                             Container(
                               padding: const EdgeInsets.all(12),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.end,
                                 children: [
                                  const Text('Nome',
                                  style: TextStyle(
                                  color: Color.fromRGBO(105, 30, 210, 2.0),
                                  fontSize: 14.0,
                                  )),
                                  const Padding(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  ),

                                   CupertinoTextField(
                                    controller: _nome,
                                    padding: const EdgeInsets.all(19),
                                    cursorColor: const Color.fromRGBO(105, 30, 210, 2.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      border: Border.all(
                                      color: const Color.fromRGBO(105, 30, 210, 2.0),
                                      width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    keyboardType: TextInputType.text,
                                  ),
                                ],
                              ),
                            ),

                             const SizedBox(height: 9),

                               Container(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                  const Text('Imagem',
                                  style: TextStyle(
                                  color: Color.fromRGBO(105, 30, 210, 2.0),
                                  fontSize: 14.0,
                                  )),
                                  const Padding(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  ),

                                    CupertinoTextField(
                                     controller: _imagem,
                                     padding: const EdgeInsets.all(19),
                                     cursorColor: const Color.fromRGBO(105, 30, 210, 2.0),
                                     decoration: BoxDecoration(
                                        color: Colors.black12,
                                       border: Border.all(
                                         color: const Color.fromRGBO(105, 30, 210, 2.0),
                                         width: 1,
                                       ),
                                       borderRadius: BorderRadius.circular(15),
                                     ),
                                    keyboardType: TextInputType.text,
                                    ),
                                  ],
                                ),
                             ),

                             const SizedBox(height: 9),
                               
                               Container(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                  const Text('Tipo de Estabelecimento',
                                  style: TextStyle(
                                  color: Color.fromRGBO(105, 30, 210, 2.0),
                                  fontSize: 14.0,
                                  )),
                                  const Padding(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  ),

                                    CupertinoTextField(
                                     controller: _type,
                                     padding: const EdgeInsets.all(19),
                                     cursorColor: const Color.fromRGBO(105, 30, 210, 2.0),
                                     decoration: BoxDecoration(
                                        color: Colors.black12,
                                       border: Border.all(
                                         color: const Color.fromRGBO(105, 30, 210, 2.0),
                                         width: 1,
                                       ),
                                       borderRadius: BorderRadius.circular(15),
                                     ),
                                    keyboardType: TextInputType.text,
                                    ),
                                  ],
                                ),
                             ),

                             const SizedBox(height: 9),
                               
                              Container(
                              padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                  const Text('Geohash',
                                  style: TextStyle(
                                  color: Color.fromRGBO(105, 30, 210, 2.0),
                                  fontSize: 14.0,
                                  )),
                                  const Padding(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  ),

                                    CupertinoTextField(
                                     controller: _geohash,
                                     padding: const EdgeInsets.all(19),
                                     cursorColor: const Color.fromRGBO(105, 30, 210, 2.0),
                                     decoration: BoxDecoration(
                                        color: Colors.black12,
                                       border: Border.all(
                                         color: const Color.fromRGBO(105, 30, 210, 2.0),
                                         width: 1,
                                       ),
                                       borderRadius: BorderRadius.circular(15),
                                     ),
                                    keyboardType: TextInputType.text
                                  ),
                                ],
                              ),
                            ),
                          
                            const SizedBox(height: 9),
                            
                            Container(
                              padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                  const Text('Latitude',
                                  style: TextStyle(
                                  color: Color.fromRGBO(105, 30, 210, 2.0),
                                  fontSize: 14.0,
                                  )),
                                  const Padding(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  ),

                                    CupertinoTextField(
                                     controller: _geolat,
                                     padding: const EdgeInsets.all(19),
                                     cursorColor: const Color.fromRGBO(105, 30, 210, 2.0),
                                     decoration: BoxDecoration(
                                        color: Colors.black12,
                                       border: Border.all(
                                         color: const Color.fromRGBO(105, 30, 210, 2.0),
                                         width: 1,
                                       ),
                                       borderRadius: BorderRadius.circular(15),
                                     ),
                                    keyboardType: TextInputType.number,
                                     onChanged: (String value) {
                                    setState((){});
                                    },
                                  ),
                                ],
                              ),
                            ),
                          
                              const SizedBox(height: 9),

                              Container(
                              padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                  const Text('Longitude',
                                  style: TextStyle(
                                  color: Color.fromRGBO(105, 30, 210, 2.0),
                                  fontSize: 14.0,
                                  )),
                                  const Padding(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  ),

                                    CupertinoTextField(
                                     controller: _geolong,
                                     padding: const EdgeInsets.all(19),
                                     cursorColor: const Color.fromRGBO(105, 30, 210, 2.0),
                                     decoration: BoxDecoration(
                                        color: Colors.black12,
                                       border: Border.all(
                                         color: const Color.fromRGBO(105, 30, 210, 2.0),
                                         width: 1,
                                       ),
                                       borderRadius: BorderRadius.circular(15),
                                     ),
                                    keyboardType: TextInputType.number,
                                     onChanged: (String value) {
                                    setState((){});
                                    },
                                  ),
                                ],
                              ),
                            ),
                          
                              const SizedBox(height: 9)
                           ],
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
               floatingActionButton: FloatingActionButton(
               onPressed: () {
                            final  _nome1 = _nome.text;
                            final  _imagem1 = _imagem.text;
                            final  _type1 = _type.text;
                            final  _geohash1 = _geohash.text;
                            final  _latitude = double.tryParse(_geolat.text);
                            final  _longitude = double.tryParse(_geolong.text);
                            
                            addPlaces(_nome1, _imagem1, _type1, _geohash1, _latitude, _longitude);
                             },
                             elevation: 2,
                             backgroundColor: const Color.fromRGBO(105, 30, 210, 2.0),
                             child: const Icon(
                             Icons.add,
                             color: Colors.white,
                             size: 30,
                           ),
                         ),
                       ),
                     );
                   }
                 }
                addPlaces(String nome, String imagem, String type , String geohash, geopointLat, geopointlong){
                FirebaseFirestore db = DB.get();
                db.collection('places').add({
                'nome': nome,
                'imagem': imagem,
                'type' : type,
                'position' : {
                'geohash': geohash,
                'geopoint': GeoPoint(geopointLat, geopointlong),
                 }
                 }
                 );
                 }