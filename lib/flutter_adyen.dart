import 'dart:async';

import 'package:flutter/services.dart';

class FlutterAdyen {
  static const MethodChannel _channel = const MethodChannel('flutter_adyen');

  static Future<String> openDropIn(
      {paymentMethods,
      required String baseUrl,
      required String clientKey,
      required String publicKey,
      lineItem,
      required String locale,
      required String amount,
      required String currency,
      required String returnUrl,
      required String shopperReference,
      required Map<String, String> additionalData,
      environment = 'TEST',
      appleMerchantID}) async {
    Map<String, dynamic> args = {};
    args.putIfAbsent('paymentMethods', () => paymentMethods);
    args.putIfAbsent('additionalData', () => additionalData);
    args.putIfAbsent('baseUrl', () => baseUrl);
    args.putIfAbsent('clientKey', () => clientKey);
    args.putIfAbsent('publicKey', () => publicKey);
    args.putIfAbsent('amount', () => amount);
    args.putIfAbsent('locale', () => locale);
    args.putIfAbsent('currency', () => currency);
    args.putIfAbsent('lineItem', () => lineItem);
    args.putIfAbsent('returnUrl', () => returnUrl);
    args.putIfAbsent('environment', () => environment);
    args.putIfAbsent('shopperReference', () => shopperReference);
    args.putIfAbsent('appleMerchantID', () => appleMerchantID);

    final String response = await _channel.invokeMethod('openDropIn', args);
    return response;
  }
}
