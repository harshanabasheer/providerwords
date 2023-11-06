import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerwords/favorite.dart';
import 'package:providerwords/provider/provider_page.dart';
// import 'package:listview/image.dart';
// import 'package:listview/model/listmodel.dart';

class ListProvider extends StatefulWidget {
  const ListProvider({super.key});

  @override
  State<ListProvider> createState() => _ListProviderState();
}

class _ListProviderState extends State<ListProvider> {

  @override
  Widget build(BuildContext context) {
    List items=["time","world","fruits","people","day","way","man","thing","women","life","year","date"];

    final object= Provider.of<Provider_class>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> FavoriteList()));
        },
        label: Text("Favorites",style: TextStyle(color: Colors.white,fontSize: 15)),
      ),
      appBar: AppBar(title: const Text("English Words",style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,),
      body:
      ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                 child: ListTile(
                   leading: Text(items[index],style: TextStyle(fontWeight: FontWeight.bold)),
                   trailing: IconButton(
                     onPressed: (){
                       object.favorites(items[index]);
                     },
                     icon: object.icn_change(items[index])?Icon(Icons.favorite,color: Colors.red,):
                     Icon(Icons.favorite_border,color: Colors.blue,),
                   ),

                   ),
              ),
            );


          }),
    );
  }
}