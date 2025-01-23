import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class MainDrawe extends StatelessWidget {
  const MainDrawe({super.key});
//Vars
  final String instagramUrl = "https://www.instagram.com/username/";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[400],
        child: ListView(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.adobe_outlined,
                color: Colors.black54,
                size: 48,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                size: 32,
              ),
              title: Text("H O M E"),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              leading: Icon(
                Boxicons.bxl_instagram,
                size: 32,
              ),
              title: Text("I N S T A G R A M"),
            ),
            ListTile(
              leading: Icon(
                Boxicons.bxl_whatsapp,
                size: 32,
              ),
              title: Text("W H A T S A P P"),
            ),
          ],
        ),
      ),
    );
  }
}
