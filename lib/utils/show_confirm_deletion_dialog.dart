import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ootd/extensions/localization_extension.dart';

import '../domain/state_management/outfit_list_notifier.dart';
import '../domain/state_management/outfit_provider.dart';

void showConfirmDeletionDialog({
  required BuildContext context,
  required WidgetRef ref,
  required int outfitId,
}) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(context.loc.doYouWantToDelete),
        content: Text(context.loc.removeFromFolderContent),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  context.router.maybePop();
                },
                child: Text(context.loc.cancel),
              ),
              TextButton(
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  final result = await ref.read(deleteOutfitProvider(outfitId: outfitId).future);

                  if(result.success){
                    messenger.showSnackBar(SnackBar(content: Text(context.loc.deleteOutfitSuccess)));
                    ref.read(outfitListNotifierProvider.notifier).removeOutfit(outfitId);
                    context.router.maybePop();
                  }else{
                    messenger.showSnackBar(SnackBar(content: Text(context.loc.deleteOutfitSuccess)));
                  }
                },
                child: Row(
                  children: [
                    const Icon(Icons.restore_from_trash),
                    Text(context.loc.remove),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
