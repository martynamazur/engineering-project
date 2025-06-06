import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/domain/state_management/clothes_provider.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:ootd/model/clothing_item.dart';
import 'package:ootd/utils/image_loading_builder.dart';

import '../navigation/app_router.dart';

@RoutePage()
class ClothingItemOverviewScreen extends ConsumerStatefulWidget {
  final ClothingItem clothingItem;
  const ClothingItemOverviewScreen(this.clothingItem, {super.key});

  @override
  ConsumerState<ClothingItemOverviewScreen> createState() => _ClothingItemOverviewScreenState();
}

class _ClothingItemOverviewScreenState extends ConsumerState<ClothingItemOverviewScreen> {
@override
  Widget build(BuildContext context) {
  int? selectedValue;
    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton(
              icon: const Icon(Icons.edit),
              value: selectedValue,
              items: [
                DropdownMenuItem(value: 1, child: Text(context.loc.edit)),
                DropdownMenuItem(value: 2, child: Text(context.loc.delete)),
              ],
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });

                switch(value){
                  case 1:
                    context.router.push(EditClothingitemRoute(clothingItem: widget.clothingItem));
                    break;
                  case 2:
                    _showDeleteDialog();
                    context.router.back();
                }
              })
        ],
      ),
      body: SafeArea(
          child: Column(
            children: [
              Expanded(child:
                  Image.network(
                      widget.clothingItem.itemPhoto, fit: BoxFit.cover,
                      loadingBuilder: imageLoadingBuilder,
                      errorBuilder: imageErrorBuilder,
                  )
              )
            ],
      )),
    );
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.loc.areYouSure),
          content: Text(context.loc.deleteConfirmation),
          actions: [
            TextButton(
              onPressed: () async{
                ref.read(deleteClothingItemProvider(clothingItemId :widget.clothingItem.clothingItemId!));
                if(mounted) context.router.maybePop();
              },
              child: Text(context.loc.delete),
            ),
          ],
        );
      },
    );
  }
}
