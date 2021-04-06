import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_four_flutter/model/provider/data_provider.dart';
import 'package:project_four_flutter/pages_first_way/provider/pages_provider.dart';
import 'package:provider/provider.dart';

class MyHomePageProvider extends StatelessWidget {
  static const String id = 'home_page';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 200) / 2;
    final double itemWidth = size.width / 2;
    return Consumer<DataProvider>(
      builder: (context, gridViews, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('MusicAppFlutter'),
          ),
          body: Container(
            child: GridView.count(
              childAspectRatio: (itemWidth / itemHeight),
              crossAxisCount: 2,
              children: List.generate(gridViews.listPhotoAlbumCount, (index) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      // second_way_provider
                      // Navigator.pushNamed(
                      //     context,
                      //     gridViews.routers[index],
                      //   );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PagesProvider(index)),
                      );
                    },
                    child: Card(
                      color: Colors.transparent,
                      elevation: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(gridViews.listPhotoAlbum[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              gridViews.listMusicCategory[index],
                              style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
