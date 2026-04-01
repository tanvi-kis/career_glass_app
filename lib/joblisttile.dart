import 'package:flutter/material.dart';

import '../model/job_model.dart';

class JobListTile extends StatelessWidget {
  final JobModel job;
  final VoidCallback? onTap;

  const JobListTile({super.key, required this.job, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF191E39),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF3E4059), width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT: Logo
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: const Color(0xFF191E39),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF3E4059)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      job.logoPath,
                      height: 10,
                      width: 10,
                      errorBuilder: (_, __, ___) => Center(
                        child: Text(
                          job.company[0],
                          style: const TextStyle(
                            color: Color(0xFF4A7BF7),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // RIGHT: ALL CONTENT
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top row (title + bookmark)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              job.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.bookmark_border,
                            color: Color(0xFF7A90B8),
                            size: 22,
                          ),
                        ],
                      ),

                      const SizedBox(height: 4),

                      // Company + Location
                      Text(
                        '${job.company} • ${job.location}',
                        style: const TextStyle(
                          color: Color(0xFF4A5E90),
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Bottom row (salary + apply)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            job.salary,
                            style: const TextStyle(
                              color: Color(0xFF1132D3),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1132D3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Apply Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}