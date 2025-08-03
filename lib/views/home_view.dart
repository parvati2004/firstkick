import 'package:cached_network_image/cached_network_image.dart';
import 'package:firstkick/services/apis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
          return GridView.custom(
           gridDelegate: SliverQuiltedGridDelegate(
             crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
           pattern: [
            QuiltedGridTile(2, 2),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
           QuiltedGridTile(1, 2),
           QuiltedGridTile(1, 1),
           ],
        ),
          
         childrenDelegate: SliverChildBuilderDelegate(
         (context, index)  {

              final meme = snapshot.data!.data!.memes![index];
              return Card(
                child:Column(children: [
                 
                CachedNetworkImage(
                  imageUrl:meme.url!,
                  fit:BoxFit.cover,
                  placeholder:(context,url)
                  {
                    return SizedBox.shrink
                  (
                   child: CircularProgressIndicator());
                  },
                  errorWidget:(context,uri,error)
                  =>Icon(Icons.error),

                ),
               
                
                ],
                ),
              );
         
            },
         ));

          
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