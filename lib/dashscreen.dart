import 'package:flutter/material.dart';

// ── Main Screen ─────────────────────────────────────────────────────────────
class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {

  int _selectedCategory = 0;
  int _selectedNavIndex = 0; // ── Active nav index ──

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
      appBar: _CustomAppBar(),
      bottomNavigationBar: const _BottomNav(),
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
                    _RecommendedCard(
                      logoLetter: 'G',
                      title: 'Senior Product\nDesigner',
                      company: 'Google Inc.',
                      location: 'Mountain View',
                      salary: '\$165 - \$310k',
                      tags: ['Full-time', 'Remote'],
                    ),
                    SizedBox(width: 14),
                    _RecommendedCard(
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

              // ── Airbnb ───────────────────────────────────────────────────
              _TrendingTile(
                logoBg: const Color(0xFF1A2035),
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
                    'assets/images/t3.png',
                    fit: BoxFit.contain,
                  ),
                ),
                title: 'Visual Designer',
                company: 'Airbnb',
                time: '2 hours ago',
                salary: '\$120k',
                salaryLabel: 'Global',
                salaryColor: const Color(0xFF1132D3),
              ),
              const SizedBox(height: 20),

              // ── Slack ────────────────────────────────────────────────────
              _TrendingTile(
                logoBg: const Color(0xFF1A2035),
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
                    'assets/images/t3.png',
                    fit: BoxFit.contain,
                  ),
                ),
                title: 'Visual Designer',
                company: 'Slack',
                time: '5 hours ago',
                salary: '\$110k',
                salaryLabel: 'Global',
                salaryColor: const Color(0xFF1132D3),
              ),
              const SizedBox(height: 20),

              // ── Discord ──────────────────────────────────────────────────
              _TrendingTile(
                logoBg: const Color(0xFF1A2035),
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
                    'assets/images/t3.png',
                    fit: BoxFit.contain,
                  ),
                ),
                title: 'Visual Designer',
                company: 'Discord',
                time: '1 day ago',
                salary: '\$130k',
                salaryLabel: 'Global',
                salaryColor: const Color(0xFF1132D3),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Custom AppBar ─────────────────────────────────────────────────────────────
class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF171A29), Color(0xFF0E1640)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF3E4059),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ── Logo + Title ──────────────────────────────────────────
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0C338E), Color(0xFF4A7BF7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'CG',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'CareerGlass',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              // ── Actions ───────────────────────────────────────────────
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF252840),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Center(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(
                              Icons.notifications_outlined,
                              color: Colors.white70,
                              size: 22,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1132D3),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF2B3B7C),
                          width: 2.5,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile.png',
                          width: 38,
                          height: 38,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: const Color(0xFF252840),
                            child: const Icon(Icons.person,
                                color: Colors.white54, size: 22),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Recommended Card ─────────────────────────────────────────────────────────
class _RecommendedCard extends StatelessWidget {
  final String logoLetter, title, company, location, salary;
  final List<String> tags;

  const _RecommendedCard({
    required this.logoLetter,
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0C338E), Color(0xFF131D4F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF2A4AAF)),
        border: Border.all(color: const Color(0xFF2E2D46)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBFB),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF646F83)),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/t3.png',
                    width: 25,
                    height: 25,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Icon(Icons.bookmark_border,
                  color: Color(0xFF7A90B8), size: 22),
            ],
          ),
          const SizedBox(height: 12),
          Text(title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 4),
          Text('$company • $location',
            style: const TextStyle(color: Color(0xFF4A5E90), fontSize: 11),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              ...tags.map((t) => _tag(t)),
              _tag(salary),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1132D3),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              child: const Text('Apply Now',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
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
        style: const TextStyle(color: Color(0xFFB8C8F0), fontSize: 10),
      ),
    );
  }
}

// ── Trending Tile ─────────────────────────────────────────────────────────────
class _TrendingTile extends StatelessWidget {
  final Color logoBg;
  final Widget logoWidget;
  final String title, company, time, salary, salaryLabel;
  final Color salaryColor;

  const _TrendingTile({
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
        border: Border.all(
          color: const Color(0xFF3E4059),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50, height: 50,
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
                Text(title,
                  style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text('$company • $time',
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
              Text(salary,
                style: TextStyle(
                  color: salaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 5),
              Text(salaryLabel,
                style: const TextStyle(
                  color: Color(0xFF4A5E90),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Bottom Nav ────────────────────────────────────────────────────────────────
class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF171A29), Color(0xFF0E1640)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        border: Border(
          top: BorderSide(
            color: Color(0xFF3E4059),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home_rounded,           'Home',    true),
          _navItem(Icons.work_outline,           'Jobs',    false),
          _navItem(Icons.bookmark_border,        'Saved',   false),
          _navItem(Icons.person_outline_rounded, 'Profile', false),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool active) {
    const Color activeColor   = Color(0xFF1132D3);
    const Color inactiveColor = Color(0xFF3A4E72);

    return SizedBox(
      width: 72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 26,
              color: active ? activeColor : inactiveColor),
          const SizedBox(height: 5),
          Text(label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: active ? FontWeight.w600 : FontWeight.w400,
              color: active ? activeColor : inactiveColor,
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}