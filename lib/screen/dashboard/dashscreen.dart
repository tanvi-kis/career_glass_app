import 'package:career_glass_app/screen/dashboard/widgets/bottom_nav.dart';
import 'package:career_glass_app/screen/dashboard/widgets/custom_app_bar.dart';
import 'package:career_glass_app/screen/dashboard/widgets/recommended_card.dart';
import 'package:career_glass_app/screen/dashboard/widgets/trending_tile.dart';
import 'package:flutter/material.dart';
import '../../data/trending_job.dart';

// ── Main Screen ─────────────────────────────────────────────────────────────
class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {

  int _selectedCategory = 0;

  final List<String> _categories = [
    'Design',
    'Development',
    'Management',
    'Finance'
  ];

  final List<IconData> _categoryIcons = [
    Icons.brush_outlined,
    Icons.code_rounded,
    Icons.manage_accounts,
    Icons.work,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101532),
      appBar: CustomAppBar(),
      bottomNavigationBar: const BottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              // ── Greeting ─────────────────────────────────────────────────
              const Text('Hello, Alex! 👋',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text('Your dream job is just a search away.',
                style: TextStyle(color: Color(0xFF7A90B8), fontSize: 13),
              ),

              const SizedBox(height: 20),

              // ── Search Bar ───────────────────────────────────────────────
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
                      child: Text('UI Designer, Google, Remote...',
                        style: TextStyle(color: Color(0xFF7A90B8), fontSize: 13),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1132D3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Filters',
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

              // ── Categories ───────────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Categories',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Text('See all',
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
                            color: selected
                                ? Colors.transparent
                                : const Color(0xFF3E4059),
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

              // ── Recommended ──────────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Recommended for you',
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
                    child: const Text('PREMIUM ONLY',
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
                height: 222,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    RecommendedCard(
                      logoLetter: 'G',
                      title: 'Senior Product\nDesigner',
                      company: 'Google Inc.',
                      location: 'Mountain View',
                      salary: '\$165 - \$310k',
                      tags: ['Full-time', 'Remote'],
                    ),
                    SizedBox(width: 14),
                    RecommendedCard(
                      logoLetter: 'M',
                      title: 'UX Lead\nDesigner',
                      company: 'Meta Inc.',
                      location: 'New York',
                      salary: '\$140 - \$280k',
                      tags: ['Hybrid'],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Trending Jobs ─────────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Trending Jobs',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Icon(Icons.trending_up_rounded,
                      color: Color(0xFF93A2B7), size: 22),
                ],
              ),
              const SizedBox(height: 14),

              Column(
                children: trendingJobs.map((job) {
                  return Column(
                    children: [
                      TrendingTile(
                        logoBg: job.logoBg,
                        logoWidget: Container(
                          width: 20,
                          height: 20,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF32425E),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFF646F83)),
                          ),
                          child: Image.asset(
                            job.logoPath,
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: job.title,
                        company: job.company,
                        time: job.time,
                        salary: job.salary,
                        salaryLabel: job.salaryLabel,
                        salaryColor: job.salaryColor,
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

