import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:linear_progress_bar/ui/dots_indicator.dart';
import 'package:linear_progress_bar/utils/dots_decorator.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/domain/state_management/schedule_provider.dart';
import 'package:ootd/navigation/app_router.dart';

import '../model/schedule.dart';

enum WeekDay { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }

@RoutePage()
class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  _PlannerScreenState createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Dwa widoki (miesięczny i tygodniowy)
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(DateFormat('MMMM').format(DateTime.now()))),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: context.loc.monthlyHeader),
            Tab(text: context.loc.weeklyHeader),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MonthlyView(),
          WeeklyView(),
        ],
      ),
    );
  }
}

class MonthlyView extends ConsumerWidget {
  const MonthlyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedule = ref.watch(getScheduleForWeekProvider);
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day; // Liczba dni w miesiącu

    // Utworzenie mapy dni i zaplanowanych strojów (będziemy używać mapy, aby powiązać daty z zaplanowanymi strojami)
    Map<DateTime, List<Schedule>> schedulesByDay = {};

    schedule.when(
      data: (data) {
        for (var scheduleItem in data) {
          // Dodaj zaplanowany strój do odpowiedniego dnia
          DateTime date = DateTime(scheduleItem.scheduleDate.year,
              scheduleItem.scheduleDate.month, scheduleItem.scheduleDate.day);
          schedulesByDay.putIfAbsent(date, () => []).add(scheduleItem);
        }
      },
      loading: () => null,
      error: (err, stack) => null,
    );

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        childAspectRatio: 0.8
      ),
      itemCount: daysInMonth,
      itemBuilder: (context, index) {
        final day = index + 1;
        final date = DateTime(now.year, now.month, day);
        final schedulesForDay = schedulesByDay[date] ?? [];

        return GestureDetector(
          onTap: () {
            schedulesForDay.isEmpty
                ? context.router.push(
                    AddOutfitToCalendarRoute(selectedDate: date.toString()))
                : _showScheduleOptionsDialog(context, date, schedulesForDay, ref);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: schedulesForDay.isNotEmpty
                  ? Colors.green[100]
                  : Colors.white, // Kolor w tle  gdy są zaplanowane stroje
            ),
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$day', style: const TextStyle(fontWeight: FontWeight.bold)),
                if (schedulesForDay.isNotEmpty)
                  Expanded(
                    child: SizedBox(
                      height: 60, // Wysokość dla miniaturek (ustawiamy większą wysokość dla kilku miniaturek)
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: schedulesForDay.length,
                        itemBuilder: (context, scheduleIndex) {
                          final schedule = schedulesForDay[scheduleIndex];
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white70,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                schedule.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class WeeklyView extends ConsumerWidget {
  const WeeklyView({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedule = ref.watch(getScheduleForWeekProvider);

    List<DateTime> scheduleFullDate = getDatesForCurrentWeek();
    return schedule.when(
      data: (data) {
        // Utworzenie mapy dni tygodnia i przypisanie zaplanowanych strojów
        final scheduleByDay = <WeekDay, List<Schedule>>{};
        for (var scheduleItem in data) {
          WeekDay dayKey = WeekDay.values[
              scheduleItem.scheduleDate.weekday - 1]; // Przekształcenie do enum
          scheduleByDay.putIfAbsent(dayKey, () => []).add(scheduleItem);
        }

        return ListView.builder(
          itemCount: WeekDay.values.length,
          itemBuilder: (context, index) {
            WeekDay currentDay = WeekDay.values[index];
            List<Schedule>? schedulesForDay = scheduleByDay[currentDay] ??
                []; // Pobierz stroje dla danego dnias
            print("zaplanowane,$schedulesForDay");

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white70,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: ListTile(
                    title: Text("${currentDay.toString().split('.').last} "),
                    trailing: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (schedulesForDay.isNotEmpty)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: schedulesForDay.map((scheduleForDay) {
                                return GestureDetector(
                                  onTap: (){
                                    _showScheduleOptionsDialog(context, scheduleForDay.scheduleDate, schedulesForDay, ref);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.blue,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.white70,
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    width: 50, // Ustaw szerokość kontenera bialy
                                    height: 300,
                                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        scheduleForDay.imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          _addNewOutfitBtn(context, scheduleFullDate[index]),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      error: (err, stack) {
        return Center(
          child: Text(
            'Wystąpił błąd: $err',
            style: const TextStyle(fontSize: 16, color: Colors.red),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _addNewOutfitBtn(
    BuildContext context,
    DateTime scheduleFullDate,
  ) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        shape: BoxShape.rectangle,
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 1
        )
      ),
      child: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          context.router.push(AddOutfitToCalendarRoute(
              selectedDate: scheduleFullDate.toString()));
        },
      ),
    );
  }

  List<DateTime> getDatesForCurrentWeek() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Znajdź pierwszy dzień tygodnia (poniedziałek)
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));

    // Utwórz listę dat od poniedziałku do niedzieli
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }
}

void _showScheduleOptionsDialog(BuildContext context, DateTime date, List<Schedule> schedules,  WidgetRef ref) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(context.loc.yourOutfitsHeader),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScheduleGallery(schedules: schedules),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                context.router.push(AddOutfitToCalendarRoute(
                  selectedDate: date.toString(),
                ));

                context.maybePop();
              },
              child: Text(context.loc.addAnother),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(context.loc.close),
          ),
        ],
      );
    },
  );
}

class ScheduleGallery extends ConsumerStatefulWidget {
  final List<Schedule> schedules;


  const ScheduleGallery({
    super.key,
    required this.schedules,
  });

  @override
  ConsumerState<ScheduleGallery> createState() => _ScheduleGalleryState();
}

class _ScheduleGalleryState extends ConsumerState<ScheduleGallery> {
  late List<Schedule> _localSchedules;

  double _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _localSchedules = List.from(widget.schedules);

    _pageController = PageController()
      ..addListener(() {
        setState(() {
          _currentPage = _pageController.page ?? 0;
        });
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

  print(_localSchedules);
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _localSchedules.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final schedule = _localSchedules[index];
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        schedule.imageUrl,
                        fit: BoxFit.cover,
                        scale: 0.3,
                      ),
                    ),
                  ),
                  Positioned(
                    top:8,
                    right: 8,
                    child: Container(
                      color: Colors.amber,
                      child: IconButton (
                        onPressed: ()async{
                          ref.read(removeFromScheduleProvider(scheduleId:  schedule.id!));
                          setState(() {
                            _localSchedules.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 12.0),
        if (_localSchedules.length > 1)
          DotsIndicator(
            dotsCount: _localSchedules.length,
            position: _currentPage,
            decorator: const DotsDecorator(
              color: Colors.grey,
              activeColor: Colors.amber,
            ),
          ),
      ],
    );
  }
}


