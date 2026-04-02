import 'package:flutter/material.dart';

class CandidateReviewPage extends StatefulWidget {
  const CandidateReviewPage({super.key});

  @override
  State<CandidateReviewPage> createState() => _CandidateReviewPageState();
}

class _CandidateReviewPageState extends State<CandidateReviewPage> {
  final List<Map<String, dynamic>> skills = [
    {'label': 'User Experience (UX) Design', 'percent': 0.95},
    {'label': 'Visual Design & Branding', 'percent': 0.88},
    {'label': 'Figma & Design Systems', 'percent': 0.98},
    {'label': 'React & Frontend Dev', 'percent': 0.72},
  ];

  final List<Map<String, dynamic>> experiences = [
    {
      'year': '2020 - Present',
      'title': 'Senior Lead Designer',
      'company': 'Global Bank Corp • Full-time',
      'description':
      'Directed the redesign of the core banking mobile application, leading a team of 6 designers and achieving 200% increase in user engagement and reducing drop-off by 40%.',
    },
    {
      'year': '2017 - 2020',
      'title': 'Product Designer',
      'company': 'TechFlow Solutions • Full-time',
      'description':
      'Focused on user research and led 4 cross-functional product teams. Established the foundation for a design system used across 500+ developers.',
    },
  ];

  final List<Map<String, dynamic>> portfolio = [
    {
      'title': 'FinTech Dashboard',
      'color': 0xFF1B2A6B,
      'image': 'assets/images/portfolio.png',
    },
    {
      'title': 'HealthTrack Mobile App',
      'color': 0xFF0D4A3A,
      'image': 'assets/images/mobileapp.png',
    },
  ];

  final List<Map<String, dynamic>> certifications = [
    {
      'title': 'Google UX Professional',
      'subtitle': 'Issued Jan 2023',
      'icon': Icons.verified_outlined,
    },
    {
      'title': 'HCI Specialist',
      'subtitle': 'NNg Certified',
      'icon': Icons.school_outlined,
    },
  ];


@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101532),
      appBar: AppBar(
        backgroundColor: const Color(0xFF101532),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFFEFF3F7), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Candidate Review',
          style: TextStyle(color: Color(0xFFEFF3F7), fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.bookmark_border, color: Color(0xFFEFF3F7)), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert, color: Color(0xFFEFF3F7)), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            //Profile Header Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF191E39),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF3E4059), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF1E3380), width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'assets/images/candidate.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF2C3154), shape: BoxShape.circle),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text('Marcus Sterling',
                      style: TextStyle(
                          color: Color(0xFFEFF3F7), fontSize: 20, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  const Text('Lead Product Designer • 10+ Years Exp.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF1132D3), fontSize: 12, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        const Icon(Icons.location_on_outlined, color: Color(0xFF6A7588), size: 13),
                        const SizedBox(width: 5),
                        const Text('New York, NY',
                            style: TextStyle(color: Color(0xFF6A7588), fontSize: 12)),
                      ]),
                      const SizedBox(width: 12),
                      Row(children: [
                        const Icon(Icons.mail_outline, color: Color(0xFF6A7588), size: 13),
                        const SizedBox(width: 5),
                        const Text('m.sterling@design.com',
                            style: TextStyle(color: Color(0xFF6A7588), fontSize: 12)),
                      ]),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Icon(Icons.language_outlined, color: Color(0xFF6A7588), size: 13),
                    const SizedBox(width: 5),
                    const Text('marcus-design.io',
                        style: TextStyle(color: Color(0xFF6A7588), fontSize: 12)),
                  ]),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.message_outlined, size: 15, color: Colors.white),
                      label: const Text('Message Candidate',
                          style: TextStyle(
                              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1132D3),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF3E4059), width: 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('Download CV',
                          style: TextStyle(
                              color: Color(0xFFEFF3F7),
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 130,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1F3A),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFF1E3380), width: 1),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('MATCH SCORE',
                            style: TextStyle(
                                color: Color(0xFF93A2B7),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1)),
                        SizedBox(height: 4),
                        Text('94%',
                            style: TextStyle(
                                color: Color(0xFF1132D3),
                                fontSize: 28,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 130,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1F3A),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFF1E3380), width: 1),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AVAILABILITY',
                            style: TextStyle(
                                color: Color(0xFF6A7588),
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        Text('2 Weeks',
                            style: TextStyle(
                                color: Color(0xFFEFF3F7),
                                fontSize: 15,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            //About Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF191E39),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF3E4059), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: const Color(0xFF1A1F3A),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.description_outlined,
                          color: Color(0xFF1132D3), size: 22),
                    ),
                    const SizedBox(width: 10),
                    const Text('About Marcus',
                        style: TextStyle(
                            color: Color(0xFFEFF3F7),
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ]),
                  const SizedBox(height: 12),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8, right: 8, left: 8),
                    child: Text(
                      'Visionary Product Designer with a decade of experience in building scalable design systems for Fortune 500 companies. Specialized in bridging the gap between complex engineering requirements and intuitive user interfaces. Proven track record of leading design teams and delivering high-impact products in the FinTech and AI sectors.',
                      style: TextStyle(color: Color(0xFFCBD5E1), fontSize: 13, height: 1.6),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            //Expertise & Skills Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF191E39),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF3E4059), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: const Color(0xFF1A1F3A),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.description_outlined,
                          color: Color(0xFF1132D3), size: 22),
                    ),
                    const SizedBox(width: 10),
                    const Text('Expertise & Skills',
                        style: TextStyle(
                            color: Color(0xFFEFF3F7),
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ]),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
                    child: Column(
                      children: skills.map((skill) {
                        final double percent = skill['percent'] as double;
                        final int percentInt = (percent * 100).round();
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(skill['label'] as String,
                                      style: const TextStyle(
                                          color: Color(0xFFEFF3F7),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                  Text('$percentInt%',
                                      style: const TextStyle(
                                          color: Color(0xFF1132D3),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: LinearProgressIndicator(
                                  value: percent,
                                  minHeight: 6,
                                  backgroundColor: const Color(0xFF1A1F3A),
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                      Color(0xFF1132D3)),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            //Experience Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF191E39),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF3E4059), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: const Color(0xFF1A1F3A),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.description_outlined,
                          color: Color(0xFF1132D3), size: 22),
                    ),
                    const SizedBox(width: 10),
                    const Text('Experience',
                        style: TextStyle(
                            color: Color(0xFFEFF3F7),
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ]),
                  const SizedBox(height: 12),
                  Column(
                    children: List.generate(experiences.length, (index) {
                      final exp = experiences[index];
                      final bool isLast = index == experiences.length - 1;
                      return IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 5),
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF1132D3), shape: BoxShape.circle),
                                ),
                                const SizedBox(height: 5),
                                Expanded(
                                  child: Container(
                                    width: 2,
                                    color: const Color(0xFF253997).withOpacity(0.3),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(exp['year'] as String,
                                      style: const TextStyle(
                                          color: Color(0xFF64738A),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 2),
                                  Text(exp['title'] as String,
                                      style: const TextStyle(
                                          color: Color(0xFFEFF3F7),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 2),
                                  Text(exp['company'] as String,
                                      style: const TextStyle(
                                          color: Color(0xFF93A2B7), fontSize: 12)),
                                  const SizedBox(height: 6),
                                  Text(exp['description'] as String,
                                      style: const TextStyle(
                                          color: Color(0xFFCAD4E0),
                                          fontSize: 12,
                                          height: 1.5)),
                                  SizedBox(height: isLast ? 0 : 14),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            //Portfolio Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF191E39),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF3E4059), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [

                    const SizedBox(width: 5),
                    const Text('Portfolio',
                        style: TextStyle(
                            color: Color(0xFFEFF3F7),
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ]),
                  const SizedBox(height: 14),
                  Column(
                    children: portfolio.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Stack(
                            children: [
                              //Background Image
                              Image.network(
                                item['image'] as String,
                                height: 160,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      height: 140,
                                      color: Color(item['color'] as int),
                                    ),
                              ),

                              //Dark gradient overlay
                              Container(
                                height: 160,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.75),
                                    ],
                                  ),
                                ),
                              ),

                              //Text bottom-left
                              Positioned(
                                bottom: 12,
                                left: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'] as String,
                                      style: const TextStyle(
                                        color: Color(0xFFEFF3F7),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 2),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('View All 12 Projects',
                          style: TextStyle(
                              color: Color(0xFF1132D3),
                              fontSize: 13,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            //Certifications Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF191E39),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF3E4059), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const SizedBox(width: 5),
                    const Text('Certifications',//verified_outlined
                        style: TextStyle(
                            color: Color(0xFFEFF3F7),
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ]),
                  const SizedBox(height: 14),

                  Column(
                    children: List.generate(certifications.length, (index) {
                      final cert = certifications[index];
                      final bool isLast = index == certifications.length - 1;
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF111630),
                                  // border: Border.all(
                                  //     color: const Color(0xFF1E3380), width: 1),
                                   borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(cert['icon'] as IconData, color: const Color(0xFF1132D3), size: 18),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cert['title'] as String,
                                      style: const TextStyle(
                                          color: Color(0xFFEFF3F7),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 2),
                                  Text(cert['subtitle'] as String,
                                      style: const TextStyle(
                                          color: Color(0xFF6A7588), fontSize: 11)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10,)
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            //Education Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF191E39),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF3E4059), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const SizedBox(width: 5),
                    const Text('Education',
                        style: TextStyle(
                            color: Color(0xFFEFF3F7),
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ]),
                  const SizedBox(height: 14),
                  Row(
                    children: [

                      const SizedBox(width: 5),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('BFA in Communication Design',
                              style: TextStyle(
                                  color: Color(0xFFEFF3F7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 2),
                          Text('Pratt Institute, NY',
                              style:
                              TextStyle(color: Color(0xFF828FA4), fontSize: 14)),
                          SizedBox(height: 2),
                          Text('Class of 2014',
                              style: TextStyle(
                                  color: Color(0xFF1132D3), fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            //Share Profile Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined,
                    color: Color(0xFF1132D3), size: 18),
                label: const Text('Share Profile',
                    style: TextStyle(
                        color: Color(0xFF1132D3),
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF1A1F3A), width: 1),
                  backgroundColor: const Color(0xFF1A1F3A),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Reject Candidate Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.not_interested,
                    color: Color(0xFFED4444), size: 18),
                label: const Text('Reject Candidate',
                    style: TextStyle(
                        color: Color(0xFFED4444),
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF22131E), width: 1),
                  backgroundColor: const Color(0xFF22131E),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}