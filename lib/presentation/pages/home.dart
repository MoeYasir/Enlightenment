import 'package:flutter/material.dart';
import 'package:health_providers/presentation/widgets/home_grid_tile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.65,
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            padding: EdgeInsets.all(8),
            children: [
              HomeGridTile(icon: Icons.add_circle, title: "Hospital"),
              HomeGridTile(icon: Icons.add_circle, title: "Pharmacy"),
              HomeGridTile(icon: Icons.add_circle, title: "Ambulance"),
              HomeGridTile(icon: Icons.add_circle, title: "Doctor")
            ],
          ),
        ),
      ),
    );
  }
}
