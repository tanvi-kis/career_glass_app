import 'package:flutter/material.dart';

class TrendingTile extends StatelessWidget {
  final Color logoBg;
  final Widget logoWidget;
  final String title, company, time, salary, salaryLabel;
  final Color salaryColor;

  const TrendingTile({
    super.key,
    required this.logoBg,
    required this.logoWidget,
    required this.title,
    required this.company,
    required this.time,
    required this.salary,
    required this.salaryLabel,
    required this.salaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF191E39),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF3E4059), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: logoBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: logoWidget,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '$company • $time',
                  style: const TextStyle(
                    color: Color(0xFF4A5E90),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                salary,
                style: TextStyle(
                  color: salaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                salaryLabel,
                style: const TextStyle(color: Color(0xFF4A5E90), fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
