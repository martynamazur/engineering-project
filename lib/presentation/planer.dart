import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ootd/domain/state_management/schedule_provider.dart';
import 'package:ootd/navigation/app_router.dart';

import '../model/schedule.dart';

@RoutePage()
class PlannerScreen extends StatefulWidget {
  @override
  _PlannerScreenState createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2, vsync: this); // Dwa widoki (miesięczny i tygodniowy)
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
        title: Text('Maj 2024'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Miesięczny"),
            Tab(text: "Tygodniowy"),
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

class MonthlyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7, // 7 kolumn dla dni tygodnia
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
      itemCount: 31, // liczba dni w miesiącu
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Text('${index + 1}'),
        );
      },
    );
  }
}

class WeeklyView extends ConsumerWidget {
  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedule = ref.watch(getScheduleForWeekProvider);

    return schedule.when(
      data: (data) {
        // Utworzenie mapy dni tygodnia i przypisanie zaplanowanych strojów
        final scheduleByDay = <String, List<Schedule>>{};
        for (var scheduleItem in data) {
          String dayKey = DateFormat('EEEE').format(scheduleItem.scheduleDate);
          scheduleByDay.putIfAbsent(dayKey, () => []).add(scheduleItem);
        }


        return ListView.builder(

          itemCount: daysOfWeek.length,
          itemBuilder: (context, index) {
            String currentDay = daysOfWeek[index];
            List<Schedule>? schedulesForDay = scheduleByDay[currentDay] ?? []; // Pobierz stroje dla danego dnias
            print("zaplanowane,$schedulesForDay");

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Container(
                height: 100,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text("${currentDay} "),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (schedulesForDay.isNotEmpty)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: schedulesForDay.map((scheduleForDay) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.blue,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              width: 50, // Ustaw szerokość kontenera
                              height: 300, // Ustaw wysokość kontenera
                              margin: EdgeInsets.symmetric(horizontal: 4.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  scheduleForDay.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      _imagePlaceholder(context),
                      SizedBox(width: 10),
                    ],
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
            style: TextStyle(fontSize: 16, color: Colors.red),
          ),
        );
      },
      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _imagePlaceholder(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.grey,
      child: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          context.router.push(AddOutfitToCallendarRoute());

        },
      ),
    );
  }
}
