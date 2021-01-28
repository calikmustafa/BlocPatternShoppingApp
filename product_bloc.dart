import 'dart:async';
import 'package:bloc_pattern/models/product.dart';
import 'package:bloc_pattern/data/product_service.dart';
class ProductBloc{

final productStreamController=StreamController.broadcast();

Stream get getStream=>productStreamController.stream;

List<Product>getAll(){
  return ProductService.getALL();
}

}

final productBloc=new ProductBloc();//referans oluşturduk.