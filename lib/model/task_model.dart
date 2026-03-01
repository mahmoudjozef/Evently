class TaskModel {
  String title;
  String Description;
  int date;
  String id;
  String category;
  bool isFavorite;

  TaskModel({
    required this.title,
    required this.Description,
    required this.date,
    this.id = '',
    required this.category,
    this.isFavorite = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          title: json['Title'],
          Description: json['Description'],
          date: json['date'],
          category: json['category'],
          id: json['id'],
          isFavorite: json['isFavorite'] ?? false,
        );

  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Description': Description,
      'date': date,
      'category': category,
      'id': id,
      'isFavorite': isFavorite,
    };
  }
}
