import 'package:flutter/material.dart';

import '../model/app_data.dart';
import '../widget/appbar.dart';
import 'jobdetails_screen.dart';
import 'dashboard/joblisttile.dart';


class JobListScreen extends StatefulWidget {
  final ValueChanged<int> onNavTap;
  final int selectedNavIndex;

  const JobListScreen({
    super.key,
    required this.onNavTap,
    required this.selectedNavIndex,
  });

  @override
  State<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = ['All', 'Remote', 'Full-time', 'Hybrid', 'Onsite'];

  @override
  Widget build(BuildContext context) {
    final jobs = AppData.jobs;

    return Scaffold(
      backgroundColor: const Color(0xFF101532),
      appBar: CareerGlassAppBar(),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // ── Filter Chips ──────────────────────────────────────────────
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filters.length,
                itemBuilder: (context, index) {
                  final bool selected = _selectedFilter == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedFilter = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF2934D8)
                            : const Color(0xFF191E39),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: selected
                              ? Colors.transparent
                              : const Color(0xFF3E4059),
                          width: 1.2,
                        ),
                      ),
                      child: Text(
                        _filters[index],
                        style: TextStyle(
                          color: selected
                              ? Colors.white
                              : const Color(0xFF64738A),
                          fontSize: 13,
                          fontWeight: selected
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // ── Result count ──────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${jobs.length} ',
                      style: const TextStyle(
                        color: Color(0xFF4A7BF7),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: 'Jobs Found',
                      style: TextStyle(
                        color: Color(0xFF7A90B8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ── Job List ──────────────────────────────────────────────────
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: jobs.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final job = jobs[index];
                  return JobListTile(
                    job: job,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => JobDetailsScreen(job: job),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
