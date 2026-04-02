import 'package:flutter/material.dart';

class ManageJobsPage extends StatefulWidget {
  const ManageJobsPage({super.key});

  @override
  State<ManageJobsPage> createState() => _ManageJobsPageState();
}

class _ManageJobsPageState extends State<ManageJobsPage> {
  int selectedTab = 0;

  final List<String> tabs = ['Active (12)', 'Closed (4)', 'Drafts (2)'];

  final List<Map<String, dynamic>> jobList = [
    {
      "icon": Icons.work_outline,
      "title": 'Senior UI Designer',
      "status": 'Active',
      "applicants": '23 Applicants',
      "statusColor": 0xFF4CAF50,
      "isClosed": false,
    },
    {
      "icon": Icons.business_center_outlined,
      "title": 'Fullstack Engineer\n(React/Node)',
      "status": 'Active',
      "applicants": '86 Applicants',
      "statusColor": 0xFF4CAF50,
      "isClosed": false,
    },
    {
      "icon": Icons.code,
      "title": 'Product Marketing\nManager',
      "status": 'Active',
      "applicants": '12 Applicants',
      "statusColor": 0xFF4CAF50,
      "isClosed": false,
    },
    {
      "icon": Icons.campaign_outlined,
      "title": 'Data Analyst',
      "status": 'Closed',
      "applicants": '142 Applicants',
      "statusColor": 0xFF888888,
      "isClosed": true,
    },
  ];

  final List<Map<String, dynamic>> engagementList = [
    {
      "label": 'Total Views',
      "value": '12.4k',
      "sub": '+12% from last week',
      "subColor": 0xFF4CAF50,
    },
    {
      "label": 'Conversion Rate',
      "value": '4.2%',
      "sub": 'Industry avg. 5%',
      "subColor": 0xFF1132D2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101532),
      appBar: AppBar(
        backgroundColor: Color(0xFF101532),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFFEFF3F7), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Manage Jobs',
          style: TextStyle(
            color: Color(0xFFEFF3F7),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: Color(0xFF1132D3),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: Colors.white, size: 22),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            //tab bar
            Row(
              children: List.generate(tabs.length, (index) {
                final bool isSelected = selectedTab == index;
                return GestureDetector(
                  onTap: () => setState(() => selectedTab = index),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tabs[index],
                          style: TextStyle(
                            color: isSelected
                                ? Color(0xFF1132D3)
                                : Color(0xFF93A2B7),
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
                            width: 44,
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

            const SizedBox(height: 16),

            //job list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: jobList.length,
              itemBuilder: (context, index) {
                final job = jobList[index];
                return _JobCard(job: job);
              },
            ),

            const SizedBox(height: 24),

            //engagement summary title
            Text(
              'ENGAGEMENT SUMMARY',
              style: TextStyle(
                color: Color(0xFF93A2B7),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 12),

            //engagement card
            Row(
              children: List.generate(engagementList.length, (index) {
                final item = engagementList[index];
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right: index == 0 ? 10 : 0),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFF191E39),
                      border: Border.all(color: const Color(0xFF3E4059), width: 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['label'],
                          style: TextStyle(
                            color: Color(0xFF93A2B7),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['value'],
                          style: TextStyle(
                            color: Color(0xFFEFF3F7),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['sub'],
                          style: TextStyle(
                            color: Color(item['subColor']),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

//job card widget
class _JobCard extends StatelessWidget {
  final Map<String, dynamic> job;
  const _JobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Color(0xFF191E39),
        border: Border.all(color: const Color(0xFF3E4059), width: 1),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          //Icon Box
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Color(0xFF19233E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                job['icon'],
                color: Color(0xFF1132D2),
                size: 24,
              ),
            ),
          ),

          const SizedBox(width: 12),

          //Title + Status
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job['title'],
                  style: TextStyle(
                    color: Color(0xFFEFF3F7),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        color: Color(job['statusColor']),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${job['status']} • ${job['applicants']}',
                      style: TextStyle(
                        color: Color(0xFF93A2B7),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Icons
          Row(
            children: [
              //Edit Icon(hidden for closed jobs)
              if (!job['isClosed'])
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Icon(
                      Icons.edit_outlined,
                      color: Color(0xFF93A2B7),
                      size: 18,
                    ),
                  ),
                ),

              // Refresh Icon (only for closed jobs)
              if (job['isClosed'])
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Icon(
                      Icons.refresh,
                      color: Color(0xFF93A2B7),
                      size: 18,
                    ),
                  ),
                ),

              //Delete Icon
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.delete_outline,
                  color: Color(0xFF93A2B7),
                  size: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}