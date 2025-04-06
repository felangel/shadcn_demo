import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

Future<void> run(HookContext context) async {
  final components = ['shad_button', 'shad_text'];

  context.logger
    ..info('Generating package:shadcn_ui...')
    ..info('')
    ..info('Components');

  for (final component in components.sublist(0, components.length - 1)) {
    context.logger.info('├──$component');
  }

  if (components.isNotEmpty) context.logger.info('└──${components.last}\n');

  final bricksDir = context.vars['bricks_dir'] as String;
  final bricks = components.map(
    (component) => Brick.path(path.join(bricksDir, component)),
  );

  // Update the brick vars
  context.vars = {...context.vars, 'components': components};
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
