import 'package:flutter/material.dart';

class ScheduleInterviewPage extends StatefulWidget {
  const ScheduleInterviewPage({super.key});

  @override
  State<ScheduleInterviewPage> createState() => _ScheduleInterviewPageState();
}

class _ScheduleInterviewPageState extends State<ScheduleInterviewPage> {
  String selectedType = 'video';
  String selectedDuration = '45 min';
  DateTime currentMonth = DateTime(2023, 11);
  int? selectedDay;

  final List<String> durations = ['30 min', '45 min', '60 min', '90 min'];
  final List<String> weekDays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

  void _prevMonth() => setState(() {
    selectedDay = null;
    currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
  });

  void _nextMonth() => setState(() {
    selectedDay = null;
    currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
  });

  int _daysInMonth(DateTime date) => DateTime(date.year, date.month + 1, 0).day;
  int _firstWeekdayOfMonth(DateTime date) => DateTime(date.year, date.month, 1).weekday % 7;

  String _monthLabel(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Schedule Interview',
                style: TextStyle(
                    color: Color(0xFFEFF3F7), fontSize: 17, fontWeight: FontWeight.w600)),
            Text('Candidate: Alex Rivera',
                style: TextStyle(color: Color(0xFF1132D3), fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.more_vert, color: Color(0xFFEFF3F7)), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),

            /// ── Progress ──
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('STEP 2 OF 3',
                    style: TextStyle(
                        color: Color(0xFFC2C5CC), fontSize: 14, fontWeight: FontWeight.w500)),
                Text('65% Complete',
                    style: TextStyle(
                        color: Color(0xFF1132D3), fontSize: 14, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: 0.65,
                minHeight: 8,
                backgroundColor: const Color(0xFF1A1F3A),
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1132D3)),
              ),
            ),
            const SizedBox(height: 20),

            /// ── Interview Type ──
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF191E39),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF3E4059), width: 1),
              ),
              child: Column(
                children: [

                  Row(
                    children: [
                      const SizedBox(width: 3),
                      const Text('Interview Type',
                          style: TextStyle(
                              color: Color(0xFFEFF3F7),
                              fontSize: 16,
                              fontWeight: FontWeight.w600)
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  //Video Call option
                  GestureDetector(
                    onTap: () => setState(() => selectedType = 'video'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF191E39),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: selectedType == 'video'
                              ? const Color(0xFF1132D3)
                              : const Color(0xFF3E4059),
                          width: selectedType == 'video' ? 1.5 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFF262B42),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: selectedType == 'video'
                                    ? const Color(0xFF1132D3)
                                    : const Color(0xFF3E4059),
                                width: 1,
                              ),
                            ),
                            child: Icon(Icons.videocam_outlined,
                                color: selectedType == 'video'
                                    ? const Color(0xFF1132D3)
                                    : const Color(0xFFFFFBFB),
                                size: 25),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Video Call',
                                    style: TextStyle(
                                        color: Color(0xFFEFF3F7),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(height: 3),
                                Text('Using Zoom or Google Meet',
                                    style: TextStyle(
                                        color: Color(0xFF9498A4), fontSize: 12)),
                              ],
                            ),
                          ),
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedType == 'video'
                                    ? const Color(0xFF1132D3)
                                    : const Color(0xFF3E4059),
                                width: 1.5,
                              ),
                            ),
                            child: selectedType == 'video'
                                ? const Icon(Icons.check,
                                color: Color(0xFF1132D3), size: 14)
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// On-site option
                  GestureDetector(
                    onTap: () => setState(() => selectedType = 'onsite'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF191E39),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: selectedType == 'onsite'
                              ? const Color(0xFF1132D3)
                              : const Color(0xFF3E4059),
                          width: selectedType == 'onsite' ? 1.5 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFF262B42),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: selectedType == 'onsite'
                                    ? const Color(0xFF1132D3)
                                    : const Color(0xFF3E4059),
                                width: 1,
                              ),
                            ),
                            child: Icon(Icons.location_on_outlined,
                                color: selectedType == 'onsite'
                                    ? const Color(0xFF1132D3)
                                    : const Color(0xFFFFFBFB),
                                size: 22),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('On-site Interview',
                                    style: TextStyle(
                                        color: Color(0xFFEFF3F7),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(height: 3),
                                Text('HQ Office - Austin, TX',
                                    style: TextStyle(
                                        color: Color(0xFF9498A4), fontSize: 12)),
                              ],
                            ),
                          ),
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedType == 'onsite'
                                    ? const Color(0xFF1132D3)
                                    : const Color(0xFF3E4059),
                                width: 1.5,
                              ),
                            ),
                            child: selectedType == 'onsite'
                                ? const Icon(Icons.check,
                                color: Color(0xFF1132D3), size: 14)
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            //Duration
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF191E39),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF3E4059), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      SizedBox(width: 3),
                      Text(
                        'Duration',
                        style: TextStyle(
                          color: Color(0xFFEFF3F7),
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12), // spacing

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: durations.map((d) {
                      final bool isSelected = selectedDuration == d;
                      return GestureDetector(
                        onTap: () => setState(() => selectedDuration = d),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF1132D3).withOpacity(0.15)
                                : const Color(0xFF1A1F3A),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF1132D3)
                                  : const Color(0xFF3E4059),
                            ),
                          ),
                          child: Text(
                            d,
                            style: TextStyle(
                              color: isSelected
                                  ? const Color(0xFF1132D3)
                                  : const Color(0xFFFFFBFB),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ── Select Date ──

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF191E39),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF3E4059), width: 1),
              ),
              child: Column(
                children: [
                  /// Month nav
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Select Date',
                          style: TextStyle(
                              color: Color(0xFFEFF3F7),
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      IconButton(
                        onPressed: _prevMonth,
                        icon: const Icon(Icons.chevron_left,
                            color: Color(0xFFEFF3F7), size: 24),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      Text(_monthLabel(currentMonth),
                          style: const TextStyle(
                              color: Color(0xFFEFF3F7),
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      IconButton(
                        onPressed: _nextMonth,
                        icon: const Icon(Icons.chevron_right,
                            color: Color(0xFFEFF3F7), size: 24),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  /// Weekday labels
                  Row(
                    children: weekDays
                        .map((d) => Expanded(
                      child: Center(
                        child: Text(d,
                            style: const TextStyle(
                                color: Color(0xFF6A7588),
                                fontSize: 11,
                                fontWeight: FontWeight.w500)),
                      ),
                    ))
                        .toList(),
                  ),
                  const SizedBox(height: 8),

                  /// Days grid
                  Builder(builder: (_) {
                    final firstDay = _firstWeekdayOfMonth(currentMonth);
                    final daysInMonth = _daysInMonth(currentMonth);
                    final rows = ((firstDay + daysInMonth) / 7).ceil();
                    return Column(
                      children: List.generate(rows, (row) {
                        return Row(
                          children: List.generate(7, (col) {
                            final index = row * 7 + col;
                            final day = index - firstDay + 1;
                            final isValid = day >= 1 && day <= daysInMonth;
                            final isSelected = isValid && selectedDay == day;
                            return Expanded(
                              child: GestureDetector(
                                onTap: isValid
                                    ? () => setState(() => selectedDay = day)
                                    : null,
                                child: Container(
                                  margin: const EdgeInsets.all(2),
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xFF1132D3)
                                        : Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: isValid
                                        ? Text('$day',
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : const Color(0xFF93A2B7),
                                          fontSize: 13,
                                          fontWeight: isSelected
                                              ? FontWeight.w600
                                              : FontWeight.w400,
                                        ))
                                        : const SizedBox(),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      }),
                    );
                  }),
                ],
              ),
            ),

            const SizedBox(height: 20),


          ],
        ),
      ),
    );
  }
}