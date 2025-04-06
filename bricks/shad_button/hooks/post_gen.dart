import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  context.logger.info('[component] shad_button');
  final formatProgress = context.logger.progress('Running "dart format ."');
  await Process.run('dart', ['format', '.']);
  formatProgress.complete();

  final pubGetProcess = context.logger.progress('Running "dart pub get"');
  await Process.run('dart', ['pub', 'get']);
  pubGetProcess.complete();
  context.logger.info('');
}
