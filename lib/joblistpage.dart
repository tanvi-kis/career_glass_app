// import 'package:flutter/material.dart';
//
// class JobsScreen extends StatefulWidget {
//   const JobsScreen({super.key});
//
//   @override
//   State<JobsScreen> createState() => _JobsScreenState();
// }
//
// class _JobsScreenState extends State<JobsScreen> {
//   int _selectedNavIndex = 0;
//
//   // ── Selected Filter Values ──────────────────────────────────────────────
//   String? _selectedLocation;
//   String? _selectedSalary;
//   String? _selectedExperience;
//
//   // ── Filter Options ──────────────────────────────────────────────────────
//   final List<String> _locations = [
//     'Remote', 'Ahmedabad', 'Prahladnagar',
//     'Nikol', 'Satelite', 'Naroda',
//   ];
//
//   final List<String> _salaries = [
//     '\$50k - \$80k', '\$80k - \$120k', '\$120k - \$160k',
//     '\$160k - \$200k', '\$200k+',
//   ];
//
//   final List<String> _experiences = [
//     'Internship', 'Entry Level', 'Mid Level',
//     'Senior Level', 'Director', 'Executive',
//   ];
//
//   final List<_JobData> _jobs = const [
//     _JobData(
//       title: 'Senior Product Designer',
//       company: 'Softs Solution',
//       location: 'Ahmedabad',
//       salaryMin: '\$140k',
//       salaryMax: '\$190k',
//       tag: 'Full-time',
//       tagColor: Color(0xFF1132D3),
//     ),
//     _JobData(
//       title: 'Lead UX Researcher',
//       company: 'Krupa Info Services',
//       location: 'Remote',
//       salaryMin: '\$120k',
//       salaryMax: '\$155k',
//       tag: 'Contract',
//       tagColor: Color(0xFF7B3AEC),
//     ),
//     _JobData(
//       title: 'Senior Frontend Engineer',
//       company: 'Google',
//       location: 'Prahladnagar',
//       salaryMin: '\$160k',
//       salaryMax: '\$210k',
//       tag: 'Full-time',
//       tagColor: Color(0xFF1132D3),
//     ),
//     _JobData(
//       title: 'UI/UX Designer',
//       company: 'Microsoft',
//       location: 'Ahmedabad',
//       salaryMin: '\$95k',
//       salaryMax: '\$130k',
//       tag: 'Full-time',
//       tagColor: Color(0xFF1132D3),
//     ),
//   ];
//
//   // ── Open Filter Bottom Sheet ─────────────────────────────────────────────
//   void _openFilter({
//     required String title,
//     required List<String> options,
//     required String? selected,
//     required Function(String?) onSelect,
//   }) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       isScrollControlled: true,
//       builder: (_) => _FilterSheet(
//         title: title,
//         options: options,
//         selected: selected,
//         onSelect: (val) {
//           setState(() => onSelect(val));
//           Navigator.pop(context);
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF101532),
//       appBar: _buildAppBar(),
//       bottomNavigationBar: _buildBottomNav(),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ── Filter Chips ─────────────────────────────────────────
//             Padding(
//               padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
//               child: Row(
//                 children: [
//                   _FilterChip(
//                     label: 'Location',
//                     selected: _selectedLocation,
//                     onTap: () => _openFilter(
//                       title: 'Select Location',
//                       options: _locations,
//                       selected: _selectedLocation,
//                       onSelect: (v) => _selectedLocation = v,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   _FilterChip(
//                     label: 'Salary',
//                     selected: _selectedSalary,
//                     onTap: () => _openFilter(
//                       title: 'Select Salary Range',
//                       options: _salaries,
//                       selected: _selectedSalary,
//                       onSelect: (v) => _selectedSalary = v,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   _FilterChip(
//                     label: 'Experience',
//                     selected: _selectedExperience,
//                     onTap: () => _openFilter(
//                       title: 'Select Experience',
//                       options: _experiences,
//                       selected: _selectedExperience,
//                       onSelect: (v) => _selectedExperience = v,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 8),
//
//             // ── Job List ─────────────────────────────────────────────
//             Expanded(
//               child: ListView.separated(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 14, vertical: 8),
//                 itemCount: _jobs.length,
//                 separatorBuilder: (_, __) => const SizedBox(height: 12),
//                 itemBuilder: (context, index) =>
//                     _JobCard(job: _jobs[index]),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   PreferredSizeWidget _buildAppBar() {
//     return PreferredSize(
//       preferredSize: const Size.fromHeight(80),
//       child: Container(
//         height: 60,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF171A29), Color(0xFF0E1640)],
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//           ),
//           border: Border(
//             bottom: BorderSide(color: Color(0xFF303340), width: 1),
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 30, height: 30,
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [Color(0xFF0C338E), Color(0xFF4A7BF7)],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Center(
//                         child: Text('CG',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 11,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     const Text('CareerGlass',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.search,
//                       color: Colors.white70, size: 22),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBottomNav() {
//     return Container(
//       height: 70,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF171A29), Color(0xFF0E1640)],
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//         ),
//         border: Border(
//           top: BorderSide(color: Color(0xFF3E4059), width: 1),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _navItem(Icons.home_rounded, 'Jobs', 0),
//           _navItem(Icons.chat_bubble_outline, 'Messages', 1),
//           _navItem(Icons.check_circle_outline, 'Applied', 2),
//           _navItem(Icons.person_outline_rounded, 'Profile', 3),
//         ],
//       ),
//     );
//   }
//
//   Widget _navItem(IconData icon, String label, int index) {
//     final bool active = _selectedNavIndex == index;
//     const Color activeColor = Color(0xFF1132D3);
//     const Color inactiveColor = Color(0xFF3A4E72);
//
//     return GestureDetector(
//       onTap: () => setState(() => _selectedNavIndex = index),
//       child: SizedBox(
//         width: 72,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 24,
//                 color: active ? activeColor : inactiveColor),
//             const SizedBox(height: 4),
//             Text(label,
//               style: TextStyle(
//                 fontSize: 11,
//                 fontWeight: active ? FontWeight.w600 : FontWeight.w400,
//                 color: active ? activeColor : inactiveColor,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // ── Filter Chip Widget ────────────────────────────────────────────────────────
// class _FilterChip extends StatelessWidget {
//   final String label;
//   final String? selected;
//   final VoidCallback onTap;
//
//   const _FilterChip({
//     required this.label,
//     required this.selected,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final bool isActive = selected != null && selected!.isNotEmpty;
//
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         decoration: BoxDecoration(
//           color: isActive
//               ? const Color(0xFF1132D3).withOpacity(0.15)
//               : const Color(0xFF191E39),
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(
//             color: isActive
//                 ? const Color(0xFF1132D3)
//                 : const Color(0xFF3E4059),
//             width: 1,
//           ),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               isActive ? _shortLabel(selected!) : label,
//               style: TextStyle(
//                 color: isActive
//                     ? const Color(0xFF4A7BF7)
//                     : const Color(0xFFB8C8F0),
//                 fontSize: 12,
//                 fontWeight:
//                 isActive ? FontWeight.w600 : FontWeight.w500,
//               ),
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//             ),
//             const SizedBox(width: 4),
//             Icon(
//               isActive
//                   ? Icons.keyboard_arrow_up_rounded
//                   : Icons.keyboard_arrow_down_rounded,
//               color: isActive
//                   ? const Color(0xFF4A7BF7)
//                   : const Color(0xFF7A90B8),
//               size: 16,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   String _shortLabel(String val) {
//     if (val.length > 10) return '${val.substring(0, 9)}...';
//     return val;
//   }
// }
//
// // ── Filter Bottom Sheet ───────────────────────────────────────────────────────
// class _FilterSheet extends StatefulWidget {
//   final String title;
//   final List<String> options;
//   final String? selected;
//   final Function(String?) onSelect;
//
//   const _FilterSheet({
//     required this.title,
//     required this.options,
//     required this.selected,
//     required this.onSelect,
//   });
//
//   @override
//   State<_FilterSheet> createState() => _FilterSheetState();
// }
//
// class _FilterSheetState extends State<_FilterSheet> {
//   String? _temp;
//
//   @override
//   void initState() {
//     super.initState();
//     _temp = widget.selected;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Color(0xFF141830),
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//         border: Border(
//           top: BorderSide(color: Color(0xFF3E4059), width: 1),
//         ),
//       ),
//       padding: const EdgeInsets.fromLTRB(20, 12, 20, 30),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // ── Handle ──────────────────────────────────────────────────
//           Container(
//             width: 40, height: 4,
//             decoration: BoxDecoration(
//               color: const Color(0xFF3E4059),
//               borderRadius: BorderRadius.circular(2),
//             ),
//           ),
//           const SizedBox(height: 16),
//
//           // ── Title + Clear ────────────────────────────────────────────
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(widget.title,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               if (_temp != null && _temp!.isNotEmpty)
//                 GestureDetector(
//                   onTap: () {
//                     setState(() => _temp = null);
//                     widget.onSelect(null);
//                   },
//                   child: const Text('Clear',
//                     style: TextStyle(
//                       color: Color(0xFF4A7BF7),
//                       fontSize: 13,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//           const SizedBox(height: 16),
//
//           // ── Options List ─────────────────────────────────────────────
//           ...widget.options.map((option) {
//             final bool isSelected = _temp == option;
//             return GestureDetector(
//               onTap: () {
//                 setState(() => _temp = option);
//                 widget.onSelect(option);
//               },
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 150),
//                 margin: const EdgeInsets.only(bottom: 10),
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 16, vertical: 14),
//                 decoration: BoxDecoration(
//                   color: isSelected
//                       ? const Color(0xFF1132D3).withOpacity(0.15)
//                       : const Color(0xFF191E39),
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(
//                     color: isSelected
//                         ? const Color(0xFF1132D3)
//                         : const Color(0xFF2E3352),
//                     width: 1,
//                   ),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Text(option,
//                         style: TextStyle(
//                           color: isSelected
//                               ? const Color(0xFF4A7BF7)
//                               : const Color(0xFFB8C8F0),
//                           fontSize: 14,
//                           fontWeight: isSelected
//                               ? FontWeight.w600
//                               : FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                     AnimatedSwitcher(
//                       duration: const Duration(milliseconds: 150),
//                       child: isSelected
//                           ? const Icon(Icons.check_circle_rounded,
//                           color: Color(0xFF1132D3),
//                           size: 20,
//                           key: ValueKey('check'))
//                           : const SizedBox(width: 20, key: ValueKey('empty')),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }
//
// // ── Job Card ──────────────────────────────────────────────────────────────────
// class _JobCard extends StatelessWidget {
//   final _JobData job;
//
//   const _JobCard({required this.job});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: const Color(0xFF141830),
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: const Color(0xFF2E3352), width: 1),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 46, height: 46,
//             decoration: BoxDecoration(
//               color: const Color(0xFF1E2440),
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: const Color(0xFF3E4059)),
//             ),
//             child: const Center(
//               child: Icon(Icons.work_outline,
//                   color: Color(0xFF4A7BF7), size: 22),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(job.title,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                           height: 1.3,
//                         ),
//                       ),
//                     ),
//                     const Icon(Icons.bookmark_border,
//                         color: Color(0xFF7A90B8), size: 20),
//                   ],
//                 ),
//                 const SizedBox(height: 4),
//                 Text('${job.company} • ${job.location}',
//                   style: const TextStyle(
//                       color: Color(0xFF93A2B7), fontSize: 12),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Text('${job.salaryMin} - ${job.salaryMax}',
//                       style: const TextStyle(
//                         color: Color(0xFF1132D3),
//                         fontWeight: FontWeight.w600,
//                         fontSize: 13,
//                       ),
//                     ),
//                     const Spacer(),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: job.tagColor.withOpacity(0.15),
//                         borderRadius: BorderRadius.circular(6),
//                         border: Border.all(
//                             color: job.tagColor.withOpacity(0.4), width: 1),
//                       ),
//                       child: Text(job.tag,
//                         style: TextStyle(
//                           color: job.tagColor == const Color(0xFF7B3AEC)
//                               ? const Color(0xFFAB7BEC)
//                               : const Color(0xFF4A7BF7),
//                           fontSize: 11,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // ── Job Data Model ────────────────────────────────────────────────────────────
// class _JobData {
//   final String title, company, location, salaryMin, salaryMax, tag;
//   final Color tagColor;
//
//   const _JobData({
//     required this.title,
//     required this.company,
//     required this.location,
//     required this.salaryMin,
//     required this.salaryMax,
//     required this.tag,
//     required this.tagColor,
//   });
// }