import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Money Sent', 'Money Received'];

  final List<Map<String, dynamic>> _transactions = [
    {
      'title': 'Salary from TechCorp',
      'date': 'Today, 9:30 AM',
      'amount': '+\$2450.00',
      'isIncoming': true,
    },
    {
      'title': 'Netflix Subscription',
      'date': 'Yesterday, 2:15 PM',
      'amount': '-\$15.99',
      'isIncoming': false,
    },
    {
      'title': 'Amazon Purchase',
      'date': 'Yesterday, 11:30 AM',
      'amount': '-\$49.99',
      'isIncoming': false,
    },
    {
      'title': 'Client Payment',
      'date': 'Jan 15, 4:20 PM',
      'amount': '+\$850.00',
      'isIncoming': true,
    },
    {
      'title': 'Uber Ride',
      'date': 'Jan 15, 2:45 PM',
      'amount': '-\$24.50',
      'isIncoming': false,
    },
    {
      'title': 'Starbucks Coffee',
      'date': 'Jan 14, 9:15 AM',
      'amount': '-\$5.75',
      'isIncoming': false,
    },
    {
      'title': 'Freelance Project',
      'date': 'Jan 14, 8:30 AM',
      'amount': '+\$1200.00',
      'isIncoming': true,
    },
    {
      'title': 'Gym Membership',
      'date': 'Jan 13, 7:00 PM',
      'amount': '-\$79.99',
      'isIncoming': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Color(0xFF0D192B),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: Text(
          'Transaction History',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search transactions',
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                prefixIcon:
                    Icon(Icons.search, color: Colors.grey[400], size: 20),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Container(
            height: 45,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: _filters
                  .map(
                    (filter) => _filterChip(filter),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 8),
              itemCount: _transactions.length,
              itemBuilder: (context, index) {
                final transaction = _transactions[index];
                return _transactionItem(transaction);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterChip(String filter) {
    final isSelected = _selectedFilter == filter;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedFilter = filter;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF166FE5) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            filter,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[600],
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _transactionItem(Map<String, dynamic> transaction) {
    final Color amountColor =
        transaction['isIncoming'] ? Color(0xFF4CAF50) : Color(0xFFE53935);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[100],
            ),
            child: Icon(
              transaction['isIncoming']
                  ? Icons.arrow_downward
                  : Icons.arrow_upward,
              size: 16,
              color: transaction['isIncoming']
                  ? Color(0xFF4CAF50)
                  : Color(0xFFE53935),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  transaction['date'],
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Text(
            transaction['amount'],
            style: TextStyle(
              color: amountColor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
