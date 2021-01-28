

import 'package:bloc_pattern/blocs/cart_bloc.dart';
import 'package:bloc_pattern/blocs/product_bloc.dart';
import 'package:bloc_pattern/models/cart.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: ()=>Navigator.pushNamed(context, "/cart"),//tıklandığında beni cart adresine götür dedik main sayfasında cart adresimizi belirledik.
          )
        ],
      ),
      body: buildProductList(),
          );
        }
      
      buildProductList() {
        return StreamBuilder(
          initialData:productBloc.getAll(),//ilk data olacağını belirledik
          stream: productBloc.getStream,//benim streame ulaşmamı sağlayan kod.
          builder: (context,snapshot){
            return snapshot.data.length>0?buildProductListItems(snapshot):Center(child: Text("Data yok"),);//gelen data 0 dan büyükse ürünümüz var demektir yok ise data yok diyecek
                        
            
                      },
            
                      );
                  }
            
      buildProductListItems(AsyncSnapshot snapshot) {
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder:(BuildContext context,index){
            final list=snapshot.data;
            return ListTile(
              title: Text(list[index].name),
              subtitle: Text(list[index].price.toString()),
              trailing: IconButton(icon: Icon(Icons.add_shopping_cart),
               onPressed:(){
                 cartBloc.addToCart(Cart(list[index],1));
               }),
               
               );
          });
      }


}