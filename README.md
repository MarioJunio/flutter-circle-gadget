A flutter widget that provides a circular widget that allows you make customizations in its properties and build pretty animations using it.

## Features

Creates a circular visual widget that you can specify the size, stroke width, colors and desired values to fill determined angle of circle. Supports animations like Tweens to change the current value of fill and much more.

## Getting started
Add this dependency to your pubspec.yml:

```yaml
dependencies:
  circle_gadget: ^1.0.0
```

Now in your Dart code, you can use:

```dart
import 'package:circle_gadget/circle_gadget.dart';
```

## Usage

The `circle_gadget` package itself is very simple to use just create a widget as stateless or statefull

```dart
CircularGadgetWidget(
    width: 200,
    height: 200,
    strokeColor: Theme.of(context).primaryColor.withAlpha(40),
    strokeValueColor: Theme.of(context).primaryColor,
    centerColor: Colors.grey.withAlpha(10),
    strokeWidth: 8,
    min: 0.0,
    max: 180.0,
    value: 100.0,
)
```

See the full example [circular animation](https://github.com/MarioJunio/flutter-circle-gadget/tree/main/lib/examples).

## Widget properties
**width**

*double*

Change the circle size width

**height**

*double*

Change the circle size height

**strokeWidth**

*double*

Change the circle stroke size width

**strokeColor**

*Color*

Change the circle stroke color

```dart
strokeColor: Colors.blue.withAlpha(50)
```

**strokeValueColor**

*Color*

Change the circle stroke color value

```dart
strokeColor: Colors.blue
```

**min**

*double*

Set the min value that circle waits

**max**

*double*

Set the max value that circle waits

**centerColor**

*Color*

Change the center color of circle

```dart
strokeColor: Colors.white.withAlpha(30)
```
