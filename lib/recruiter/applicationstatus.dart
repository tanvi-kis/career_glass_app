import 'package:flutter/material.dart';

class ApplicationStatusPage extends StatefulWidget {
  const ApplicationStatusPage({super.key});

  @override
  State<ApplicationStatusPage> createState() => _ApplicationStatusPageState();
}

class _ApplicationStatusPageState extends State<ApplicationStatusPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  final List<Map<String, dynamic>> timelineSteps = [
    {
      'icon': Icons.check,
      'iconBg': 0xFF1132D3,
      'title': 'Applied',
      'date': 'Oct 12, 2023 • 09:45 AM',
      'description': 'Resume and portfolio successfully submitted.',
      'completed': true,
      'hasExtra': false,
    },
    {
      'icon': Icons.remove_red_eye_outlined,
      'iconBg': 0xFF1132D3,
      'title': 'Under Review',
      'date': 'Oct 14, 2023 • 02:00 PM',
      'description': 'Hiring manager is reviewing your profile.',
      'completed': true,
      'hasExtra': false,
    },
    {
      'icon': Icons.calendar_today_outlined,
      'iconBg': 0xFF1132D3,
      'title': 'Interview Scheduled',
      'date': 'Tomorrow at 10:00 AM',
      'description': null,
      'completed': true,
      'hasExtra': true,
    },
    {
      'icon': Icons.workspace_premium_outlined,
      'iconBg': 0xFF232840,
      'title': 'Final Offer',
      'date': null,
      'description': 'Pending completion of interview stages',
      'completed': false,
      'hasExtra': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _progressAnimation = Tween<double>(begin: 0, end: 0.75).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeOut),
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      _progressController.forward();
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101532),
      appBar: AppBar(
        backgroundColor: const Color(0xFF101532),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Color(0xFFEFF3F7), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Application Status',
          style: TextStyle(
            color: Color(0xFFEFF3F7),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFFEFF3F7)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            //Job Header Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF191E39),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF3E4059), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'IN REVIEW',
                    style: TextStyle(
                      color: Color(0xFF1132D3),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const Text(
                    'Senior UX Engineer',
                    style: TextStyle(
                      color: Color(0xFFEFF3F7),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    'Design Systems & Frameworks',
                    style: TextStyle(color: Color(0xFF93A2B7), fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                        height: 30,
                        width: 30,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset('assets/images/appstatus.jpg',height: 10,width: 10,)

                    ),
                    const SizedBox(width: 8),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CareerGlass Inc.',
                          style: TextStyle(
                            color: Color(0xFFEFF3F7),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'San Francisco, CA (Remote)',
                          style: TextStyle(
                              color: Color(0xFF93A2B7), fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      SizedBox(
                        width: 140,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.description_outlined,
                              size: 14, color: Colors.white),
                          label: const Text(
                            'Job Description',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1132D3),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            elevation: 0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 140,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.mail_outline,
                              size: 14, color: Color(0xFFEFF3F7)),
                          label: const Text(
                            'Contact HR',
                            style: TextStyle(
                                color: Color(0xFFEFF3F7),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: Color(0xFF1132D3), width: 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Timeline',
              style: TextStyle(
                color: Color(0xFFEFF3F7),
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 16),

            //Timeline — static
            ...List.generate(timelineSteps.length, (index) {
              final step = timelineSteps[index];
              final bool isLast = index == timelineSteps.length - 1;
              final bool completed = step['completed'] as bool;

              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Icon + vertical line
                    SizedBox(
                      width: 36,
                      child: Column(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Color(step['iconBg'] as int),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              step['icon'] as IconData,
                              color: completed
                                  ? Colors.white
                                  : const Color(0xFF6A7588),
                              size: 18,
                            ),
                          ),
                          if (!isLast)
                            Expanded(
                              child: Container(
                                width: 2,
                                margin:
                                const EdgeInsets.symmetric(vertical: 3),
                                decoration: BoxDecoration(
                                  color: completed
                                      ? const Color(0xFF1132D3)
                                      : const Color(0xFF2C3154),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    //Content
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 6),
                            Text(
                              step['title'] as String,
                              style: TextStyle(
                                color: completed
                                    ? const Color(0xFFEFF3F7)
                                    : const Color(0xFF6A7588),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (step['date'] != null) ...[
                              const SizedBox(height: 2),
                              Text(
                                step['date'] as String,
                                style: const TextStyle(
                                  color: Color(0xFF93A2B7),
                                  fontSize: 12,
                                ),
                              ),
                            ],

                            if (step['description'] != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                step['description'] as String,
                                style: const TextStyle(
                                  color: Color(0xFF93A2B7),
                                  fontSize: 12,
                                ),
                              ),
                            ],

                            if (step['hasExtra'] == true) ...[
                              const SizedBox(height: 10),
                              const _InterviewCard(),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 8),

            //Application Health
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF191E39),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF3E4059), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Application Health',
                    style: TextStyle(
                      color: Color(0xFFEFF3F7),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 14),

                  //Gradient progress bar
                  AnimatedBuilder(
                    animation: _progressAnimation,
                    builder: (context, _) {
                      return Stack(
                        children: [

                          Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2C3154),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          //Gradient fill on top
                          FractionallySizedBox(
                            widthFactor: _progressAnimation.value,
                            child: Container(
                              height: 6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF1732D4),
                                    Color(0xFF6F39E9),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '75% complete',
                        style: TextStyle(
                            color: Color(0xFF93A2B7), fontSize: 12),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),

                        child: const Text(
                          'Strong Match',
                          style: TextStyle(
                            color: Color(0xFF1132D3),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _InterviewCard extends StatelessWidget {
  const _InterviewCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F3A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF3E4059), width: 1),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Left blue border
            Container(
              width: 3, // thinner line
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF1132D3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),  // match parent
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),

            //Card
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1C2247),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(Icons.video_call_outlined,
                              color: Color(0xFF1132D3), size: 20),
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Technical Interview',
                              style: TextStyle(
                                color: Color(0xFFEFF3F7),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'With Sarah Jenkins (Lead Designer)',
                              style: TextStyle(
                                  color: Color(0xFF93A2B7), fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Add to Calendar',
                          style: TextStyle(
                            color: Color(0xFF1132D3),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF1132D3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}