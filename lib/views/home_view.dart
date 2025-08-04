import 'package:cached_network_image/cached_network_image.dart';
import 'package:firstkick/services/apis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Memer APP"),
      ),
      body: FutureBuilder(
        future: API.getMemes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("❌ Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.data!.memes == null || snapshot.data!.data!.memes!.isEmpty) {
            return const Center(child: Text("No memes available"));
          }

          final memes = snapshot.data!.data!.memes!;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.custom(
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
                (context, index) {
                  final meme = memes[index];
                  return InkWell(
                    onTap:()=>launchUrl(Uri.parse(meme.url!)),
                    child: Stack(
                      children: [
                        Card(
                          child: CachedNetworkImage(
                            imageUrl: meme.url ?? '',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                            placeholder: (context, url) =>
                                const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, uri, error) => const Icon(Icons.error),
                          ),
                        ),
                    
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left:0,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Colors.black.withOpacity(0.2),
                            child: Text(
                              meme.name ??"Unknown meme",
                              style: const TextStyle(
                                color: Colors.white,
                                 fontSize: 16),
                            ),
                          ),
                          )
                          
                      ],
                    ),
                  );
                },
                childCount: memes.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
