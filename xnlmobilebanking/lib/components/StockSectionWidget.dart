import 'package:flutter/material.dart';

class StockSectionWidget extends StatelessWidget {
  const StockSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Stocks',
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
              child: StockCardWidget(
                symbol: 'AAPL',
                price: '\$170.77',
                change: '+1.25%',
                isPositive: true,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: StockCardWidget(
                symbol: 'MSFT',
                price: '\$337.31',
                change: '-0.48%',
                isPositive: false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class StockCardWidget extends StatelessWidget {
  final String symbol;
  final String price;
  final String change;
  final bool isPositive;

  const StockCardWidget({
    Key? key,
    required this.symbol,
    required this.price,
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
            symbol,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            price,
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
