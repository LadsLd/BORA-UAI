import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/addplace.dart';
import 'pagetransition.dart';

class NavigationDrawer extends StatelessWidget{
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: [
                    Container(
                      width: 260,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 180,
                        bottom: 15,
                      ),
                      child: SvgPicture.asset('assets/desenho.svg', width: 80),
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(105, 30, 210, 2.0),
                   borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45.0),
                      bottomRight: Radius.circular(45.0),
                    ),
                ),
              ),  
         ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Login'),
          onTap: (){Navigator.pop(context);},
        ),
         ListTile(
          leading: const Icon(Icons.library_books),
          title: const Text('Adicionar seu Role'),
          onTap: (){
          Navigator.of(context).push(
          CustomPageRoute( 
          child: const AddPlaces(),
          ),
          );},
        ),          
        ],
        ),
        );
  }
}