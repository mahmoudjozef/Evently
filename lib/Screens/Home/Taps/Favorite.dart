import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_new/fireBase/FireBase_Functions.dart';
import 'package:evently_new/model/task_model.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? const Color(0xffF2F5FF)
          : const Color(0xff101127),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Search Bar
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search for event',
                hintStyle: const TextStyle(color: Color(0xff143EAB)),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xff143EAB),
                  size: 30,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xff143EAB)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xff143EAB)),
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot<TaskModel>>(
                stream: FirebaseFunctions.getFavoriteTasks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text("Something went wrong"));
                  }

                  var tasks =
                      snapshot.data?.docs
                          .map((doc) => doc.data())
                          .where(
                            (task) =>
                                task.title.toLowerCase().contains(searchQuery),
                          )
                          .toList() ??
                      [];

                  if (tasks.isEmpty) {
                    return const Center(
                      child: Text("No Favorite Events Found"),
                    );
                  }

                  return ListView.separated(
                    itemCount: tasks.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      var task = tasks[index];
                      return Container(
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xff143EAB)),
                        ),
                        child: Stack(
                          children: [
                            // Event Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/AddEvent/${task.category}.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  DateTime.fromMicrosecondsSinceEpoch(
                                        task.date,
                                      ).toString().substring(8, 10) +
                                      " " +
                                      _getMonthName(
                                        DateTime.fromMicrosecondsSinceEpoch(
                                          task.date,
                                        ).month,
                                      ),
                                  style: const TextStyle(
                                    color: Color(0xff143EAB),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        task.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        task.isFavorite = !task.isFavorite;
                                        FirebaseFunctions.updateTask(task);
                                      },
                                      child: Icon(
                                        task.isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: const Color(0xff143EAB),
                                        size: 28,
                                      ),
                                    ),
                                  ],
                                ),
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
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[month - 1];
  }
}
