// widgets/checkout_view.dart

import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
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
      padding: const EdgeInsets.all(16),
      child: const Text(
        'Booking Details',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget PaymentSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Text(
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
      child: const Text('Proceed to Checkout'),
    );
  }
}