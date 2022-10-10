import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/constants.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: Text(''),
            elevation: 0,
            backgroundColor: Colors.transparent,
            toolbarHeight: 105,
            floating: true,
            flexibleSpace: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipPath(
                  child: Container(
                    color: Colors.black,
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                  ),
                  clipBehavior: Clip.antiAlias,
                  clipper: ContainerClipper(),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.amber,
                  child: Center(
                      child: Text(
                    'Burgers',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: 'Caveat',
                        fontWeight: FontWeight.w700),
                  )),
                )
              ],
            ),
          ),
          buildGrid()
        ],
      )),
    );
  }

  Widget buildGrid() {
    return SliverToBoxAdapter(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: topOrder.length,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) => buildItem(index),
      ),
    );
  }

  Widget buildItem(index) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: CachedNetworkImageProvider('${topOrder[index]}'),
            height: 100,
            width: 100,
          ),
          Text(
            'Turkey',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            '30min',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Text(
            '12\$',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class ContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h - 50);

    path.quadraticBezierTo(w / 2, h, w, h - 50);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
