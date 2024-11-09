import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/service/supabase_service.dart';

part 'supabase_utils.g.dart';

@riverpod
SupabaseUtils supabaseUtils (SupabaseUtilsRef ref) {
  return SupabaseUtils();
}
