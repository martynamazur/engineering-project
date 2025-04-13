import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/domain/state_management/clothes_provider.dart';
import 'package:ootd/model/clothing_item.dart';

import '../domain/state_management/clothes_folder_provider.dart';

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
              icon: Icon(Icons.edit),
              value: selectedValue,
              items: [
                DropdownMenuItem(value: 1, child: Text('Edit')),
                DropdownMenuItem(value: 2, child: Text('Delete')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });

                switch(value){
                  case 1:
                    //vagigate to edit page
                    break;
                  case 2:
                    showAlertDialog();
                    context.router.back();
                }

              })

        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(child: Image.network(widget.clothingItem.itemPhoto, fit: BoxFit.cover))
          //OutlinedButton(onPressed: (){}, child: Text('Create outfit'))
        ],
      )),
    );
  }

  void showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure ?'),
          content: Text('This action will be permanent and cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () async{
                ref.read(deleteClothingItemProvider(widget.clothingItem.clothingItemId!));

                if(mounted){
                  context.router.pop();
                }

              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
