import 'package:easy_localization/easy_localization.dart';
import 'package:evently_new/Screens/Home/Taps/Home.dart';
import 'package:evently_new/class/colors.dart';
import 'package:evently_new/model/task_model.dart';
import 'package:evently_new/providers/addEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddEventSceren extends StatelessWidget {
  AddEventSceren({super.key});

  static const String routeNamed = 'AddEventSceren';
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
  var TitleController = TextEditingController();
  var DescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddEventProv(),
      builder: (context, child) {
        var AddEventProvider = Provider.of<AddEventProv>(context);

        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text('AddEvent'.tr()),
            titleTextStyle: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
            iconTheme: IconThemeData(
              color: Theme.of(context).brightness == Brightness.light
                  ? Theme.of(context).colorScheme.primary
                  : Colors.white,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  //Images
                  Image.asset(
                    Theme.of(context).brightness == Brightness.light
                        ? 'assets/images/AddEvent/${Photos[AddEventProvider.photosIndex]}.png'
                        : 'assets/images/AddEvent/${PhotosDark[AddEventProvider.photosIndex]}Dark.png',
                  ),
                  SizedBox(height: 20),
                  //Chips
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            AddEventProvider.ChangePhotos(index);
                          },
                          child: Chip(
                            //BackGroudColor
                            backgroundColor:
                                index == AddEventProvider.photosIndex
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).brightness ==
                                      Brightness.light
                                ? Colors.transparent
                                : Color(0xff001440),
                            //labelAndStyle
                            label: Text(
                              Theme.of(context).brightness == Brightness.light
                                  ? Photos[index].tr()
                                  : PhotosDark[index].tr(),
                              style: TextStyle(
                                color: index == AddEventProvider.photosIndex
                                    ? Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.white
                                          : Colors.black
                                    : Theme.of(context).brightness ==
                                          Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: index == AddEventProvider.photosIndex
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            //Border
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(50),
                            ),
                            side: BorderSide(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Color(0xff002D8F),
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10),
                        itemCount: Photos.length,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  //TextFields
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'title'.tr(),
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(context).brightness == Brightness.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      TextField(
                        controller: TitleController,
                        style: TextStyle(color: Color(0xffD6D6D6)),
                        decoration: InputDecoration(
                          //back colors
                          filled: true,
                          fillColor:
                              Theme.of(context).brightness == Brightness.light
                              ? Colors.white
                              : Color(0xff001440),
                          //hintText
                          hintText: 'Event Title'.tr(),
                          hintStyle: TextStyle(color: Color(0xffD6D6D6)),
                          //Borders
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Description'.tr(),
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(context).brightness == Brightness.light
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      TextField(
                        controller: DescriptionController,
                        maxLines: 5,
                        style: TextStyle(color: Color(0xffD6D6D6)),
                        decoration: InputDecoration(
                          //back colors
                          filled: true,
                          fillColor:
                              Theme.of(context).brightness == Brightness.light
                              ? Colors.white
                              : Color(0xff001440),
                          //hintText
                          hintText: 'Event Description....'.tr(),
                          hintStyle: TextStyle(color: Color(0xffD6D6D6)),
                          //Borders
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Date/Time/ElevatedButton
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset('assets/images/AddEvent/calendar-add.png'),
                      SizedBox(height: 8),
                      SizedBox(width: 8),

                      Text(
                        'Event Date'.tr(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                            initialDate: AddEventProvider.Date,
                          );
                          AddEventProvider.ChangeDate(date!);
                        },

                        child: Text(
                          '${AddEventProvider.Date.toString().substring(0, 10)}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset('assets/images/AddEvent/clock.png'),
                      SizedBox(height: 32),
                      SizedBox(width: 8),

                      Text(
                        'Event Time'.tr(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),

                      Text(
                        '11:22 PM',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,

                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Container(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        AddEventProvider.AddEvent(
                          TaskModel(
                            title: TitleController.text,
                            Description: DescriptionController.text,
                            date: AddEventProvider.Date.microsecondsSinceEpoch,
                            categry: Photos[AddEventProvider.photosIndex],
                          ),
                        );
                      },

                      child: Text(
                        'Update event',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
