import 'package:konsuldok/ui/pages/constant/constant.dart';
import 'package:konsuldok/ui/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_calendar_widget/date_helper.dart';
import 'package:horizontal_calendar_widget/horizontal_calendar.dart';
import 'package:page_transition/page_transition.dart';

const labelMonth = 'Month';
const labelDate = 'Date';
const labelWeekDay = 'Week Day';

class DoctorTimeSlot extends StatefulWidget {
  final String doctorName, doctorImage, doctorType, experience;

  const DoctorTimeSlot(
      {Key key,
      @required this.doctorName,
      @required this.doctorImage,
      @required this.doctorType,
      @required this.experience})
      : super(key: key);
  @override
  _DoctorTimeSlotState createState() => _DoctorTimeSlotState();
}

class _DoctorTimeSlotState extends State<DoctorTimeSlot> {
  String selectedTime = '';
  String selectedDate;
  String monthString;
  final morningSlotList = [
    {'time': '8:00 AM'},
    {'time': '8:30 AM'},
    {'time': '9:00 AM'},
    {'time': '9:30 AM'},
    {'time': '10:00 AM'},
    {'time': '10:30 AM'},
    {'time': '11:00 AM'},
    {'time': '11:30 AM'}
  ];

  final afternoonSlotList = [
    {'time': '12:30 PM'},
    {'time': '1:00 PM'},
    {'time': '1:30 PM'},
    {'time': '2:00 PM'},
    {'time': '2:30 PM'},
    {'time': '3:00 PM'},
    {'time': '3:30 PM'},
    {'time': '4:00 PM'},
    {'time': '4:30 PM'},
    {'time': '5:00 PM'},
    {'time': '5:30 PM'},
    {'time': '6:00 PM'}
  ];

  final eveningSlotList = [
    {'time': '8:00 PM'},
    {'time': '8:30 PM'},
    {'time': '9:00 PM'},
    {'time': '9:30 PM'},
    {'time': '10:00 PM'},
    {'time': '10:30 PM'}
  ];

  DateTime firstDate;
  DateTime lastDate;
  String dateFormat = 'dd';
  String monthFormat = 'MMM';
  String weekDayFormat = 'EEE';
  List<String> order = [labelMonth, labelDate, labelWeekDay];
  bool forceRender = false;

  Color defaultDecorationColor = Colors.transparent;
  BoxShape defaultDecorationShape = BoxShape.circle;
  bool isCircularRadiusDefault = true;

  Color selectedDecorationColor = primaryColor;
  BoxShape selectedDecorationShape = BoxShape.circle;
  bool isCircularRadiusSelected = true;

  Color disabledDecorationColor = Colors.grey;
  BoxShape disabledDecorationShape = BoxShape.circle;
  bool isCircularRadiusDisabled = true;

  int minSelectedDateCount = 1;
  int maxSelectedDateCount = 1;
  RangeValues selectedDateCount;

  List<DateTime> initialSelectedDates;

  @override
  void initState() {
    super.initState();
    const int days = 30;
    firstDate = toDateMonthYear(DateTime.now());
    lastDate = toDateMonthYear(firstDate.add(Duration(days: days - 1)));
    selectedDateCount = RangeValues(
      minSelectedDateCount.toDouble(),
      maxSelectedDateCount.toDouble(),
    );
    initialSelectedDates = feedInitialSelectedDates(minSelectedDateCount, days);
    setState(() {
      selectedDate =
          '${firstDate.day}-${convertNumberMonthToStringMonth(firstDate.month)}';
    });
  }

  List<DateTime> feedInitialSelectedDates(int target, int calendarDays) {
    List<DateTime> selectedDates = List();

    for (int i = 0; i < calendarDays; i++) {
      if (selectedDates.length == target) {
        break;
      }
      DateTime date = firstDate.add(Duration(days: i));
      if (date.weekday != DateTime.sunday) {
        selectedDates.add(date);
      }
    }
    return selectedDates;
  }

  String convertNumberMonthToStringMonth(month) {
    if (month == 1) {
      monthString = 'January';
    } else if (month == 2) {
      monthString = 'Fabruary';
    } else if (month == 3) {
      monthString = 'March';
    } else if (month == 4) {
      monthString = 'April';
    } else if (month == 5) {
      monthString = 'May';
    } else if (month == 6) {
      monthString = 'June';
    } else if (month == 7) {
      monthString = 'July';
    } else if (month == 8) {
      monthString = 'August';
    } else if (month == 9) {
      monthString = 'September';
    } else if (month == 10) {
      monthString = 'October';
    } else if (month == 11) {
      monthString = 'November';
    } else if (month == 12) {
      monthString = 'December';
    }
    return monthString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        titleSpacing: 0.0,
        elevation: 0.0,
        title: Text(
          'Time Slots',
          style: appBarTitleTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: (selectedTime == '')
          ? Container(
              height: 0.0,
              width: 0.0,
            )
          : Material(
              elevation: 5.0,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: 70.0,
                padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                alignment: Alignment.center,
                child: InkWell(
                  borderRadius: BorderRadius.circular(15.0),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 600),
                            child: ConsultationDetail(
                              doctorName: widget.doctorName,
                              doctorType: widget.doctorType,
                              doctorExp: widget.experience,
                              doctorImage: widget.doctorImage,
                              date: selectedDate,
                              time: selectedTime,
                            )));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: primaryColor,
                    ),
                    child: Text(
                      'Book now',
                      style: whiteColorButtonTextStyle,
                    ),
                  ),
                ),
              ),
            ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 1.0,
            child: Container(
              color: whiteColor,
              padding: EdgeInsets.only(top: fixPadding * 2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: widget.doctorImage,
                          child: Container(
                            width: 76.0,
                            height: 76.0,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(38.0),
                              border:
                                  Border.all(width: 0.3, color: primaryColor),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                  color: Colors.grey[300],
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(widget.doctorImage),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                        widthSpace,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Dr. ${widget.doctorName}',
                                      style: blackNormalBoldTextStyle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Wrap(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  duration: Duration(
                                                      milliseconds: 600),
                                                  type: PageTransitionType.fade,
                                                  child: DoctorProfile(
                                                    doctorImage:
                                                        widget.doctorImage,
                                                    doctorName:
                                                        widget.doctorName,
                                                    doctorType:
                                                        widget.doctorType,
                                                    experience:
                                                        widget.experience,
                                                  )));
                                        },
                                        child: Text(
                                          'View Profile',
                                          style: primaryColorsmallBoldTextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 7.0),
                              Text(
                                widget.doctorType,
                                style: greyNormalTextStyle,
                              ),
                              SizedBox(height: 7.0),
                              Text(
                                '${widget.experience} Years Experience',
                                style: primaryColorNormalTextStyle,
                              ),
                              SizedBox(height: 7.0),
                              Text(
                                '\$39',
                                style: blackHeadingTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  HorizontalCalendar(
                    key: forceRender ? UniqueKey() : Key('Calendar'),
                    selectedDateTextStyle: TextStyle(color: whiteColor),
                    selectedMonthTextStyle: TextStyle(color: whiteColor),
                    selectedWeekDayTextStyle: TextStyle(color: whiteColor),
                    spacingBetweenDates: 10.0,
                    height: 105,
                    padding: EdgeInsets.all(fixPadding * 2.0),
                    firstDate: firstDate,
                    lastDate: lastDate,
                    dateFormat: dateFormat,
                    weekDayFormat: weekDayFormat,
                    monthFormat: monthFormat,
                    defaultDecoration: BoxDecoration(
                      color: defaultDecorationColor,
                      shape: defaultDecorationShape,
                      borderRadius:
                          defaultDecorationShape == BoxShape.rectangle &&
                                  isCircularRadiusDefault
                              ? BorderRadius.circular(8)
                              : null,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: selectedDecorationColor,
                      shape: selectedDecorationShape,
                      borderRadius:
                          selectedDecorationShape == BoxShape.rectangle &&
                                  isCircularRadiusSelected
                              ? BorderRadius.circular(8)
                              : null,
                    ),
                    disabledDecoration: BoxDecoration(
                      color: disabledDecorationColor,
                      shape: disabledDecorationShape,
                      borderRadius:
                          disabledDecorationShape == BoxShape.rectangle &&
                                  isCircularRadiusDisabled
                              ? BorderRadius.circular(8)
                              : null,
                    ),
                    isDateDisabled: (date) => date.weekday == DateTime.sunday,
                    labelOrder: order.map(toLabelType).toList(),
                    minSelectedDateCount: minSelectedDateCount,
                    maxSelectedDateCount: maxSelectedDateCount,
                    initialSelectedDates: initialSelectedDates,
                    onDateSelected: (e) async {
                      setState(() {
                        selectedDate =
                            '${e.day}-${convertNumberMonthToStringMonth(e.month)}';
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: slots(),
          ),
        ],
      ),
    );
  }

  LabelType toLabelType(String label) {
    LabelType type;
    switch (label) {
      case labelMonth:
        type = LabelType.month;
        break;
      case labelDate:
        type = LabelType.date;
        break;
      case labelWeekDay:
        type = LabelType.weekday;
        break;
    }
    return type;
  }

  slots() {
    return ListView(
      children: [
        heightSpace,
        // Morning Slot Start
        Container(
          padding: EdgeInsets.only(
              bottom: fixPadding * 2.0,
              right: fixPadding * 2.0,
              left: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/icons/sunrise.png',
                height: 35.0,
                width: 35.0,
                fit: BoxFit.cover,
              ),
              widthSpace,
              Text(
                '${morningSlotList.length} Slots',
                style: blackNormalBoldTextStyle,
              )
            ],
          ),
        ),
        Wrap(
          children: morningSlotList
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(
                      left: fixPadding * 2.0, bottom: fixPadding * 2.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedTime = e['time'];
                      });
                    },
                    child: Container(
                      width: 90.0,
                      padding: EdgeInsets.all(fixPadding),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(width: 0.7, color: greyColor),
                        color: (e['time'] == selectedTime)
                            ? primaryColor
                            : whiteColor,
                      ),
                      child: Text(e['time'],
                          style: (e['time'] == selectedTime)
                              ? whiteColorNormalTextStyle
                              : primaryColorNormalTextStyle),
                    ),
                  ),
                ),
              )
              .toList()
              .cast<Widget>(),
        ),

        // Morning Slot End

        // Afternoon Slot Start
        Container(
          padding: EdgeInsets.only(
              bottom: fixPadding * 2.0,
              right: fixPadding * 2.0,
              left: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/icons/sun.png',
                height: 35.0,
                width: 35.0,
                fit: BoxFit.cover,
              ),
              widthSpace,
              Text(
                '${afternoonSlotList.length} Slots',
                style: blackNormalBoldTextStyle,
              )
            ],
          ),
        ),
        Wrap(
          children: afternoonSlotList
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(
                      left: fixPadding * 2.0, bottom: fixPadding * 2.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedTime = e['time'];
                      });
                    },
                    child: Container(
                      width: 90.0,
                      padding: EdgeInsets.all(fixPadding),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(width: 0.7, color: greyColor),
                        color: (e['time'] == selectedTime)
                            ? primaryColor
                            : whiteColor,
                      ),
                      child: Text(e['time'],
                          style: (e['time'] == selectedTime)
                              ? whiteColorNormalTextStyle
                              : primaryColorNormalTextStyle),
                    ),
                  ),
                ),
              )
              .toList()
              .cast<Widget>(),
        ),
        // Afternoon Slot End

        // Evening Slot Start
        Container(
          padding: EdgeInsets.only(
              bottom: fixPadding * 2.0,
              right: fixPadding * 2.0,
              left: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/icons/sun-night.png',
                height: 35.0,
                width: 35.0,
                fit: BoxFit.cover,
              ),
              widthSpace,
              Text(
                '${eveningSlotList.length} Slots',
                style: blackNormalBoldTextStyle,
              )
            ],
          ),
        ),
        Wrap(
          children: eveningSlotList
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(
                      left: fixPadding * 2.0, bottom: fixPadding * 2.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedTime = e['time'];
                      });
                    },
                    child: Container(
                      width: 90.0,
                      padding: EdgeInsets.all(fixPadding),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(width: 0.7, color: greyColor),
                        color: (e['time'] == selectedTime)
                            ? primaryColor
                            : whiteColor,
                      ),
                      child: Text(e['time'],
                          style: (e['time'] == selectedTime)
                              ? whiteColorNormalTextStyle
                              : primaryColorNormalTextStyle),
                    ),
                  ),
                ),
              )
              .toList()
              .cast<Widget>(),
        ),
        // Evening Slot End
      ],
    );
  }
}
