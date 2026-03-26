class JobModel {
  final String id;
  final String title;
  final String company;
  final String location;
  final String salary;
  final String experience;
  final String type; // Remote / Onsite / Hybrid
  final String postedTime;
  final String logoPath;       // company logo (small square)
  final String bannerImagePath; // full-width background image on details page
  final String about;
  final List<String> requirements;
  final List<BenefitModel> benefits;
  final String mapImagePath;
  final String fullAddress;
  final bool isSaved;
  final String matchPercent;

  const JobModel({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.experience,
    required this.type,
    required this.postedTime,
    required this.logoPath,
    required this.bannerImagePath,
    required this.about,
    required this.requirements,
    required this.benefits,
    required this.mapImagePath,
    required this.fullAddress,
    this.isSaved = false,
    required this.matchPercent,
  });
}

class BenefitModel {
  final String label;
  const BenefitModel({required this.label});
}