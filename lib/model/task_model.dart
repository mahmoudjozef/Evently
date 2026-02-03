class TaskModel {
  String title;

  String Description;

  int date;

  String id;

  String categry;

  TaskModel({
    required this.title,
    required this.Description,
    required this.date,
    this.id = '',
    required this.categry,
  });

  TaskModel.fromJson(Map<String, dynamic> json) :this(
    title: json['Title'],
    Description: json['Description'],
    date: json['date'],
    categry: json['categry'],
    id: json['id'],);


  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Description': Description,
      'date': date,
      'categry': categry,
      'id': id,
    };
  }


}

