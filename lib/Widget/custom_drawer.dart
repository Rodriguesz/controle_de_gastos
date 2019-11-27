import 'package:controle_de_gastos/Tiles/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

 final PageController pageController;
  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

     Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(250, 20,200, 500),
            Colors.white
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
    );


    return Drawer(
        child: Stack(
      children: <Widget>[
        _buildDrawerBack(),
        ListView(
          padding: EdgeInsets.only(left: 32.0, top: 16.0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
              height: 170.0,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 8.0,
                    left: 0.0,
                    child: Text(
                      "Spending\n\ Controller",
                      style: TextStyle(
                          fontSize: 38.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            DrawerTile(Icons.home, "Inicio", pageController, 0),
            DrawerTile(Icons.control_point, "Registrar gastos", pageController, 1),
          ],
        )
      ],
    ));
  }
}
