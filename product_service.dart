import 'package:bloc_pattern/models/product.dart';
class ProductService{
static List<Product>products=new List<Product>();


ProductService._internal();//tasarım deseni ve construcator
static ProductService _singleton=ProductService._internal();
factory ProductService(){//factory arka planda 
  return _singleton;
}


static List<Product> getALL(){
products.add(Product(1,"Acer Laptop",8200));
products.add(Product(2,"Asus Laptop",7200));
products.add(Product(3,"Hp Laptop",6200));
return products;


 }



}