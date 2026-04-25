class Project {
  final String name;
  final String description;
  final List<String> images;
  final List<String> tools;
  final String githubUrl;

  Project({
    required this.name,
    required this.description,
    required this.images,
    required this.tools,
    required this.githubUrl,
  });
}

class Experience {
  final String title;
  final String company;
  final String period;
  final String location;
  final String workType;

  Experience({
    required this.title,
    required this.company,
    required this.period,
    required this.location,
    required this.workType,
  });
}
