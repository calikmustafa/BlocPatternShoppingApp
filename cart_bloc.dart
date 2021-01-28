import 'dart:async';
import 'package:bloc_pattern/data/cart_service.dart';
import 'package:bloc_pattern/models/cart.dart';
class CartBloc{

  final cartStreamController=StreamController.broadcast();//stream aynı future gibi asyn çalışır.farkı ise ilerleyen zamanda aynı işlemi bir kaç kez yapabilir.
  //canlı yayın stream dir.sürekli olarak canlı yayın bitene kadar data transferi yapıyor.
  //ekranımızda sepet sürekli değişicek o yüzden stream kullanıyoruz


  Stream get getStream=>cartStreamController.stream;//burda yaptığımız işlem get metodu yazarak getstream dediğimizde streamcontrollere ulaşabilicez.

  void addToCart(Cart item){
    CartService.addToCart(item);
    cartStreamController.sink.add(CartService.getCart());//event verdik bu cartSerive.getCart kullanan yerlerin build operasyonlarını bir daha çalıştır demek istedik
    //amacımız sepete ekledindiğinde güncellenmesi
    //sink ise getcartı kullanan kim varsa onun için buildirini çalıştır demek.kısaca streamı uyandırıyor.

  }
  void removeFromCart(Cart item){
    CartService.removeToCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  List<Cart>getCart(){//sepetteki ürünleri listeliyecek.
    return CartService.getCart();
  }


}
final cartBloc=new CartBloc();//referans oluşturduk.