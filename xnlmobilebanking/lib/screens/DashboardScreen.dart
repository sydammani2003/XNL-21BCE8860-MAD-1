import 'package:flutter/material.dart';
import 'package:xnlmobilebanking/components/BalanceCardWidget.dart';
import 'package:xnlmobilebanking/components/CurrencySectionWidget.dart';
import 'package:xnlmobilebanking/components/StockSectionWidget.dart';
import 'package:xnlmobilebanking/components/TransactionSectionWidget.dart';
import 'package:xnlmobilebanking/components/header_widget.dart';
// In your screen file (e.g., lib/screens/home_screen.dart)

enum TransactionStatus { complete, failed }

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1321),
      body: SafeArea(
        child: Column(
          children: [
            HeaderWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BalanceCardWidget(),
                      const SizedBox(height: 24),
                      StockSectionWidget(),
                      const SizedBox(height: 24),
                      TransactionSectionWidget(),
                      const SizedBox(height: 24),
                      CurrencySectionWidget(),
                    ],
                  ),
                ),
              ),
            ),
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFF1A2235),
        border: Border(
          top: BorderSide(
            color: Color(0xFF2A3245),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home', true),
          _buildNavItem(Icons.account_balance, 'Accounts', false),
          _buildNavItem(Icons.add_circle_outline, 'Pay', false),
          _buildNavItem(Icons.person_outline, 'Profile', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.blue : Colors.grey,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

// To use this widget, you would add it to your app like this:
// void main() {
//   runApp(const MaterialApp(
//     home: BankingAppUI(),
//     debugShowCheckedModeBanner: false,
//   ));
// }
