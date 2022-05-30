import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';




class FullScreen extends StatefulWidget {
  final String imageurl;

  const FullScreen({Key? key,  required this.imageurl}) : super(key: key);
  @override
  _FullScreenState createState() => _FullScreenState();}

class _FullScreenState extends State<FullScreen> {
  get location => WallpaperManager.HOME_SCREEN;



 Future<void> setwallpaper() async {
   var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
   try {
     WallpaperManagerFlutter().setwallpaperfromFile(file , location);
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text('Wallpaper updated'),
       ),
     );
   } catch (e) {
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text('Error Setting Wallpaper'),
       ),
     );
     print(e);
   }
 }

 //     var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
 //     String result =
 //     await WallpaperManager.setWallpaperFromFile(file.path, location) as String;
 //     print(result);
 //   } on PlatformException {}
 // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Expanded(child: Container(
            child: Image.network(widget.imageurl),
          ),
          ),
          InkWell(
            onTap: () {
              setwallpaper();
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: Center(
                child: Text('Set Wallpaper',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}


