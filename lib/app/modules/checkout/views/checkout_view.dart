// widgets/checkout_view.dart

import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          BookingDetails(),
          PaymentSummary(),
          CheckoutButton(),
        ],
      ),
    );
  }

  Widget BookingDetails() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        'Booking Details',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget PaymentSummary() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        'Payment Summary',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget CheckoutButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle checkout action
        print('Checkout button pressed');
      },
      child: Text('Proceed to Checkout'),
    );
  }
}