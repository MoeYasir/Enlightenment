import 'package:flutter/material.dart';
import 'package:health_providers/presentation/widgets/home_grid_tile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: Text("Home"),
        // ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x007CBFCF),
                Color(0xB316BFC4),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 40, top: 40),
                child: Text(
                  "What'\s your \n enrollment ? ",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 26,
                  padding: const EdgeInsets.all(8),
                  children: const [
                    HomeGridTile(
                      title: "Hospital",
                      icon: 'assets/icons/icons8-hospital-sign-100.png',
                    ),
                    HomeGridTile(
                        icon: 'assets/icons/icons8-medicines-64.png',
                        title: "Pharmacy"),
                    HomeGridTile(
                        icon: 'assets/icons/icons8-ambulance-64.png',
                        title: "Ambulance"),
                    HomeGridTile(
                        icon: 'assets/icons/icons8-doctor-60.png',
                        title: "Doctor")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
