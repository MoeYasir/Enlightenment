import 'package:flutter/material.dart';
import 'package:health_providers/presentation/pages/AmbulanceInfo.dart';
import 'package:health_providers/presentation/pages/DoctorInfo.dart';
import 'package:health_providers/presentation/pages/hospital_info.dart';
import 'package:health_providers/presentation/pages/pharmacy_info.dart';

class PageChoice extends StatelessWidget {
  final String title;
  const PageChoice({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getDrawerItems(title);
  }

  getDrawerItems(String pageName) {
    // SharedPreferences prefs = SharedPreferences.getInstance();

    switch (pageName) {
      case 'Hospital':
        return const HospitalInfo();
      case 'Pharmacy':
        return const PharmacyInfo();
      case 'Ambulance':
        return const AmbulanceInfo();
      case 'Doctor':
        return const DoctorInfo();
    }
  }
}
