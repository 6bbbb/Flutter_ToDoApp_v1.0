import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ShowcaseCard extends StatelessWidget {
  //Vars

  final String ImageURL;
  ShowcaseCard({super.key, required this.ImageURL});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              color: Colors.transparent,
              child: Column(
                children: [
                  //image
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          width: double.infinity,
                          height: 350,
                          color: Colors.transparent,
                          child: Image(
                            image: NetworkImage(ImageURL),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //boi
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(111, 66, 66, 66),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                            child: Text(
                              "Title",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontFamily: "font1"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
