import 'package:cached_network_image/cached_network_image.dart';
import 'package:firstkick/services/apis.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    
        title:const Text("Memer APP"),
      ),
      body:FutureBuilder(future: API.getMemes(), builder:(context,snapshot){

        if(snapshot.hasData)
        {
          return ListView.builder(
            itemCount: snapshot.data!.data!.memes!.length,
            itemBuilder: (context, index) {

              final meme = snapshot.data!.data!.memes![index];
              return ListTile(
                leading:CachedNetworkImage(
                  imageUrl:meme.url!,
                  placeholder:(context,url)=>CircularProgressIndicator(),
                  errorWidget:(context,uri,error)=>Icon(Icons.error),

                ),
                title:Text(meme.name!),
                subtitle:Text(meme.url!),
              );
            },

          );
        }
        else{
          return Center(
          child:CircularProgressIndicator(),
          );
        }
      })
    );
  }
}