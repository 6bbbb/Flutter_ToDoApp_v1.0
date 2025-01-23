import 'package:flutter/material.dart';
import 'package:todoapp_practice/util/showcase_card.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});
  //Vars
  List ImagesURLs = [
    "https://i.pinimg.com/236x/48/98/82/489882280fc443abc3da24232e13483d.jpg",
    "https://i.pinimg.com/474x/cf/08/32/cf0832ffbaffb2fd13c14b269cb6b317.jpg",
    "https://i.pinimg.com/736x/16/ca/b1/16cab153397fc070d5369635ba891e8d.jpg",
    "https://i.pinimg.com/736x/3f/c6/e4/3fc6e467f7294bc2897b1684c0d3a334.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.grey[100],
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.blue.shade800],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            child: Container(
                child: ListView(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        //main Container for bg border
                        Container(
                          width: 500,
                          height: 295,
                          color: Colors.transparent,
                        ),
                        //banner image FX for Shadow
                        Container(
                          width: 500,
                          height: 240,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue,
                                    spreadRadius: 1,
                                    blurRadius: 20)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        //banner image
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          child: Container(
                            width: 500,
                            height: 240,
                            child: Image(
                              image: NetworkImage(
                                  "https://i.pinimg.com/originals/12/72/f7/1272f7e73de47c19e405c542fb9e4b69.gif"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //Shadow FX for Avatar
                        Positioned(
                          top: 120,
                          left: 240,
                          child: Container(
                            width: 170, // لضبط حجم الخلفية
                            height: 170, // لضبط حجم الخلفية
                            decoration: BoxDecoration(
                              shape: BoxShape.circle, // الشكل دائري
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Colors.black, // لون الظل
                                  spreadRadius: 0, // انتشار الظل
                                  blurRadius: 14, // تأثير الضبابية للظل
                                  offset: Offset(0, 4), // المسافة والاتجاه
                                ),
                              ],
                            ),
                          ),
                        ),
                        //avater image
                        Positioned(
                          top: 120,
                          left: 240,
                          child: CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(
                                "https://media4.giphy.com/media/CreQW9VKKyydHm95H8/giphy.webp?cid=790b7611pbygqskmyv81fs8e21cvhyu2uogl274sdamly73z&ep=v1_gifs_search&rid=giphy.webp&ct=g"),
                            foregroundColor: Colors.red,
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    //name and bio
                    Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "A.J",
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //bio
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "no god but allah☝️!",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //Showcase
                ShowcaseCard(
                  ImageURL: ImagesURLs[0],
                ),
                ShowcaseCard(
                  ImageURL: ImagesURLs[1],
                ),
                ShowcaseCard(
                  ImageURL: ImagesURLs[2],
                ),
                ShowcaseCard(
                  ImageURL: ImagesURLs[1],
                ),
                //continue after profile info
              ],
            )),
          )),
    );
  }
}
