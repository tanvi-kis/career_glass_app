import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  int selectedTab = 0;
  int? selectedCard;

  final List<String> tabs = ['All Chats', 'Recruiters', 'Support'];

  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Sarah Jenkins',
      'subtitle': 'Google Cloud Ops',
      'message': '"We\'d love to schedule a follow...',
      'time': '10:24 AM',
      'unread': 2,
      'online': true,
      'image': 'assets/images/msg1.jpg',
      'avatarImage': null,
    },
    {
      'name': 'Marcus Thorne',
      'subtitle': 'Stripe Talent Team',
      'message': 'Your application for Senior Designer...',
      'time': 'Yesterday',
      'unread': 0,
      'online': false,
      'image': 'assets/images/msg2.jpg',
      'avatarImage': null,
    },
    {
      'name': 'Elena Rodriguez',
      'subtitle': 'Vercel Recruitment',
      'message': 'Thanks for the portfolio link, Elena...',
      'time': 'Tuesday',
      'unread': 0,
      'online': false,
      'image': 'assets/images/msg3.jpg',
      'avatarImage': null,
    },
    {
      'name': 'David Chen',
      'subtitle': 'Airbnb Talent',
      'message': 'Hey, just checking in to see if you ha...',
      'time': 'Oct 24',
      'unread': 0,
      'online': false,
      'image': 'assets/images/msg4.jpg',
      'avatarImage': null,
    },
    {
      'name': 'CareerGlass Support',
      'subtitle': 'Platform Assistance',
      'message': 'Your profile verification is now...',
      'time': 'Oct 20',
      'unread': 0,
      'online': false,
      'image': 'assets/images/msg5.jpg',
      'avatarImage': null,
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
          icon: const Icon(Icons.arrow_back_ios,
              color: Color(0xFFEFF3F7), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Messages',
          style: TextStyle(
            color: Color(0xFFEFF3F7),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFFEFF3F7)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFFEFF3F7)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //tab
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                                ? const Color(0xFF1132D3)
                                : const Color(0xFF6A7588),
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
                              color: const Color(0xFF1132D3),
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

          const SizedBox(height: 4),

          //chat list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                final bool isSelected = selectedCard == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard = isSelected ? null : index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(bottom: 6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF1132D3)
                          : const Color(0xFF191E39),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF2244EE)
                            : const Color(0xFF3E4059),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //avatar
                        Stack(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  chat['image'] as String,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                          ],
                        ),

                        const SizedBox(width: 12),

                        //text content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    chat['name'] as String,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : const Color(0xFFEFF3F7),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    chat['time'] as String,
                                    style: TextStyle(
                                      color: isSelected
                                          ? const Color(0xFFB0C4FF)
                                          : const Color(0xFF6A7588),
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                chat['subtitle'] as String,
                                style: TextStyle(
                                  color: isSelected
                                      ? const Color(0xFFC7CDD9)
                                      : const Color(0xFF8B99AF),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                chat['message'] as String,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: isSelected
                                      ? const Color(0xFFC7CDD9)
                                      : const Color(0xFF8B99AF),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),


                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      //fab
      floatingActionButton: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFF1132D3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: IconButton(
          icon: const Icon(Icons.edit_outlined,
              color: Colors.white, size: 22),
          onPressed: () {},
        ),
      ),
    );
  }
}