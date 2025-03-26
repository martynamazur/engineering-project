
/*
Ekran na ktorym wyswietla sie lista utworzonych, dostepnych strojow
mozna wybrac 1 stroj a po kliknieciu dalej wracam do kalendarza
 */
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ootd/domain/state_management/schedule_provider.dart';
import 'package:ootd/navigation/app_router.dart';

import '../domain/state_management/outfit_list_notifier.dart';
import '../model/schedule.dart';

@RoutePage()
class AddOutfitToCalendarScreen extends ConsumerStatefulWidget {
  final String selectedDate;

  const AddOutfitToCalendarScreen({super.key, @PathParam('selectedDate') required this.selectedDate});

  @override
  ConsumerState<AddOutfitToCalendarScreen> createState() =>
      _AddOutfitToCallendarScreenState();
}

class _AddOutfitToCallendarScreenState extends ConsumerState<AddOutfitToCalendarScreen> {
  int? _selectedOutfitId;
  bool _isChoosen = false;
  Schedule? _schedule;
  late String _outfitUrl;
  late DateTime parsedDate;

  @override
  void initState() {
    super.initState();
    parsedDate = DateTime.parse(widget.selectedDate);
    _outfitUrl = "";

    //final now = DateTime.now();
    //final formattedDate = DateFormat('yyyy-MM-dd').format(now);

    // Inicjalizacja obiektu Schedule
    _schedule = Schedule(
      scheduleDate: parsedDate,
      scheduleTime: "10:30",
      outfitId: null,
      imageUrl: "",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Outfit for a day'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _buildOutfitList()),
            if (_isChoosen) _navigation(),
          ],
        ),
      ),
    );
  }

  Widget _navigation() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              context.router.maybePop();
            },
            child: const Text('Anuluj'),
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: OutlinedButton(
            onPressed: () async {
              if (_schedule != null && _selectedOutfitId != null) {
                final updatedSchedule = _schedule!.copyWith(
                  outfitId: _selectedOutfitId,
                  imageUrl: _outfitUrl,
                );
                ref.read(scheduleOutfitProvider(updatedSchedule));
                context.router.maybePop();
              }
            },
            child: const Text('Save'),
          ),
        ),
      ],
    );
  }

  Widget _buildOutfitList() {
    final outfitState = ref.watch(outfitListNotifierProvider);

    return outfitState.when(
      data: (data) {
        if (data.isEmpty) {
          return const Center(
            child: Text(
              'Brak danych do wyświetlenia',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final outfit = data[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedOutfitId = outfit.id;
                    _outfitUrl = outfit.imageUrl;
                    _isChoosen = true;

                    // Tworzenie nowego obiektu Schedule z wybranym strojem
                    _schedule = _schedule?.copyWith(
                      outfitId: _selectedOutfitId,
                      imageUrl: _outfitUrl,
                    );
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: outfit.id == _selectedOutfitId ? Colors.green : Colors.white,
                      width: 5.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    outfit.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
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
}
