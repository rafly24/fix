import 'package:flutter/material.dart';
import '../controllers/not_paid_bills_controller.dart';

class NotPaidBillItem extends StatelessWidget {
  final Bill bill;

  const NotPaidBillItem({Key? key, required this.bill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Not yet Paid', style: TextStyle(color: Colors.grey)),
                Text(
                  bill.status,
                  style: TextStyle(
                    color: bill.status == 'Due Now' ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text('Due ${bill.dueDate}', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${bill.amount.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: bill.isPayButtonEnabled ? () {} : null,
                  child: Text('Pay'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: bill.isPayButtonEnabled ? Colors.green : Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}