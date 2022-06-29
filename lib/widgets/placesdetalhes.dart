import 'package:borauai/widgets/places.dart';
import 'package:flutter/material.dart';
class PlacesDetails extends StatelessWidget {
  final String nome;
  final String imagem;

  const PlacesDetails({Key? key, required this.nome, required this.imagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(40),
      ),
      child: Stack(
        children: [
          Image.network(
            imagem,
            height: 300,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: Colors.black.withOpacity(0.7),
            ),
            child: Text(
              nome,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),

           SizedBox(
             height: 300,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 FloatingActionButton(
                     onPressed:(){   
                     PlacesController.to.getPolyline(nome);
                     },
                     elevation: 2,
                     backgroundColor: const Color.fromRGBO(105, 30, 210, 2.0),
                     child: const Icon(
                     Icons.polyline_outlined,
                     color: Colors.white,
                     size: 30,
                     ),
                 ),
                 FloatingActionButton(
                 onPressed:(){   
                 PlacesController.to.removePolyline();
                 },
                 elevation: 2,
                 backgroundColor: Colors.red,
                 child: const Icon(
                 Icons.remove_circle,
                 color: Colors.white,
                 size: 30,
                 ),
                ),    
               ],
             ),
           ),    
        ],
      ),
    );
  }
}
