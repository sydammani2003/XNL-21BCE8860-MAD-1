import 'package:flutter/material.dart';

class CurrencySectionWidget extends StatelessWidget {
  const CurrencySectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Currency Overview',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: const [
            Expanded(
              child: CurrencyCardWidget(
                pair: 'USD/EUR',
                rate: '0.92',
                change: '+0.05%',
                isPositive: true,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: CurrencyCardWidget(
                pair: 'USD/GBP',
                rate: '0.79',
                change: '-0.12%',
                isPositive: false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CurrencyCardWidget extends StatelessWidget {
  final String pair;
  final String rate;
  final String change;
  final bool isPositive;

  const CurrencyCardWidget({
    Key? key,
    required this.pair,
    required this.rate,
    required this.change,
    required this.isPositive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2235),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pair,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            rate,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            change,
            style: TextStyle(
              color: isPositive ? Colors.green : Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
