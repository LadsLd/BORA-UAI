import 'dart:async';
import 'package:borauai/db/db.dart';
import 'package:borauai/widgets/placesdetalhes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../screens/result.dart';

class PlacesController extends GetxController{
  final lat = 0.0.obs;
  final long = 0.0.obs;
  final raio = 0.0.obs;

  late StreamSubscription<Position> positionStream;
  late GoogleMapController _mapsController;
  final markers = <Marker>{};

  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  static PlacesController get to => Get.find<PlacesController>();
  get mapsController => _mapsController;
  get distancia => raio.value;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    _getPosicao();
    _loadPlaces();
  }

  _addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
    polylineId: id,
    width: 5,
    color: const Color.fromRGBO(105, 30, 210, 2.0),
    points: polylineCoordinates);
    polylines[id] = polyline;
    update();
  }

  removePolyline() async {
    polylineCoordinates.clear();
    update();
  }

  getPolyline(String nome) async {
    FirebaseFirestore db = DB.get();
    final places = await db.collection('places').where('nome', isEqualTo: nome).get();

    for (var place in places.docs) {
    GeoPoint point = place.get('position.geopoint');

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    "SUACHAVEDEAPI",
    PointLatLng(lat.value, long.value),
    PointLatLng(point.latitude, point.longitude),
    travelMode: TravelMode.driving);

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    _addPolyLine();
    }
  }
  
  _loadPlaces() async {
    FirebaseFirestore db = DB.get();
    final places = await db.collection('places').get();

    for (var place in places.docs) {
      _addMarker(place);
    }
  }

  _addMarker(place) async {
    GeoPoint point = place.get('position.geopoint');
    markers.add(
      Marker(
        markerId: MarkerId(place.id),
        position: LatLng(point.latitude, point.longitude),
        infoWindow: InfoWindow(title: place.get('nome')),
        onTap: () => _showDetails(place.data()),
      ),
    );
    update();
  }

  filterPlaces() async {
    final geo = Geoflutterfire();
    final db = DB.get();

    GeoFirePoint center = geo.point(
      latitude: lat.value,
      longitude: long.value,
    );   

    final ref = db.collection('places');
    String field = 'position';

    Stream<List<DocumentSnapshot>> 
      stream = geo.collection(collectionRef: ref).within(
      center: center,
      radius: raio.value,
      field: field,
      strictMode: true
      );
      
      stream.listen((List<DocumentSnapshot> places) {
      markers.clear();
      for (var place in places) {
      _addMarker(place);
      update();
      }
      Get.back();
    });
  }

  _showDetails(place) {
      showModalBottomSheet(
      context: appKey.currentState!.context,
      builder: (context) =>
      PlacesDetails(
      nome: place['nome'],
      imagem: place['imagem'],
      ),
      barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
      top: Radius.circular(50),
      ),
      ),
    );
  }

  _getPosicao() async {
    try {
        final posicao = await _posicaoAtual();
        lat.value = posicao.latitude;
        long.value = posicao.longitude;
       _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(lat.value, long.value)));
    } catch (e) {
      Get.snackbar(
        'Erro',
        e.toString(),
        backgroundColor: Colors.grey[900],
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  watchPosicao() async {
    positionStream = Geolocator.getPositionStream().listen((Position position) {
      // ignore: unnecessary_null_comparison
      if (position != null) {
        lat.value = position.latitude;
        long.value = position.longitude;
      }
    });
  }

  @override
  void onClose() {
    positionStream.cancel();
    super.onClose();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();

    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone.');
    }
      permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();

    if (permissao == LocationPermission.denied) {
      return Future.error('Você precisa autorizar o acesso à localização.');
    }
    }
    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Autorize o acesso à localização nas configurações.');
    }
    return await Geolocator.getCurrentPosition();
  }
}