import 'job_model.dart';

class AppData {
  static const List<JobModel> jobs = [
    JobModel(
      id: '1',
      title: 'Lead Product Architect',
      company: 'CareerGlass',
      location: 'San Francisco, CA',
      salary: '\$120k - \$160k',
      experience: '5+ years',
      type: 'Remote',
      postedTime: '4 hours ago',
      logoPath: 'assets/images/joblogo.png',         // job 1 company logo
      bannerImagePath: 'assets/images/jobdetails.png', // job 1 details background
      matchPercent: '94%',
      about:
      'We are looking for a visionary Lead Product Architect to join our core team. You will be responsible for defining the technical roadmap and architectural standards for our next-generation platform. You\'ll collaborate closely with design and engineering leads to ship high-impact features used by millions of users worldwide.',
      requirements: [
        '6+ years of experience in product design or system architecture',
        'Deep proficiency in React, Node.js, and distributed systems',
        'Proven record of leading complex technical projects from 0 to 1',
        'Excellent communication skills and leadership mindset',
      ],
      benefits: [
        BenefitModel(label: 'Premium Health'),
        BenefitModel(label: 'Flexible WFH'),
        BenefitModel(label: 'Unlimited PTO'),
        BenefitModel(label: 'Gym Allowance'),
      ],
      mapImagePath: 'assets/images/map_placeholder.png',
      fullAddress: '123 Market St, San Francisco, CA 94102',
      isSaved: false,
    ),
    JobModel(
      id: '2',
      title: 'Senior Product Designer',
      company: 'Lottie Digital',
      location: 'San Francisco, CA',
      salary: '\$90k - \$120k',
      experience: '3+ years',
      type: 'Hybrid',
      postedTime: '1 day ago',
      logoPath: 'assets/images/r1.png',         // job 2 company logo
      bannerImagePath: 'assets/images/jobdetails.png', // job 2 details background
      matchPercent: '88%',
      about:
      'Lottie Digital is seeking a Senior Product Designer to craft beautiful, intuitive experiences for our B2B SaaS platform. You will own the design process end-to-end from research to high-fidelity prototypes.',
      requirements: [
        '3+ years of product design experience',
        'Strong Figma skills and design systems knowledge',
        'Experience with user research and usability testing',
        'Ability to collaborate cross-functionally with engineering',
      ],
      benefits: [
        BenefitModel(label: 'Health Insurance'),
        BenefitModel(label: 'Remote Fridays'),
        BenefitModel(label: '401K Match'),
        BenefitModel(label: 'Learning Budget'),
      ],
      mapImagePath: 'assets/images/map_placeholder.png',
      fullAddress: '456 Market St, San Francisco, CA 94103',
      isSaved: true,
    ),
    JobModel(
      id: '3',
      title: 'Lead UX Researcher',
      company: 'Quantum Labs',
      location: 'New York, NY',
      salary: '\$100k - \$130k',
      experience: '4+ years',
      type: 'Onsite',
      postedTime: '3 days ago',
      logoPath: 'assets/images/joblogo.png',         // job 3 company logo
      bannerImagePath: 'assets/images/jobdetails.png', // job 3 details background
      matchPercent: '82%',
      about:
      'Quantum Labs is looking for a Lead UX Researcher to drive our user insights program. You\'ll conduct both qualitative and quantitative research to inform product strategy.',
      requirements: [
        '4+ years of UX research experience',
        'Proficiency in mixed-methods research',
        'Strong data analysis and storytelling skills',
        'Experience with enterprise software products',
      ],
      benefits: [
        BenefitModel(label: 'Full Health'),
        BenefitModel(label: 'Stock Options'),
        BenefitModel(label: 'Annual Bonus'),
        BenefitModel(label: 'Paid Sabbatical'),
      ],
      mapImagePath: 'assets/images/map_placeholder.png',
      fullAddress: '789 Broadway, New York, NY 10003',
      isSaved: false,
    ),
    JobModel(
      id: '4',
      title: 'Senior Frontend Engineer',
      company: 'Banda Corp',
      location: 'New York, NY',
      salary: '\$130k - \$170k',
      experience: '5+ years',
      type: 'Remote',
      postedTime: '5 hours ago',
      logoPath: 'assets/images/joblogo.png',         // job 4 company logo
      bannerImagePath: 'assets/images/jobdetails.png', // job 4 details background
      matchPercent: '91%',
      about:
      'Banda Corp needs a Senior Frontend Engineer passionate about performance and user experience. You\'ll build scalable React applications and mentor junior developers.',
      requirements: [
        '5+ years of React/TypeScript experience',
        'Strong understanding of web performance optimization',
        'Experience with GraphQL and REST APIs',
        'Excellent problem-solving skills',
      ],
      benefits: [
        BenefitModel(label: 'Premium Health'),
        BenefitModel(label: 'Full Remote'),
        BenefitModel(label: 'Equipment Budget'),
        BenefitModel(label: 'Team Retreats'),
      ],
      mapImagePath: 'assets/images/map_placeholder.png',
      fullAddress: '321 Park Ave, New York, NY 10016',
      isSaved: false,
    ),
    JobModel(
      id: '5',
      title: 'UI/UX Designer',
      company: 'PixelForge',
      location: 'Austin, TX',
      salary: '\$70k - \$95k',
      experience: '2+ years',
      type: 'Hybrid',
      postedTime: '1 week ago',
      logoPath: 'assets/images/joblogo.png',         // job 5 company logo
      bannerImagePath: 'assets/images/jobdetails.png', // job 5 details background
      matchPercent: '79%',
      about:
      'PixelForge is a creative agency looking for a talented UI/UX Designer to craft compelling digital experiences for our diverse client portfolio.',
      requirements: [
        '2+ years of UI/UX design experience',
        'Proficiency in Figma and Adobe Creative Suite',
        'Strong visual design and typography skills',
        'Portfolio showcasing web and mobile design work',
      ],
      benefits: [
        BenefitModel(label: 'Health Insurance'),
        BenefitModel(label: 'Creative Budget'),
        BenefitModel(label: 'Flexible Hours'),
        BenefitModel(label: 'Team Events'),
      ],
      mapImagePath: 'assets/images/map_placeholder.png',
      fullAddress: '555 Congress Ave, Austin, TX 78701',
      isSaved: true,
    ),
  ];

  static const List<String> trendingJobs = [
    'Visual Designer',
    'Design Lead',
    'Community Manager',
  ];

  static const List<String> categories = ['Design', 'Development'];

  static const String userName = 'Alex';
  static const String userAvatarPath = 'assets/images/avatar.png';
}