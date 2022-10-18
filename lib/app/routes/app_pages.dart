// ignore_for_file: constant_identifier_names

import 'package:client/bindings/home.binding.dart';
import 'package:client/bindings/login.binding.dart';
import 'package:client/bindings/main.binding.dart';
import 'package:client/bindings/newshipment.binding.dart';
import 'package:client/bindings/notification.binding.dart';
import 'package:client/bindings/notifications.binding.dart';
import 'package:client/bindings/offers.binding.dart';
import 'package:client/bindings/profile.binding.dart';
import 'package:client/bindings/register.binding.dart';
import 'package:client/bindings/report.binding.dart';
import 'package:client/bindings/reports.binding.dart';
import 'package:client/bindings/root.binding.dart';
import 'package:client/bindings/single_shipment.binding.dart';
import 'package:client/bindings/shipments.binding.dart';
import 'package:client/bindings/singleoffer.binding.dart';
import 'package:client/views/home.view.dart';
import 'package:client/views/login.view.dart';
import 'package:client/views/main.view.dart';
import 'package:client/views/newshipment.view.dart';
import 'package:client/views/notification.view.dart';
import 'package:client/views/notifications.view.dart';
import 'package:client/views/offers.view.dart';
import 'package:client/views/profile.view.dart';
import 'package:client/views/register.view.dart';
import 'package:client/views/report.view.dart';
import 'package:client/views/reports.view.dart';
import 'package:client/views/root.view.dart';
import 'package:client/views/show_shipment.view.dart';
import 'package:client/views/shipments.view.dart';
import 'package:client/views/singleoffer.view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: _Paths.root,
      page: () => RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SHIPMENTS,
      page: () => ShipmentsView(),
      binding: ShipmentsBinding(),
    ),
    GetPage(
      name: _Paths.SHIPMENT,
      page: () => ShipmentView(),
      binding: ShipmentBinding(),
    ),
    GetPage(
      name: _Paths.NEWSHIPMENT,
      page: () => const NewShipmentView(),
      binding: NewShipmentBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    // notifications page
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: NotificationsBinding(),
    ),
    // single notification
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    //reports page

    GetPage(
      name: _Paths.REPORTS,
      page: () => ReportsView(),
      binding: ReportsBinding(),
    ),
    //single report
    GetPage(
      name: _Paths.REPORT,
      page: () => ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.OFFERS,
      page: () => const OffersView(),
      binding: OffersBinding(),
    ),
    GetPage(
      name: _Paths.SINGLEOFFER,
      page: () => const SingleOfferView(),
      binding: SingleOfferBinding(),
    ),
  ];
}
