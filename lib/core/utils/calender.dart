import 'package:employee_management/core/utils/app_colors.dart';
import 'package:employee_management/core/utils/assets.dart';
import 'package:employee_management/core/utils/strings.dart';
import 'package:employee_management/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/secondary_button.dart';

import 'package:intl/intl.dart'; // For date formatting

class Calender {

  static void showCalendarDialog(BuildContext context, {required Function(DateTime) datePick,
    required DateTime? fromDate, required bool isOpenFromToDate}) {
    showDialog(
      context: context,
      builder: (context) {

        DateTime focusedDay = DateTime.now();
        DateTime? pickedDay = isOpenFromToDate? fromDate :focusedDay;
        String? selectedButtonLabel = isOpenFromToDate?'No Date': 'Today'; // Track selected button

        void selectDate(DateTime date, String buttonLabel) {
          //print("ddd $date $buttonLabel");
          pickedDay =  date;
          selectedButtonLabel = buttonLabel;
        }

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColors.white,
              actionsPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.all(8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Reduce radius
              ),
              content: SizedBox(
                width: double.maxFinite,
                height: isOpenFromToDate? 420.sp : 450.sp,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //  Header Buttons (Today, Next Monday, etc.)
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          isOpenFromToDate?
                          Expanded(
                            flex: 1,
                            child: _buildHeaderButton(context, "No Date", () {
                              setState(() {
                                selectDate(_getNextMonday(),"No Date");
                              });
                            },selectedButtonLabel=='No Date'),
                          ):SizedBox(),
                          SizedBox(width: isOpenFromToDate? 8.sp:0,),
                          Expanded(
                            flex: 1,
                            child: _buildHeaderButton(context, "Today", () {
                              setState(() {
                                selectDate(DateTime.now(),"Today");
                              });
                            },selectedButtonLabel=='Today'),
                          ),
                          SizedBox(width: !isOpenFromToDate? 8.sp:0,),
                         !isOpenFromToDate? Expanded(
                            flex: 1,
                            child: _buildHeaderButton(context, "Next Monday", () {
                              setState(() {
                                selectDate(_getNextMonday(),"Next Monday");
                              });
                            },selectedButtonLabel=='Next Monday'),
                          ):SizedBox(),

                        ],
                      ),
                    ),
                    isOpenFromToDate?SizedBox():Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            flex: 1,
                            child: _buildHeaderButton(context, "Next Tuesday", () {
                              setState(() {
                                selectDate(_getNextTuesday(),"Next Tuesday");
                              });
                            },selectedButtonLabel=="Next Tuesday"),
                          ),
                          SizedBox(width: 8.sp,),
                          Expanded(
                            flex: 1,
                            child: _buildHeaderButton(context, "After 1 week", () {
                              setState(() {
                                selectDate(DateTime.now().add(Duration(days: 7)),"After 1 week");
                              });
                            },selectedButtonLabel=="After 1 week"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.sp),

                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        child: TableCalendar(
                          daysOfWeekStyle: DaysOfWeekStyle(
                            weekdayStyle: TextStyle(fontSize:12.sp,color: AppColors.formTextColor),
                             weekendStyle: TextStyle(fontSize:12.sp,color: AppColors.formTextColor)
                          ),
                          headerStyle: HeaderStyle(
                            headerMargin: EdgeInsets.only(bottom: 12.sp),
                            formatButtonVisible: false, // Hide format button
                            titleCentered: true, // Center the title
                            leftChevronMargin: EdgeInsets.zero,
                            leftChevronPadding: EdgeInsets.only(left: 48.sp),
                            rightChevronMargin: EdgeInsets.zero,
                            rightChevronPadding: EdgeInsets.only(right: 48.sp),
                            titleTextStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.formTextColor, // Change text color
                            ),
                            leftChevronIcon: SvgPicture.asset(AssetsPath.indicatorLeft), // Custom left arrow
                            rightChevronIcon:SvgPicture.asset(AssetsPath.indicatorRight), // Custom right arrow
                            headerPadding: EdgeInsets.all(4.0),

                          ),calendarStyle: CalendarStyle(
                            cellMargin: EdgeInsets.all(1.sp),

                            cellPadding:  EdgeInsets.all(0.sp),
                            selectedDecoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryColor
                            ),todayDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(color: AppColors.primaryColor)

                        ),
                            todayTextStyle: TextStyle(color: AppColors.primaryColor,fontSize: 12.sp),
                            disabledTextStyle: TextStyle(color: AppColors.greyBorderColor,
                                fontSize: 12.sp)
                        ),
                          firstDay: DateTime.utc(2000, 1, 1),
                          lastDay: DateTime.utc(2100, 12, 31),

                         // focusedDay: pickedDay==null?focusedDay:null,
                          enabledDayPredicate: (day) {
                            if (fromDate != null) {
                              return day.isAfter(fromDate.subtract(Duration(days: 1)));
                            }
                            return true;
                          },
                          selectedDayPredicate: (day) {
                            return pickedDay != null && isSameDay(pickedDay!, day);
                          },

                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              if(focusedDay==selectedDay && !isOpenFromToDate){
                                selectedButtonLabel="Today";
                              }
                              selectDate(selectedDay,selectedButtonLabel??'');
                            });
                          }, focusedDay: pickedDay??focusedDay,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),


                  ],
                ),
              ),
              actions: [
                Container(
                  height: 1.0,
                  color: AppColors.bgColor,
                ),
                SizedBox(height: 8.sp,),
                Padding(
                  padding:  EdgeInsets.only(left: 8.sp,right: 8.sp,bottom: 14.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: SvgPicture.asset(AssetsPath.calender),
                            ),
                            SizedBox(width: 6.sp),
                            Text(
                              pickedDay != null ? DateFormat("d MMM yyyy").format(pickedDay!) : "No Date",
                              style: TextStyle(fontSize: 14.sp,color: AppColors.formTextColor,) // Change text color),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          SecondaryButton(
                            smallButton: true,
                            label: Strings.cancel,
                            callback: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: 8.sp,),
                          PrimaryButton(
                            smallButton: true,
                            label: Strings.save,
                            callback: () {
                              if (pickedDay != null) {
                                datePick(pickedDay!);
                              }
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )


              ],
            );
          },
        );
      },
    );
  }



  /// 🔹 Helper Method for Buttons
  static Widget _buildHeaderButton(BuildContext context, String label, VoidCallback onTap,bool isSelected) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          textStyle: TextStyle(fontSize: 12.sp),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          backgroundColor: isSelected ? AppColors.primaryColor : AppColors.lightSkyColor , // Toggle color
          foregroundColor: isSelected ? AppColors.white : AppColors.primaryColor, // Text color toggle
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        onPressed: onTap,
        child: Text(label),
      ),
    );
  }

  ///  Get Next Monday's Date
  static DateTime _getNextMonday() {
    DateTime now = DateTime.now();
    return now.add(Duration(days: (8 - now.weekday) % 7));
  }

  /// Get Next Tuesday's Date
  static DateTime _getNextTuesday() {
    DateTime now = DateTime.now();
    return now.add(Duration(days: (9 - now.weekday) % 7));
  }
}

