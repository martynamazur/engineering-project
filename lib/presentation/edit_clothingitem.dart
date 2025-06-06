import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/domain/state_management/clothes_provider.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/model/clothing_item.dart';
import 'package:ootd/presentation/season_picker.dart';
import 'package:ootd/presentation/styles/pick_category.dart';


@RoutePage()
class EditClothingitemScreen extends ConsumerStatefulWidget {
  final ClothingItem clothingItem;


  EditClothingitemScreen({super.key, required this.clothingItem});

  @override
  ConsumerState createState() => _EditClothingitemState();
}

class _EditClothingitemState extends ConsumerState<EditClothingitemScreen> {


  late List<Season> _editSeasons;
  int? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    _editSeasons = List.from(widget.clothingItem.seasons ?? []);
    _selectedCategoryId = widget.clothingItem.itemCategoryId;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.edit),
        actions: [
          TextButton(
            onPressed: () async{
              final result = await ref.read(editClothingItemProvider(clothingItemId: widget.clothingItem.clothingItemId! ,newCategoryId:  _selectedCategoryId!,newSeasons:  _editSeasons).future);
              if(result.success){

              }
              },
            child: Row(
              children: [
                const Icon(Icons.save_as_sharp),
                Text(context.loc.save)
              ],
            ),

          )

        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                PickCategoryWidget(
                  _selectedCategoryId,
                  (newCategoryId) {
                    setState(() {
                      print(_selectedCategoryId);
                      _selectedCategoryId = newCategoryId;
                      print(_selectedCategoryId);
                    });
                  },
                ),
                SeasonPicker(
                    _editSeasons,
                    (newSeasons){
                      setState(() {
                        _editSeasons = (widget.clothingItem.seasons ?? []).whereType<Season>().toList();
                      });

                })
              ],
            ),
          )
      ),
    );
  }
}
