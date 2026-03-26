import 'dart:ui';
import '../screen/dashboard/widgets/trending_job.dart';

final List<TrendingJob> trendingJobs = [
  TrendingJob(
    company: 'Airbnb',
    title: 'Visual Designer',
    time: '2 hours ago',
    salary: '\$120k',
    salaryLabel: 'Global',
    salaryColor: const Color(0xFF1132D3),
    logoBg: const Color(0xFF1A2035),
    logoPath: 'assets/images/t3.png',
  ),
  TrendingJob(
    company: 'Slack',
    title: 'Visual Designer',
    time: '5 hours ago',
    salary: '\$110k',
    salaryLabel: 'Global',
    salaryColor: const Color(0xFF1132D3),
    logoBg: const Color(0xFF1A2035),
    logoPath: 'assets/images/t3.png',
  ),
  TrendingJob(
    company: 'Discord',
    title: 'Visual Designer',
    time: '1 day ago',
    salary: '\$130k',
    salaryLabel: 'Global',
    salaryColor: const Color(0xFF1132D3),
    logoBg: const Color(0xFF1A2035),
    logoPath: 'assets/images/t3.png',
  ),
];
