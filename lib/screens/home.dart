import 'package:borauai/class%20and%20components/calc.dart';
import 'package:borauai/class%20and%20components/pagetransition.dart';
import 'package:borauai/screens/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../class and components/navdrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final TextEditingController _valor = TextEditingController();
final TextEditingController _consumo = TextEditingController();
final TextEditingController _valorGas = TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
    Widget build(BuildContext context) {
    final calc = context.watch<Calckm>();

    return GestureDetector(
      onTap: (){FocusScope.of(context).requestFocus(FocusNode());},
      child: Scaffold(
        key: _scaffoldKey,
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
                       icon: const Icon(Icons.menu_outlined,
                       color: Color.fromRGBO(105, 30, 210, 2.0),
                       ),
                       onPressed: (){
                        _scaffoldKey.currentState?.openDrawer();
                        
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
                         const SizedBox(height: 36),
                             Container(
                               padding: const EdgeInsets.all(15),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.end,
                                 children: [
                                  const Text('Valor em dinheiro',
                                  style: TextStyle(
                                  color: Color.fromRGBO(105, 30, 210, 2.0),
                                  fontSize: 14.0,
                                  )),
                                  const Padding(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  ),

                                   CupertinoTextField(
                                    controller: _valor,
                                    padding: const EdgeInsets.all(24),
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

                             const SizedBox(height: 10),

                               Container(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                  const Text('Valor atual gasolina',
                                  style: TextStyle(
                                  color: Color.fromRGBO(105, 30, 210, 2.0),
                                  fontSize: 14.0,
                                  )),
                                  const Padding(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  ),

                                    CupertinoTextField(
                                     controller: _valorGas,
                                     padding: const EdgeInsets.all(24),
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

                             const SizedBox(height: 10),
                               
                              Container(
                              padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                  const Text('Consumo do automóvel',
                                  style: TextStyle(
                                  color: Color.fromRGBO(105, 30, 210, 2.0),
                                  fontSize: 14.0,
                                  )),
                                  const Padding(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  ),

                                    CupertinoTextField(
                                     controller: _consumo,
                                     padding: const EdgeInsets.all(24),
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
                          
                              const SizedBox(height: 15),

                              Container(
                                padding: const EdgeInsets.all(12),
                                child: Card(
                                  color: const Color.fromRGBO(105, 30, 210, 2.0),
                                  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                    color: Color.fromRGBO(105, 30, 210, 2.0),
                                    width: 1,
                                    ),  
                                  ),
                                 child: Container(
                                   width: 1000,
                                   padding: const EdgeInsets.all(70),
                                   child: Row(
                                     children: [
                                      Expanded(
                                      child: Text((
                               (double.tryParse(_valor.text)??0)*
                               (double.tryParse(_valorGas.text)??0)/
                               (double.tryParse(_consumo.text)??1)
                               ).round().toString(),
                               style: const TextStyle(
                                 fontSize: 50,
                                 fontWeight: FontWeight.w300,
                                 color: Colors.white,
                                 ),
                                 ),     
                                 ),
                                  const Text(('KM'),
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
               floatingActionButton: FloatingActionButton(
               onPressed: () {
                            final  _valorg = double.tryParse(_valor.text);
                            final  _consumoe = double.tryParse(_consumo.text);
                            final  _valorGasw = double.tryParse(_valorGas.text);
                             calc.addValor(_valorg, _consumoe, _valorGasw);
                             Navigator.of(context).push(
                             CustomPageRoute( 
                             child: const Result()
                             ),
                             );
                             },
                             elevation: 2,
                             backgroundColor: const Color.fromRGBO(105, 30, 210, 2.0),
                             child: const Icon(
                             Icons.map_outlined,
                             color: Colors.white,
                             size: 30,
                           ),
                         ),
                       ),
                     );
                   }
                 }