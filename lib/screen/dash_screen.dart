import 'package:flutter/material.dart';
import '../model/app_data.dart';
import '../widget/appbar.dart';
import 'jobdetails_screen.dart';

// ── Dash Screen ───────────────────────────────────────────────────────────────
class DashScreen extends StatefulWidget {
  final ValueChanged<int> onNavTap;
  final int selectedNavIndex;

  const DashScreen({
    super.key,
    required this.onNavTap,
    required this.selectedNavIndex,
  });

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  int _selectedCategory = 0;

  final List<String> _categories = [
    'Design',
    'Development',
    'Management',
    'Finance',
  ];

  final List<IconData> _categoryIcons = [
    Icons.brush_outlined,
    Icons.code_rounded,
    Icons.manage_accounts,
    Icons.work,
  ];

  @override
  Widget build(BuildContext context) {
    final jobs = AppData.jobs;

    return Scaffold(
      backgroundColor: const Color(0xFF101532),
      appBar: CareerGlassAppBar(),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // ── Greeting ──────────────────────────────────────────────────
              const Text(
                'Hello, Alex! 👋',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Your dream job is just a search away.',
                style: TextStyle(color: Color(0xFF7A90B8), fontSize: 13),
              ),

              const SizedBox(height: 20),

              // ── Search Bar ────────────────────────────────────────────────
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBFB),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: const Color(0xFF2A3F80)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Color(0xFF7A90B8), size: 20),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'UI Designer, Google, Remote...',
                        style: TextStyle(color: Color(0xFF7A90B8), fontSize: 13),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1132D3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Filters',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Categories ────────────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Categories',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(color: Color(0xFF4A7BF7), fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 42,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final bool selected = _selectedCategory == index;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedCategory = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: selected ? const Color(0xFF2934D8) : const Color(0xFF191E39),
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: selected ? Colors.transparent : const Color(0xFF3E4059),
                            width: 1.2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              _categoryIcons[index],
                              size: 16,
                              color: selected ? Colors.white : const Color(0xFF64738A),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              _categories[index],
                              style: TextStyle(
                                color: selected ? Colors.white : const Color(0xFF64738A),
                                fontSize: 13,
                                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // ── Recommended ───────────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recommended for you',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF261C4B),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'PREMIUM ONLY',
                      style: TextStyle(
                        color: Color(0xFF7B3AEC),
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    RecommendedCard(
                      logoLetter: 'G',
                      title: 'Senior Product\nDesigner',
                      company: 'Google Inc.',
                      location: 'Mountain View',
                      salary: '\$165 - \$310k',
                      tags: const ['Full-time', 'Remote'],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => JobDetailsScreen(job: jobs[1]),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    RecommendedCard(
                      logoLetter: 'M',
                      title: 'UX Lead\nDesigner',
                      company: 'Meta Inc.',
                      location: 'New York',
                      salary: '\$140 - \$280k',
                      tags: const ['Hybrid'],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => JobDetailsScreen(job: jobs[2]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Trending Jobs ─────────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Trending Jobs',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Icon(Icons.trending_up_rounded, color: Color(0xFF93A2B7), size: 22),
                ],
              ),
              const SizedBox(height: 14),

              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => JobDetailsScreen(job: jobs[0])),
                ),
                child: TrendingTile(
                  logoBg: const Color(0xFF1A2035),
                  logoWidget: _logoBox('assets/images/t1.png', Icons.design_services),
                  title: 'Visual Designer',
                  company: 'Airbnb',
                  time: '2 hours ago',
                  salary: '\$120k',
                  salaryLabel: 'Global',
                  salaryColor: const Color(0xFF1132D3),
                ),
              ),
              const SizedBox(height: 20),

              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => JobDetailsScreen(job: jobs[1])),
                ),
                child: TrendingTile(
                  logoBg: const Color(0xFF1A2035),
                  logoWidget: _logoBox('assets/images/t2.png', Icons.brush),
                  title: 'Design Lead',
                  company: 'Slack',
                  time: '5 hours ago',
                  salary: '\$210k',
                  salaryLabel: 'San Francisco',
                  salaryColor: const Color(0xFF1132D3),
                ),
              ),
              const SizedBox(height: 20),

              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => JobDetailsScreen(job: jobs[2])),
                ),
                child: TrendingTile(
                  logoBg: const Color(0xFF1A2035),
                  logoWidget: _logoBox('assets/images/t3.png', Icons.people),
                  title: 'Community Manager',
                  company: 'Discord',
                  time: '1 day ago',
                  salary: '\$85k',
                  salaryLabel: 'Remote',
                  salaryColor: const Color(0xFF1132D3),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logoBox(String assetPath, IconData fallback) {
    return Container(
      width: 20,
      height: 20,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF32425E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF646F83)),
      ),
      child: Image.asset(
        assetPath,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) =>
            Icon(fallback, color: Colors.white54, size: 14),
      ),
    );
  }
}

// ── Recommended Card (shared) ─────────────────────────────────────────────────
class RecommendedCard extends StatelessWidget {
  final String logoLetter, title, company, location, salary;
  final List<String> tags;
  final VoidCallback? onTap;

  const RecommendedCard({
    super.key,
    required this.logoLetter,
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.tags,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF121639), Color(0xFF151531)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF2E2D46)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  Logo Box
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFBFB),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF646F83)),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/r1.png',
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Text(
                        logoLetter,
                        style: const TextStyle(
                          color: Color(0xFF1132D3),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Title + Company
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$company • $location',
                        style: const TextStyle(
                          color: Color(0xFF9AAACF),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                // Bookmark Icon
                const Icon(
                  Icons.bookmark_border,
                  color: Color(0xFF7A90B8),
                  size: 22,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [...tags.map((t) => _tag(t)), _tag(salary)],
            ),
            SizedBox(height: 15,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1132D3),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                child: const Text(
                  'Apply Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2B6B),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label,
          style: const TextStyle(color: Color(0xFFB8C8F0), fontSize: 10)),
    );
  }
}

// ── Trending Tile (shared) ────────────────────────────────────────────────────
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
        border: Border.all(color: const Color(0xFF3E4059), width: 0.5),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: logoBg,
              borderRadius: BorderRadius.circular(8),
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
                Text(title,
                    style: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
                const SizedBox(height: 5),
                Text('$company • $time',
                    style: const TextStyle(
                        color: Color(0xFF4A5E90), fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(salary,
                  style: TextStyle(
                      color: salaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              const SizedBox(height: 5),
              Text(salaryLabel,
                  style: const TextStyle(
                      color: Color(0xFF4A5E90), fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}
