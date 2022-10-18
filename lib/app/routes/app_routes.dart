// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const ROOT = _Paths.root;

  static const HOME = _Paths.HOME;
  static const MAIN = _Paths.MAIN;
  static const LOGIN = _Paths.login;
  static const REGISTER = _Paths.register;
  static const PROFILE = _Paths.PROFILE;
  static const NOTIFICATIONS = _Paths.NOTIFICATIONS;
  static const NOTIFICATION = _Paths.NOTIFICATION;

  static const SHIPMENTS = _Paths.SHIPMENTS;
  static const SHIPMENT = _Paths.SHIPMENT;
  static const NEWSHIPMENT = _Paths.NEWSHIPMENT;

  static const REPORTS = _Paths.REPORTS;
  static const REPORT = _Paths.REPORT;
  static const PAYMENTS = _Paths.PAYMENTS;
  static const PAYMENT = _Paths.PAYMENT;

  static const OFFERS = _Paths.OFFERS;
  static const SINGLEOFFER = _Paths.SINGLEOFFER;
}

abstract class _Paths {
  // begin of app .. token true -> go main .. token false -> go login
  static const root = '/root';
  static const login = '/login';
  static const register = '/register';
  static const MAIN = '/main';

  static const HOME = '/home';
  static const PROFILE = '/profile';
  static const NOTIFICATIONS = '/notifications';
  static const NOTIFICATION = '/notification/:notid';

  // all shipments
  static const SHIPMENTS = '/shipments';
  // single shipment
  static const SHIPMENT = '/shipment/:uuid';
  // new shipment
  static const NEWSHIPMENT = '/newshipment';

  static const REPORTS = '/reports';
  static const REPORT = '/report/:uuid';
  static const PAYMENTS = '/payments';
  static const PAYMENT = '/payment/:uuid';

  static const OFFERS = '/offers';
  static const SINGLEOFFER = '/offer/:uuid';
}
