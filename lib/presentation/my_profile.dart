import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ootd/extensions/localization_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../navigation/app_router.dart';

@RoutePage()
class MyProfileScreen extends ConsumerWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = Supabase.instance.client.auth.currentUser;
    print(user?.userMetadata);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.profileHeader),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.router.push(SettingsRoute())
            ,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: user!.userMetadata!['profile_image_url'] != null
                      ? NetworkImage(user.userMetadata!['profile_image_url'])
                      : const AssetImage('assets/brand_logo.png') as ImageProvider,
                ),
              ),


              const SizedBox(height: 16),
              Text(
                user.userMetadata?['displayName'] ?? context.loc.unknownUserHeader,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),

            ],
          ),
        ),
      ),
    );
  }
}
