# Flutter Shadcn Demo

## Quick Start

### Package Usage

1. Add `package:shadcn_ui` to your `pubspec.yaml`
   ```sh
   dart pub add shadcn_ui
   ```
1. Import and use components
   ```dart
   import 'package:shadcn_ui/shadcn_ui` show ShadButton, ShadText;
   ```

### Component Usage

1. Install components

```sh
mason add -g <component>
```

1. Generate them

```sh
mason make <component>
```

## Supported Components

✅ ShadButton
✅ ShadText

## Development

The package in `./packages/shadcn_ui` is generated from the bricks in the `./bricks` directory.
To regenerate the `shadcn_ui` package run the following:

```sh
dart ./tools/generate_package.dart
```
