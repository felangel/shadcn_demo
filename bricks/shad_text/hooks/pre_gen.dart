import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

Future<void> run(HookContext context) async {
  final dependencies = ['shad_utils'];
  final bricksDir = context.vars['bricks_dir'] as String;
  final bricks = dependencies.map(
    (dep) => Brick.path(path.join(bricksDir, dep)),
  );

  final directory = Directory(path.join(Directory.current.path, 'lib', 'src'));
  final target = DirectoryGeneratorTarget(directory);

  for (final brick in bricks) {
    var vars = <String, dynamic>{'bricks_dir': bricksDir};
    final generator = await MasonGenerator.fromBrick(brick);
    await generator.hooks.preGen(vars: vars, onVarsChanged: (v) => vars = v);
    await generator.generate(target, vars: vars);
    await generator.hooks.postGen(vars: vars, onVarsChanged: (v) => vars = v);
  }
}
