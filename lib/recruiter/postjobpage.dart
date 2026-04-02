import 'package:flutter/material.dart';

class PostNewJobPage extends StatefulWidget {
  const PostNewJobPage({super.key});

  @override
  State<PostNewJobPage> createState() => _PostNewJobPageState();
}

class _PostNewJobPageState extends State<PostNewJobPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();

  String selectedJobType = 'Full-time';
  String selectedLocation = 'New York, NY';

  RangeValues salaryRange = const RangeValues(80000, 140000);

  List<String> skillTags = ['Figma', 'React', 'UI Design'];

  final List<Map<String, dynamic>> jobTypeList = [
    {"label": 'Full-time', "value": 'Full-time'},
    {"label": 'Part-time', "value": 'Part-time'},
    {"label": 'Contract', "value": 'Contract'},
    {"label": 'Freelance', "value": 'Freelance'},
    {"label": 'Internship', "value": 'Internship'},
  ];

  final List<Map<String, dynamic>> locationList = [
    {"label": 'New York', "value": 'New York, NY'},
    {"label": 'San Francisco, CA', "value": 'San Francisco, CA'},
    {"label": 'Remote', "value": 'Remote'},
    {"label": 'Austin, TX', "value": 'Austin, TX'},
  ];

  String _formatSalary(double value) {
    if (value >= 1000) {
      return '\$${(value / 1000).toStringAsFixed(0)}k';
    }
    return '\$${value.toStringAsFixed(0)}';
  }

  void _addSkill(String skill) {
    final trimmed = skill.trim();
    if (trimmed.isNotEmpty && !skillTags.contains(trimmed)) {
      setState(() {
        skillTags.add(trimmed);
        _skillController.clear();
      });
    }
  }

  void _removeSkill(String skill) {
    setState(() => skillTags.remove(skill));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101532),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF191E39),
            border: Border.all(color: Color(0xFF3E4059), width: 1),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Color(0xFFEFF3F7), size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            title: Center(
              child: Text(
                'Post a New Job',
                style: TextStyle(
                  color: Color(0xFFEFF3F7),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            centerTitle: false,
            actions: [
              IconButton(
                icon: Icon(Icons.more_vert, color: Color(0xFFEFF3F7)),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            //job title
            _SectionLabel(label: 'Job Title'),
            const SizedBox(height: 8),
            _StyledTextField(
              controller: _titleController,
              hint: 'e.g. Senior Product Designer',
            ),

            const SizedBox(height: 20),

            //job type + location
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionLabel(label: 'Job Type'),
                      const SizedBox(height: 8),
                      _StyledDropdown(
                        value: selectedJobType,
                        items: jobTypeList,
                        onChanged: (val) =>
                            setState(() => selectedJobType = val!),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionLabel(label: 'Location'),
                      const SizedBox(height: 8),
                      _StyledDropdown(
                        value: selectedLocation,
                        items: locationList,
                        prefixIcon: Icons.location_on_outlined,
                        onChanged: (val) =>
                            setState(() => selectedLocation = val!),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            //job description
            _SectionLabel(label: 'Job Description'),
            const SizedBox(height: 8),
            _StyledTextField(
              controller: _descController,
              hint: 'Enter job requirements and\nresponsibilities...',
              maxLines: 4,
            ),

            const SizedBox(height: 24),

            //salary range
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _SectionLabel(label: 'Salary Range (Yearly)'),
                Text(
                  '${_formatSalary(salaryRange.start)} - ${_formatSalary(salaryRange.end)}',
                  style: TextStyle(
                    color: Color(0xFF1132D3),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Color(0xFF1132D3),
                inactiveTrackColor: Color(0xFF191E39),
                thumbColor: Color(0xFF1132D3),
                overlayColor: Color(0xFF1132D3).withOpacity(0.2),
                trackHeight: 4,
                thumbShape:
                const RoundSliderThumbShape(enabledThumbRadius: 8),
              ),
              child: RangeSlider(
                values: salaryRange,
                min: 30000,
                max: 300000,
                onChanged: (val) => setState(() => salaryRange = val),
              ),
            ),

            const SizedBox(height: 20),

            //skills
            _SectionLabel(label: 'Required Skills'),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xFF191E39),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  //skill tag
                  ...skillTags.map(
                        (skill) => _SkillChip(
                      label: skill,
                      onRemove: () => _removeSkill(skill),
                    ),
                  ),

                  //add skill input
                  SizedBox(
                    width: 90,
                    height: 32,
                    child: TextField(
                      controller: _skillController,
                      style: TextStyle(
                          color: Color(0xFFFFFBFB), fontSize: 13),
                      decoration: InputDecoration(
                        hintText: 'Add skill...',
                        hintStyle: TextStyle(
                            color: Color(0xFFFFFBFB).withOpacity(0.5),
                            fontSize: 13),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 6),
                      ),
                      onSubmitted: _addSkill,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            //post job button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send_outlined,
                    color: Colors.white, size: 18),
                label: const Text(
                  'Post Job Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1132D3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

//reusable section label
class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: Color(0xFF93A2B7),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

//reusable styled textfirld
class _StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;

  const _StyledTextField({
    required this.controller,
    required this.hint,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(color: Color(0xFFFFFBFB), fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            color: Color(0xFF64738A), fontSize: 14),
        filled: true,
        fillColor: Color(0xFF191E39),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}

//resuable styled dropdown
class _StyledDropdown extends StatelessWidget {
  final String value;
  final List<Map<String, dynamic>> items;
  final ValueChanged<String?> onChanged;
  final IconData? prefixIcon;

  const _StyledDropdown({
    required this.value,
    required this.items,
    required this.onChanged,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFF191E39),
        borderRadius: BorderRadius.circular(14),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: Color(0xFF191E39),
          icon: Icon(Icons.keyboard_arrow_down,
              color: Color(0xFFFFFBFB), size: 20),
          style: TextStyle(
              color: Color(0xFFFFFBFB), fontSize: 13, fontWeight: FontWeight.w500),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item['value'],
              child: Row(
                children: [
                  if (prefixIcon != null) ...[
                    Icon(prefixIcon, color: Color(0xFFFFFBFB), size: 14),
                    const SizedBox(width: 4),
                  ],
                  Flexible(
                    child: Text(
                      item['label'],
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

//skill chip
class _SkillChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _SkillChip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Color(0xFF1A234E),
        border: Border.all(color: Color(0xFF334095),width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color(0xFFEFF3F7),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onRemove,
            child: Icon(Icons.close, color: Color(0xFFEFF3F7), size: 14),
          ),
        ],
      ),
    );
  }
}