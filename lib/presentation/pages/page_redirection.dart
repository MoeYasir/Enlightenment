import 'package:flutter/material.dart';
import 'package:health_providers/presentation/pages/AmbulanceInfo.dart';
import 'package:health_providers/presentation/pages/DoctorInfo.dart';
import 'package:health_providers/presentation/pages/hospital_info.dart';
import 'package:health_providers/presentation/pages/pharmacyInfo.dart';

class PageChoice extends StatelessWidget {
  final String title;
  const PageChoice({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getDrawerItems(title);
  }

  getDrawerItems(String pageName) {
    switch (pageName) {
      case 'Hospital':
        return HospitalInfo();
      case 'Pharmacy':
        return PharmacyInfo();
      case 'Ambulance':
        return AmbulanceInfo();
      case 'Doctor':
        return DoctorInfo();
    }
  }
}
