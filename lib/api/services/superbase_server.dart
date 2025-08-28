import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServer {
  static Future<void> init() async {
    await Supabase.initialize(
      url: 'https://kfutozxngumxdnadflsq.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtmdXRvenhuZ3VteGRuYWRmbHNxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTYzODIwNDAsImV4cCI6MjA3MTk1ODA0MH0.vG1SeJRVE7BDEKSKvWCmLpn8C034QNTHLWW7IBYZhN8',
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}
