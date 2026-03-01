import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_new/fireBase/FireBase_Functions.dart';
import 'package:evently_new/model/task_model.dart';
import 'package:evently_new/providers/home_page_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<String> photos = [
    'Birthday',
    'Book Club',
    'Exhibition',
    'Sport',
    'Meeting',
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      builder: (context, child) {
        var homePageProvider = Provider.of<HomePageProvider>(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => homePageProvider.ChangeCategory(index),
                    child: Chip(
                      backgroundColor: index == homePageProvider.photosIndex
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      label: Text(
                        photos[index],
                        style: TextStyle(
                          color: index == homePageProvider.photosIndex
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      side: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(width: 10),
                  itemCount: photos.length,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: StreamBuilder<QuerySnapshot<TaskModel>>(
                  stream: FirebaseFunctions.getTasks(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return const Center(child: Text("Something went wrong"));
                    }
                    var tasks = snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
                    
                    if (tasks.isEmpty) {
                      return const Center(child: Text("No Events Found"));
                    }

                    return ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(height: 20),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        var task = tasks[index];
                        return Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage('assets/images/AddEvent/${task.category}.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        DateTime.fromMicrosecondsSinceEpoch(task.date)
                                            .toString()
                                            .substring(0, 10),
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(task.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                                          GestureDetector(
                                            onTap: () {
                                              task.isFavorite = !task.isFavorite;
                                              FirebaseFunctions.updateTask(task);
                                            },
                                            child: Icon(
                                              task.isFavorite ? Icons.favorite : Icons.favorite_border,
                                              color: Theme.of(context).colorScheme.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
