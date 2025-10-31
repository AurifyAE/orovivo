# Lottie Animation Usage Guide

## ✅ Setup Complete!

Lottie animations are now fully integrated with FlutterGen assets generation.

## 📁 File Structure

```
assets/
  lottie/
    gold.json
    loading.json
    ... (add more .json files here)
```

## 🎯 Usage Examples

### Method 1: Basic Usage with `.lottie()` method

```dart
import 'package:app/shared/utils/assets.gen.dart';
import 'package:flutter/material.dart';

// Display a Lottie animation
Assets.lottie.gold.lottie(
  width: 200,
  height: 200,
  repeat: true,
  animate: true,
)
```

### Method 2: With Custom Parameters

```dart
Assets.lottie.loading.lottie(
  width: 150,
  height: 150,
  repeat: true,
  reverse: false,
  fit: BoxFit.contain,
  alignment: Alignment.center,
)
```

### Method 3: With Animation Controller

```dart
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Assets.lottie.gold.lottie(
      controller: _controller,
      width: 200,
      height: 200,
      onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..forward();
      },
    );
  }
}
```

### Method 4: Access Path Directly

```dart
// Get the asset path as a string
String goldPath = Assets.lottie.gold.path;
// Returns: 'assets/lottie/gold.json'

String keyName = Assets.lottie.gold.keyName;
// Returns: 'assets/lottie/gold.json'
```

## 🎨 Available Parameters

The `.lottie()` method supports all standard Lottie parameters:

- `width` / `height` - Size of the animation
- `repeat` - Whether to loop the animation
- `reverse` - Play animation in reverse
- `animate` - Auto-start animation
- `controller` - Custom AnimationController
- `fit` - BoxFit for the animation
- `alignment` - Alignment of the animation
- `frameRate` - Custom frame rate
- `onLoaded` - Callback when animation loads
- `delegates` - Custom delegates for images/text
- `options` - Additional Lottie options
- `errorBuilder` - Error widget builder
- And more...

## 📝 Adding New Lottie Files

1. Add your `.json` Lottie file to `assets/lottie/` folder
2. Run the asset generator:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
3. Access your new animation:
   ```dart
   Assets.lottie.yourFileName.lottie()
   ```

## 🔍 Available Animations

Currently available animations:
- `Assets.lottie.gold` - Gold animation
- `Assets.lottie.loading` - Loading animation

## ⚡ Performance Tips

1. **Preload animations**: Use `precacheImage()` for frequently used animations
2. **Control frame rate**: Set `frameRate` to reduce CPU usage
3. **Use `backgroundLoading`**: Enable for smoother loading
4. **Dispose controllers**: Always dispose AnimationControllers

## 🎯 Example Widget

See `lib/shared/widgets/lottie_example.dart` for a complete working example.

## 📦 Dependencies

- `lottie: ^3.2.0` - Added to pubspec.yaml
- FlutterGen integration enabled in `pubspec.yaml`:
  ```yaml
  flutter_gen:
    integrations:
      lottie: true
  ```

## 🚀 Benefits

✅ Type-safe access to Lottie animations
✅ Auto-completion in IDE
✅ Compile-time checking
✅ No string typos
✅ Easy refactoring
✅ Consistent API with other assets (SVG, images)
