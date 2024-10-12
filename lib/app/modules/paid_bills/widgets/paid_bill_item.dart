import 'package:flutter/material.dart';
import '../controllers/paid_bills_controller.dart';

class PaidBillsItem extends StatelessWidget {
  final Tagihan tagihan;

  const PaidBillsItem({Key? key, required this.tagihan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Belum dibayar', style: TextStyle(color: Colors.grey)),
                Text('Tepat waktu', style: TextStyle(color: Colors.green)),
              ],
            ),
            SizedBox(height: 8),
            Text('Jatuh tempo ${tagihan.tanggalJatuhTempo}', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('${tagihan.jumlah.toStringAsFixed(0)}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}