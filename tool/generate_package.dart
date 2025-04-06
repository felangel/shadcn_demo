import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

Future<void> main() async {
  final brick = Brick.path('bricks/shadcn_ui');
  final generator = await MasonGenerator.fromBrick(brick);
  var vars = <String, dynamic>{
    'bricks_dir': Directory('bricks').absolute.path,
  };
  final workingDirectory = path.join('packages', 'shadcn_ui');
  final outputDir = Directory(workingDirectory);

  if (outputDir.existsSync()) outputDir.deleteSync(recursive: true);
  outputDir.createSync(recursive: true);

  await generator.hooks.preGen(
    vars: vars,
    onVarsChanged: (v) => vars = v,
    workingDirectory: workingDirectory,
  );
  await generator.generate(
    DirectoryGeneratorTarget(Directory('packages')),
    vars: vars,
    fileConflictResolution: FileConflictResolution.overwrite,
  );

  await generator.hooks.postGen(
    vars: vars,
    onVarsChanged: (v) => vars = v,
    workingDirectory: workingDirectory,
  );
}
