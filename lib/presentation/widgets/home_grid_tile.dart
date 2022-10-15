import 'package:flutter/material.dart';
import 'package:health_providers/presentation/pages/signup_login_page.dart';

class HomeGridTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const HomeGridTile({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.amberAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.add_circle), Text(title)],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => LogInSignUp(title: title)),
        );
      },
    );
  }
// getAppPages(String pageName) {
//     switch (pageName) {
//       case 'Hospital':
//         return DashboardContents();
//       case 'Pharmacy':
//         return UserDetails();
//       case 'Ambulance':
//         return CarDetails();
//       case 'Doctor':
//         return TripsPage();

//     }
//   }

}
