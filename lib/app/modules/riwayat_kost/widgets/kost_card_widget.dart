import 'package:flutter/material.dart';

class KostCardWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final bool isConfirmed;
  final String dateOfEntry;
  final String duration;
  final String status;
  final Color statusColor;
  final VoidCallback? onChatPressed;
  final VoidCallback? onPayPressed;
  final String? paymentExpiry;

  const KostCardWidget({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.isConfirmed,
    required this.dateOfEntry,
    required this.duration,
    required this.status,
    required this.statusColor,
    this.onChatPressed,
    this.onPayPressed,
    this.paymentExpiry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      buildInfoRow(Icons.check_circle_outline, 'Confirmed Room'),
                      SizedBox(height: 4),
                      buildInfoRow(
                        Icons.calendar_today,
                        'Date of Entry',
                        trailing: dateOfEntry,
                      ),
                      SizedBox(height: 4),
                      buildInfoRow(
                        Icons.access_time,
                        'Duration',
                        trailing: duration,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (paymentExpiry != null) ...[
              SizedBox(height: 16),
              Text(
                'Payment expires $paymentExpiry',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ],
            SizedBox(height: 16),
            if (onPayPressed != null)
              ElevatedButton(
                onPressed: onPayPressed,
                child: Text('Pay Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              )
            else if (onChatPressed != null)
              OutlinedButton(
                onPressed: onChatPressed,
                child: Text('Chat Owner'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.green, side: BorderSide(color: Colors.green),
                  minimumSize: Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String text, {String? trailing}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        if (trailing != null) ...[
          Spacer(),
          Text(
            trailing,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ],
    );
  }
}