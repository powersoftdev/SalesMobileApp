import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:sales_order/Constant/pubkey.dart';
import '../Screens/checkout.dart';

class   MakePayment {
  MakePayment(
      { this.ctx,
       this.reference,
       this.amount,
       this.card,
       this.email});

  BuildContext? ctx;
  int? amount;
  String? email;
  String? reference;
  dynamic card;

  PaystackPlugin paystack = PaystackPlugin();
  //Reference
  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  //Get UI
  PaymentCard _getCardUI() {
    return PaymentCard(number: '', cvc: '', expiryMonth: 0, expiryYear: 0);
  }

  Future initializedPlugin() async {
    await paystack.initialize(publicKey: ConstantKey.PAYSTACK_KEY);
  }

  //Method for charging Card
  chargeCardAndMakePayment() {
    initializedPlugin().then((_) async {
      Charge charge = Charge();
      amount = (amount! * 100);
      email = email;
      reference = _getReference();
      card = _getCardUI();

      CheckoutResponse response = await paystack.checkout(
        ctx!,
        charge: charge,
        method: CheckoutMethod.card,
        fullscreen: false,
        logo: const FlutterLogo(
          size: 24,
        ),
      );
      print('Response $response');
      if (response.status = true) {
        print('Transaction Successful');
      }
      else{
        print('Transaction Failed');
      }
    });
  }
}
