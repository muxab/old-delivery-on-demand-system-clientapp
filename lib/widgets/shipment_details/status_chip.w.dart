import 'package:client/statics/fonts.dart';
import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  StatusChip({
    Key? key,
    required this.status,
  }) : super(key: key);
  final String status;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.indigo,
      avatar: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
      label: lightSmallText(
        statusAr(
          status,
        ),
      ),
    );
  }

  statusAr(String status) {
    String? arSt;
    switch (status) {
      case 'pick':
        arSt = 'رفع حمولة';
        break;
      case 'confirmed':
        arSt = 'في قائمة الانتظار';
        break;
      case 'onvehicle':
        arSt = 'في الطريق';
        break;
      case 'arrived':
        arSt = 'تم التوصيل';
        break;
      case 'canceled':
        arSt = 'تم الالغاء';
        break;
      case 'declined':
        arSt = 'مرفوضة';
        break;
      default:
        arSt = 'جديد';
        break;
    }
    return arSt;
  }
}
