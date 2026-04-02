import 'package:flutter/material.dart';

class ApplicantsPage extends StatefulWidget {
  const ApplicantsPage({super.key});

  @override
  State<ApplicantsPage> createState() => _ApplicantsPageState();
}

class _ApplicantsPageState extends State<ApplicantsPage> {
  int selectedTab = 0;

  final List<String> tabs = ['All (24)', 'Shortlisted', 'Rejected'];

  final List<Map<String, dynamic>> applicantList = [
    {
      "image": 'assets/images/applicantsimg1.jpg',
      "name": 'Alex Rivera',
      "role": 'Senior UI/UX Designer • 5y Exp',
      "tags": ['Figma', 'React', 'Design Systems'],
      "status": 'NEW',
      "statusColor": 0xFF1132D3,
      "appliedTime": '',
    },
    {
      "image": 'assets/images/applicantsimg2.jpg',
      "name": 'Sarah Chen',
      "role": 'Product Designer • 3y Exp',
      "tags": ['Adobe XD', 'Prototyping'],
      "status": 'APPLIED 2D AGO',
      "statusColor": 0xFF888888,
      "appliedTime": 'APPLIED 2D AGO',
    },
    {
      "image": 'assets/images/applicantsimg3.jpg',
      "name": 'Marcus Thorne',
      "role": 'Creative Lead • 8y Exp',
      "tags": ['Branding', 'Strategy'],
      "status": 'APPLIED 6D AGO',
      "statusColor": 0xFF888888,
      "appliedTime": 'APPLIED 6D AGO',
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
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFFEFF3F7), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Applicants',
          style: TextStyle(
            color: Color(0xFFEFF3F7),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Color(0xFFEFF3F7)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          /// Tabbar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: List.generate(tabs.length, (index) {
                final bool isSelected = selectedTab == index;
                return GestureDetector(
                  onTap: () => setState(() => selectedTab = index),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tabs[index],
                          style: TextStyle(
                            color: isSelected
                                ? Color(0xFF102690)
                                : Color(0xFF6A7588),
                            fontSize: 14,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 4),
                        if (isSelected)
                          Container(
                            height: 2,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFF1132D3),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 8),

          //list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: applicantList.length,
              itemBuilder: (context, index) {
                final applicant = applicantList[index];
                return _ApplicantCard(applicant: applicant);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ApplicantCard extends StatelessWidget {
  final Map<String, dynamic> applicant;

  const _ApplicantCard({required this.applicant});

  @override
  Widget build(BuildContext context) {
    final List<String> tags = List<String>.from(applicant['tags']);
    final bool isNew = applicant['status'] == 'NEW';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF191E39),
        border: Border.all(color: const Color(0xFF3E4059), width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  applicant['image'],
                  height: 62,
                  width: 62,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),


              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      applicant['name'],
                      style: TextStyle(
                        color: Color(0xFFEFF3F7),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      applicant['role'],
                      style: TextStyle(
                        color: Color(0xFF93A2B7),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),

                    //tags here
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E293B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              // Status
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isNew
                      ? Color(0xFF161F4B).withOpacity(0.15)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFF1132D3),width: 1)
                ),
                child: Text(
                  applicant['status'],
                  style: TextStyle(
                    color: Color(applicant['statusColor']),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          //Bottom Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.insert_drive_file_outlined,
                      color: Colors.white, size: 16),
                  label: const Text(
                    'Resume',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E293B),
                    side: const BorderSide(color: Color(0xFF1E293B)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:
                    const EdgeInsets.symmetric(vertical: 18),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2D1F2C),
                    border: Border.all(
                        color: const Color(0xFFD63F41), width: 1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.close,
                      color: Colors.red, size: 24),
                ),
              ),

              const SizedBox(width: 10),

              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1132D3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child:
                  const Icon(Icons.check, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}