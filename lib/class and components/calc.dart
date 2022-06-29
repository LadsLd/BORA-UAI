// ignore_for_file: unnecessary_getters_setters, unnecessary_this
import 'package:flutter/widgets.dart';

class Calckm extends ChangeNotifier{
    double _valor = 0.0;
    double _consumo = 0.0;
    double _valorGas = 0.0;

  double get valor => _valor;

  set valor(double valor) {
    _valor = valor;
  }

  double get consumo => _consumo;

  set consumo(double consumo) {
    _consumo = consumo;
  }

  double get valorGas => _valorGas;

  set valorGas(double valorGas) {
    _valorGas = valorGas;
  } 

 void addValor(valor, cons,  vlg){
 this.valor = valor;
 this.consumo = cons;
 this.valorGas = vlg;
 notifyListeners();
 }

 double calculo() {
    return valor*valorGas/consumo*1000;
  }
}