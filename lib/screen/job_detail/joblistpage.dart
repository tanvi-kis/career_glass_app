import 'package:flutter/material.dart';


class Job {
  final String title;
  final String company;
  final String location;
  final String salaryRange;
  final String jobType;
  final Color iconBg;
  final IconData icon;
  bool isBookmarked;

  Job({
    required this.title,
    required this.company,
    required this.location,
    required this.salaryRange,
    required this.jobType,
    required this.iconBg,
    required this.icon,
    this.isBookmarked = false,
  });
}

class JobListingPage extends StatefulWidget {
  const JobListingPage({super.key});

  @override
  State<JobListingPage> createState() => _JobListingPageState();
}

class _JobListingPageState extends State<JobListingPage> {
  int _selectedTab = 0;

  final List<Job> _jobs = [
    Job(
      title: 'Senior Product Designer',
      company: 'Lumina Digital',
      location: 'San Francisco, CA',
      salaryRange: '\$140k – \$180k',
      jobType: 'Full-time',
      iconBg: const Color(0xFF1E3A5F),
      icon: Icons.brush_outlined,
    ),
    Job(
      title: 'Lead UX Researcher',
      company: 'Quantum Labs',
      location: 'Remote',
      salaryRange: '\$120k – \$155k',
      jobType: 'Contract',
      iconBg: const Color(0xFF1A3A2A),
      icon: Icons.search_outlined,
    ),
    Job(
      title: 'Senior Frontend Engineer',
      company: 'Nebula Core',
      location: 'New York, NY',
      salaryRange: '\$160k – \$210k',
      jobType: 'Full-time',
      iconBg: const Color(0xFF2A1A3A),
      icon: Icons.code_outlined,
    ),
    Job(
      title: 'UI/UX Designer',
      company: 'Stellar Flow',
      location: 'Austin, TX',
      salaryRange: '\$95k – \$130k',
      jobType: 'Full-time',
      iconBg: const Color(0xFF1A2A3A),
      icon: Icons.design_services_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            _buildFilterRow(),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                itemCount: _jobs.length,
                itemBuilder: (context, index) {
                  return _buildJobCard(_jobs[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF4F8EF7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.work_outline,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'CareerGlass',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF161B22),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF2A2F3A), width: 1),
            ),
            child: const Icon(
              Icons.search,
              color: Color(0xFF8B9099),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        children: [
          _buildFilterChip('Location'),
          const SizedBox(width: 8),
          _buildFilterChip('Salary'),
          const SizedBox(width: 8),
          _buildFilterChip('Experience'),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF2A2F3A), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFB0B7C3),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF8B9099),
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard(Job job) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF161B22),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF21262D), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Company icon
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: job.iconBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(job.icon, color: const Color(0xFF4F8EF7), size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${job.company} • ${job.location}',
                        style: const TextStyle(
                          color: Color(0xFF8B9099),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),


                ///job saved icon=====================================
                GestureDetector(
                  onTap: () {
                    setState(() {
                      job.isBookmarked = !job.isBookmarked;
                    });
                  },
                  child: Icon(
                    job.isBookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_border_outlined,
                    color: job.isBookmarked
                        ? const Color(0xFF4F8EF7)
                        : const Color(0xFF8B9099),
                    size: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Text(
                  job.salaryRange,
                  style: const TextStyle(
                    color: Color(0xFF4F8EF7),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                _buildJobTypeBadge(job.jobType),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobTypeBadge(String type) {
    final bool isContract = type == 'Contract';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: isContract
            ? const Color(0xFF1A2A1A)
            : const Color(0xFF1A1F2E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isContract
              ? const Color(0xFF2A4A2A)
              : const Color(0xFF2A3A5A),
          width: 1,
        ),
      ),
      child: Text(
        type,
        style: TextStyle(
          color: isContract
              ? const Color(0xFF4CAF82)
              : const Color(0xFF4F8EF7),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    final tabs = [
      {'icon': Icons.work_outline, 'label': 'Jobs'},
      {'icon': Icons.chat_bubble_outline, 'label': 'Messages'},
      {'icon': Icons.check_circle_outline, 'label': 'Applied'},
      {'icon': Icons.person_outline, 'label': 'Profile'},
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF161B22),
        border: Border(top: BorderSide(color: Color(0xFF21262D), width: 1)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(tabs.length, (index) {
              final isSelected = _selectedTab == index;
              return GestureDetector(
                onTap: () => setState(() => _selectedTab = index),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        tabs[index]['icon'] as IconData,
                        color: isSelected
                            ? const Color(0xFF4F8EF7)
                            : const Color(0xFF8B9099),
                        size: 24,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        tabs[index]['label'] as String,
                        style: TextStyle(
                          color: isSelected
                              ? const Color(0xFF4F8EF7)
                              : const Color(0xFF8B9099),
                          fontSize: 11,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}