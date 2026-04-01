import 'package:flutter/material.dart';

class RecommendedCard extends StatelessWidget {
  final String logoLetter, title, company, location, salary;
  final List<String> tags;

  const RecommendedCard({
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