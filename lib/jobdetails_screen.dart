import 'package:flutter/material.dart';
import '../model/app_theme.dart';
import '../model/job_model.dart';
import '../widget/appbar.dart';


class JobDetailsScreen extends StatefulWidget {
  final JobModel job;

  const JobDetailsScreen({super.key, required this.job});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  bool _isSaved = false;

  @override
  void initState() {
    super.initState();
    _isSaved = widget.job.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    final job = widget.job;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CareerGlassAppBar(
        showLogo: false,
        title: 'Job Details',
        onBackPressed: () => Navigator.pop(context),
        actions: [
          GestureDetector(
            onTap: () => setState(() => _isSaved = !_isSaved),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                _isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                color: _isSaved ? AppColors.accent : AppColors.textPrimary,
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.share_outlined,
              color: AppColors.textPrimary,
              size: 18,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero Banner ───────────────────────────────────────────────
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Banner image — full width, no margin, no border radius
                SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Image.asset(
                    job.bannerImagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFF0D1B2A),
                      child: Center(
                        child: Icon(
                          Icons.business,
                          color: AppColors.accent.withOpacity(0.3),
                          size: 60,
                        ),
                      ),
                    ),
                  ),
                ),
                // Dark gradient overlay at bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          AppColors.background,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                // Company logo — bottom-left, overlapping banner
                Positioned(
                  bottom: -40,
                  left: 16,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B3A2F),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: AppColors.cardBorder,
                        width: 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        job.logoPath,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => Center(
                          child: Text(
                            job.company[0],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 52), // space for overlapping logo

            // ── Title & Meta ──────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Job Title
                  Text(
                    job.title,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Company (blue) • Location
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.company,
                        style: const TextStyle(
                          color: Color(0xFF4A7BF7),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 4,
                        height: 4,
                        margin: const EdgeInsets.only(top: 8),
                        decoration: const BoxDecoration(
                          color: AppColors.textMuted,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          job.location,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Posted time • Applicants
                  Row(
                    children: [
                      const Icon(Icons.access_time_rounded,
                          color: AppColors.textMuted, size: 13),
                      const SizedBox(width: 4),
                      Text(
                        'Posted ${job.postedTime}',
                        style: const TextStyle(
                            color: AppColors.textMuted, fontSize: 12),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.people_outline_rounded,
                          color: AppColors.textMuted, size: 13),
                      const SizedBox(width: 4),
                      const Text(
                        '124 Applicants',
                        style: TextStyle(
                            color: AppColors.textMuted, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Tags with icons
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _Tag(
                          label: job.type,
                          icon: Icons.work_outline_rounded,
                          isAccent: false,
                        ),
                        const SizedBox(width: 8),
                        _Tag(
                          label: job.salary,
                          icon: Icons.attach_money_rounded,
                          isAccent: false,
                        ),
                        const SizedBox(width: 8),
                        _Tag(
                          label: job.experience,
                          icon: Icons.bolt_rounded,
                          isAccent: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ── About / Requirements / Benefits — ONE BOX ─────────
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF191E39),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.cardBorder, width: 0.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // About the Role
                        const Text(
                          'About the Role',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.3,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Divider(color: AppColors.cardBorder, thickness: 0.5),
                        const SizedBox(height: 8),
                        Text(
                          job.about,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Requirements
                        const Text(
                          'Requirements',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.3,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Divider(color: AppColors.cardBorder, thickness: 0.5),
                        const SizedBox(height: 8),
                        ...job.requirements
                            .map((req) => _RequirementItem(text: req)),

                        const SizedBox(height: 20),

                        // Benefits
                        const Text(
                          'Benefits',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.3,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Divider(color: AppColors.cardBorder, thickness: 0.5),
                        const SizedBox(height: 8),
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2.6,
                          children: job.benefits
                              .map((b) => _BenefitChip(label: b.label))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ── Location (no box) ─────────────────────────────────
                  const Text(
                    'Location',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      color: AppColors.surfaceLight,
                      child: Image.asset(
                        job.mapImagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.surfaceLight,
                                    AppColors.surface,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: AppColors.accent.withOpacity(0.6),
                                    size: 32,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    job.location,
                                    style: const TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    job.fullAddress,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),

      // ── Bottom Apply Bar ──────────────────────────────────────────────────
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(
          16,
          12,
          16,
          12 + MediaQuery.of(context).padding.bottom,
        ),
        decoration: const BoxDecoration(
          color: AppColors.bottomNavBgLeft,
          border: Border(
            top: BorderSide(color: AppColors.divider, width: 0.5),
          ),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => setState(() => _isSaved = !_isSaved),
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.cardBorder, width: 0.5),
                ),
                child: Icon(
                  _isSaved
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_border_rounded,
                  color: _isSaved ? AppColors.accent : AppColors.textSecondary,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Applied to ${job.title} at ${job.company}!',
                      ),
                      backgroundColor: AppColors.accent,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.accentLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Apply Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.2,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Section Box Widget ────────────────────────────────────────────────────────
class _SectionBox extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionBox({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF191E39),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 4),
          const Divider(color: AppColors.cardBorder, thickness: 0.5),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

// ── Tag ───────────────────────────────────────────────────────────────────────
class _Tag extends StatelessWidget {
  final String label;
  final bool isAccent;
  final IconData? icon;

  const _Tag({required this.label, this.isAccent = false, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: isAccent
            ? AppColors.accent.withOpacity(0.15)
            : const Color(0xFF191E39),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isAccent
              ? AppColors.accent.withOpacity(0.3)
              : AppColors.cardBorder,
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 13,
              color: isAccent ? AppColors.accent : AppColors.textSecondary,
            ),
            const SizedBox(width: 5),
          ],
          Text(
            label,
            style: TextStyle(
              color: isAccent ? AppColors.accent : AppColors.textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Requirement Item ──────────────────────────────────────────────────────────
class _RequirementItem extends StatelessWidget {
  final String text;
  const _RequirementItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 18,
            height: 18,
            margin: const EdgeInsets.only(top: 1),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              color: AppColors.accent,
              size: 11,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Benefit Chip ──────────────────────────────────────────────────────────────
class _BenefitChip extends StatelessWidget {
  final String label;
  const _BenefitChip({required this.label});

  // Map benefit label → icon
  static IconData _iconFor(String label) {
    final l = label.toLowerCase();
    if (l.contains('health') || l.contains('medical')) return Icons.health_and_safety_outlined;
    if (l.contains('remote') || l.contains('wfh') || l.contains('work from')) return Icons.home_work_outlined;
    if (l.contains('pto') || l.contains('vacation') || l.contains('sabbatical')) return Icons.flight_takeoff_rounded;
    if (l.contains('gym') || l.contains('fitness') || l.contains('allowance')) return Icons.fitness_center_rounded;
    if (l.contains('stock') || l.contains('equity')) return Icons.trending_up_rounded;
    if (l.contains('bonus') || l.contains('401') || l.contains('pension')) return Icons.savings_outlined;
    if (l.contains('learning') || l.contains('education') || l.contains('budget')) return Icons.school_outlined;
    if (l.contains('retreat') || l.contains('event') || l.contains('team')) return Icons.groups_outlined;
    if (l.contains('equipment') || l.contains('device')) return Icons.devices_outlined;
    if (l.contains('insurance')) return Icons.security_outlined;
    if (l.contains('flexible') || l.contains('hours')) return Icons.schedule_outlined;
    if (l.contains('creative')) return Icons.palette_outlined;
    return Icons.star_border_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF232534),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder, width: 0.5),
      ),
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            child: Icon(
              _iconFor(label),
              color: AppColors.accentLight,
              size: 17,
            ),
          ),
          Row(

            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}