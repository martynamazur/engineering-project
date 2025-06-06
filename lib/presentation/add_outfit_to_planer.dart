
/*
Ekran na ktorym wyswietla sie lista utworzonych, dostepnych strojow
mozna wybrac 1 stroj a po kliknieciu dalej wracam do kalendarza
 */
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/domain/state_management/schedule_provider.dart';
import 'package:ootd/utils/image_loading_builder.dart';

import '../domain/state_management/outfit_list_notifier.dart';
import '../model/schedule.dart';

@RoutePage()
class AddOutfitToCalendarScreen extends ConsumerStatefulWidget {
  final String _selectedDate;

  const AddOutfitToCalendarScreen({super.key, @PathParam('selectedDate') required String selectedDate}) : _selectedDate = selectedDate;

  @override
  ConsumerState<AddOutfitToCalendarScreen> createState() =>
      _AddOutfitToCallendarScreenState();
}

class _AddOutfitToCallendarScreenState extends ConsumerState<AddOutfitToCalendarScreen> {

  int? _selectedOutfitId;
  Schedule? _schedule;
  late String _outfitUrl;
  late DateTime parsedDate;

  @override
  void initState() {
    super.initState();
    parsedDate = DateTime.parse(widget._selectedDate);
    _outfitUrl = "";

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
        title: Text(context.loc.pickOutfitMessage),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _buildOutfitList()),
            if (_selectedOutfitId != null) _buildNavigationBtn(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationBtn() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              context.router.maybePop();
            },
            child: Text(context.loc.cancel),
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: OutlinedButton(
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              final updatedSchedule = _schedule!.copyWith(
                outfitId: _selectedOutfitId,
                imageUrl: _outfitUrl,
              );
              final result = await ref.read(scheduleOutfitProvider(schedule: updatedSchedule).future);

              if(result.success){
                messenger.showSnackBar(SnackBar(content: Text(context.loc.scheduleSuccessMessage)));
                ref.invalidate(getScheduleForWeekProvider);
                ref.invalidate(getScheduleForMonthProvider);
              }else{
                messenger.showSnackBar(SnackBar(content: Text(context.loc.scheduleErrorMessage)));
              }
              if(mounted){
                context.router.maybePop();
              }

            },
            child: Text(context.loc.save),
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
          return Center(
            child: Text(
              context.loc.noDataToDisplayMessage,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
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
                    loadingBuilder: imageLoadingBuilder,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image);
                    },
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
