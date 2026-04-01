import 'dart:ui';

class TrendingJob {
  final String company;
  final String title;
  final String time;
  final String salary;
  final String salaryLabel;
  final Color salaryColor;
  final Color logoBg;
  final String logoPath;

  TrendingJob({
    required this.company,
    required this.title,
    required this.time,
    required this.salary,
    required this.salaryLabel,
    required this.salaryColor,
    required this.logoBg,
    required this.logoPath,
  });
}