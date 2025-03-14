import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2033),
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Account Summary',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: const [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBalanceCard(),
              const SizedBox(height: 16),
              _buildIncomeExpensesCard(),
              const SizedBox(height: 16),
              _buildSpendingCategoryCard(),
              const SizedBox(height: 16),
              _buildSavingsGoalCard(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Total Balance',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '\$24,856.32',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Updated 2 minutes ago',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncomeExpensesCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Income vs. Expenses',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.withOpacity(0.2),
                      strokeWidth: 1,
                      dashArray: [5, 5],
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: Colors.grey.withOpacity(0.2),
                      strokeWidth: 1,
                      dashArray: [5, 5],
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        );
                        String text;
                        switch (value.toInt()) {
                          case 0:
                            text = 'Jul';
                            break;
                          case 1:
                            text = 'Aug';
                            break;
                          case 2:
                            text = 'Sep';
                            break;
                          case 3:
                            text = 'Oct';
                            break;
                          case 4:
                            text = 'Nov';
                            break;
                          case 5:
                            text = 'Dec';
                            break;
                          default:
                            text = '';
                            break;
                        }
                        return Text(text, style: style);
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        );
                        String text;
                        if (value == 0) {
                          text = '0';
                        } else if (value == 1500) {
                          text = '1500';
                        } else if (value == 3000) {
                          text = '3000';
                        } else if (value == 4500) {
                          text = '4500';
                        } else if (value == 6000) {
                          text = '6000';
                        } else {
                          text = '';
                        }
                        return Text(text, style: style);
                      },
                    ),
                  ),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                minX: 0,
                maxX: 5,
                minY: 0,
                maxY: 6000,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 4300),
                      FlSpot(1, 4500),
                      FlSpot(2, 4200),
                      FlSpot(3, 4400),
                      FlSpot(4, 4300),
                      FlSpot(5, 4800),
                    ],
                    isCurved: true,
                    color: Colors.green,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 3,
                          color: Colors.green,
                          strokeWidth: 1,
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(show: false),
                  ),
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 4000),
                      FlSpot(1, 4100),
                      FlSpot(2, 4000),
                      FlSpot(3, 4200),
                      FlSpot(4, 4100),
                      FlSpot(5, 4200),
                    ],
                    isCurved: true,
                    color: Colors.red,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 3,
                          color: Colors.red,
                          strokeWidth: 1,
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem('Income', Colors.green),
              const SizedBox(width: 24),
              _buildLegendItem('Expenses', Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildSpendingCategoryCard() {
    final categories = [
      {
        'name': 'Food & Dining',
        'color': Colors.blue,
        'percentage': 25,
        'amount': '\$1250'
      },
      {
        'name': 'Transportation',
        'color': Colors.red,
        'percentage': 20,
        'amount': '\$1000'
      },
      {
        'name': 'Shopping',
        'color': Colors.red.shade600,
        'percentage': 15,
        'amount': '\$750'
      },
      {
        'name': 'Bills',
        'color': Colors.amber,
        'percentage': 25,
        'amount': '\$1250'
      },
      {
        'name': 'Entertainment',
        'color': Colors.purple,
        'percentage': 15,
        'amount': '\$750'
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Spending by Category',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 4,
                      centerSpaceRadius: 40,
                      sections: [
                        PieChartSectionData(
                          color: Colors.blue,
                          value: 25,
                          title: '',
                          radius: 20,
                        ),
                        PieChartSectionData(
                          color: Colors.red,
                          value: 20,
                          title: '',
                          radius: 20,
                        ),
                        PieChartSectionData(
                          color: Colors.red.shade600,
                          value: 15,
                          title: '',
                          radius: 20,
                        ),
                        PieChartSectionData(
                          color: Colors.amber,
                          value: 25,
                          title: '',
                          radius: 20,
                        ),
                        PieChartSectionData(
                          color: Colors.purple,
                          value: 15,
                          title: '',
                          radius: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: categories
                        .map((category) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: category['color'] as Color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      category['name'] as String,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${category['percentage']}%',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    category['amount'] as String,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavingsGoalCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Savings Goal Progress',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current: \$7,500',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Goal: \$10,000',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.75,
              backgroundColor: Colors.grey[200],
              color: Colors.blue,
              minHeight: 10,
            ),
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.center,
            child: Text(
              '75% of goal reached',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
