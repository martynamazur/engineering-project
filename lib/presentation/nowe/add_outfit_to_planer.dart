
/*
Ekran na ktorym wyswietla sie lista utworzonych, dostepnych strojow
mozna wybrac 1 stroj a po kliknieciu dalej wracam do kalendarza
 */
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/navigation/app_router.dart';

import '../../domain/state_management/outfit_list_notifier.dart';



@RoutePage()
class AddOutfitToCallendarScreen extends ConsumerStatefulWidget {
  const AddOutfitToCallendarScreen({super.key});

  @override
  ConsumerState<AddOutfitToCallendarScreen> createState() =>
      _CreatedOutfitsScreenState();
}

class _CreatedOutfitsScreenState extends ConsumerState<AddOutfitToCallendarScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int? _selectedOutfitId;
  bool _isChoosen = false;
  int _lastPage = 3;
  @override
  Widget build(BuildContext context) {

    int? selectedOutfitId;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Outfit for a day'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _buildOutfitList()),
            if (_isChoosen) _navigation()
          ],
        )

      ),
    );
  }

  Widget _navigation() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
              onPressed: () {
              },
              child: Text('Anuluj')),
        ),
        SizedBox(width: 12.0,),
        Expanded(
          child: OutlinedButton(
              onPressed: () {

              },
              child: Text('Save')),
        )
      ],
    );
  }
  Widget _buildOutfitList(){
    final outfitState = ref.watch(outfitListNotifierProvider);


    return outfitState.when(
      data: (data) {
        if (data.isEmpty) {
          return Center(
            child: Text(
              'Brak danych do wyświetlenia',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                    _isChoosen = !_isChoosen;
                    _currentPage++;
                  });

                },
                child: Container(
                  decoration:  BoxDecoration(
                    border: Border.all(color: outfit.id == _selectedOutfitId ? Colors.green :  Colors.white, width: 5.0),
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

}
