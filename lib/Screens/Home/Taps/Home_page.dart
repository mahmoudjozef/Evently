import 'package:evently_new/providers/home_page_Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<String> Photos = [
    'Birthday',
    'Book Club',
    'Exhibition',
    'Sport',
    'Meeting',
  ];
  List<String> PhotosDark = [
    'Birthday',
    'Book Club',
    'Exhibition',
    'Sport',
    'Meeting',
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {    var provider = HomePageProvider();
      provider.loadTasks();
      return provider;},
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
                    onTap: () {
                      homePageProvider.ChangeCategory(index);
                    },
                    child: Chip(
                      //BackGroudColor
                      backgroundColor: index == homePageProvider.photosIndex
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).brightness == Brightness.light
                          ? Colors.transparent
                          : Color(0xff001440),
                      //labelAndStyle
                      label: Text(
                        Theme.of(context).brightness == Brightness.light
                            ? Photos[index]
                            : PhotosDark[index],
                        style: TextStyle(
                          color: index == homePageProvider.photosIndex
                              ? Theme.of(context).brightness == Brightness.light
                              ? Colors.white
                              : Colors.black
                              : Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: index == homePageProvider.photosIndex
                            ? Colors.white
                            : Colors.black,
                      ),
                      //Border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(50),
                      ),
                      side: BorderSide(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Color(0xff002D8F),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: Photos.length,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 20),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(16),
                            child: Image.asset(
                              'assets/images/AddEvent/${Photos[homePageProvider.photosIndex]}.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 66,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF4F7FF),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text('22 jun'),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 327,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF4F7FF),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('This is a Birthday Party'),
                                      Icon(Icons.favorite_border),
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
