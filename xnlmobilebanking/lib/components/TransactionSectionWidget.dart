import 'package:flutter/material.dart';

enum TransactionStatus { complete, failed }

class TransactionSectionWidget extends StatelessWidget {
  const TransactionSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Recent Transactions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'See All',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const TransactionItemWidget(
          title: 'Netflix Subscription',
          amount: '-\$14.99',
          date: 'Oct 28',
          status: TransactionStatus.complete,
          icon: Icons.play_circle_fill,
          iconColor: Colors.red,
        ),
        SizedBox(height: 12),
        const TransactionItemWidget(
          title: 'Salary Deposit',
          amount: '+\$4,500.00',
          date: 'Oct 25',
          status: TransactionStatus.complete,
          icon: Icons.work,
          iconColor: Colors.amber,
        ),
        SizedBox(height: 12),
        const TransactionItemWidget(
          title: 'Amazon Purchase',
          amount: '-\$35.88',
          date: 'Oct 24',
          status: TransactionStatus.failed,
          icon: Icons.shopping_bag,
          iconColor: Colors.blue,
        ),
      ],
    );
  }
}

class TransactionItemWidget extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final TransactionStatus status;
  final IconData icon;
  final Color iconColor;

  const TransactionItemWidget({
    Key? key,
    required this.title,
    required this.amount,
    required this.date,
    required this.status,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF1A2235),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 8),
                  status == TransactionStatus.complete
                      ? Row(
                          children: const [
                            Icon(Icons.check, color: Colors.green, size: 12),
                            SizedBox(width: 2),
                            Text(
                              'Complete',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: const [
                            Icon(Icons.close, color: Colors.red, size: 12),
                            SizedBox(width: 2),
                            Text(
                              'Failed',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ],
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            color: amount.startsWith('+') ? Colors.green : Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
