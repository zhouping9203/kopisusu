[![Dart](https://github.com/google/vector_math.dart/actions/workflows/ci.yml/badge.svg)](https://github.com/google/vector_math.dart/actions/workflows/ci.yml)
[![pub package](https://img.shields.io/pub/v/vector_math.svg)](https://pub.dev/packages/vector_math)
[![package publisher](https://img.shields.io/pub/publisher/vector_math.svg)](https://pub.dev/packages/vector_math/publisher)
[![Coverage Status](https://coveralls.io/repos/google/vector_math.dart/badge.svg?branch=master)](https://coveralls.io/r/google/vector_math.dart?branch=master)

## Introduction

A Vector math library for 2D and 3D applications.

## Features

* 2D, 3D, and 4D vector and matrix types.
* Quaternion type for animating rotations.
* Collision detection: AABB, rays, spheres, ...
* Utilities like color and common rendering related operations
* Flexible getters and setters, for example, ```position.xwz = color.grb;```.
* Fully documented.
* Well tested.
* Heavily optimized.

## Libraries using vector_math

* [Flutter](https://github.com/flutter/flutter)
* [Flame](https://github.com/flame-engine/flame)

## Examples

1\. Using the GLSL getter and setter syntax.

```dart
import 'package:vector_math/vector_math.dart';

void main() {
  Vector3 x = Vector3.zero(); // Zero vector
  Vector4 y = Vector4.all(4.0); // Vector with 4.0 in all lanes
  x.zyx = y.xzz; // Sets z,y,x the values in x,z,z
}
```

2\. Transforming a vector.


```dart
import 'dart:math';
import 'package:vector_math/vector_math.dart';

void main() {
  // Rotation of PI/2 degrees around the Y axis followed by a
  // translation of (5.0, 2.0, 3.0).
  Matrix4 T = Matrix4.rotationY(PI * 0.5)..translate(5.0, 2.0, 3.0);
  // A point.
  Vector3 position = Vector3(1.0, 1.0, 1.0);
  // Transform position by T.
  T.transform3(position);
}
```

3\. Invert a matrix

```dart
import 'dart:math';
import 'package:vector_math/vector_math.dart';

void main() {
  // Rotation of 90 degrees around the Y axis followed by a
  // translation of (5.0, 2.0, 3.0).
  Matrix4 T = Matrix4.rotationY(PI * 0.5)..translate(5.0, 2.0, 3.0);
  // Invert T.
  T.invert();
  // Invert just the rotation in T.
  T.invertRotation();
}
```

4\. Rotate a vector using a quaternion

```dart
import 'dart:math';
import 'package:vector_math/vector_math.dart';

void main() {
  // The X axis.
  Vector3 axis = Vector3(1.0, 0.0, 0.0);
  // 90 degrees.
  double angle = PI / 2.0;
  // Quaternion encoding a 90 degree rotation along the X axis.
  Quaternion q = Quaternion.axisAngle(axis, angle);
  // A point.
  Vector3 point = Vector3(1.0, 1.0, 1.0);
  // Rotate point by q.
  q.rotate(point);
}
```

5\. Check if two axis aligned bounding boxes intersect

```dart
import 'package:vector_math/vector_math.dart';

void main() {
  // Define the first box with a minimum and a maximum.
  Aabb2 aabbOne = Aabb2.minMax(Vector2.zero(), Vector2(4.0, 4.0));
  // Define the second box
  Aabb2 aabbTwo = Aabb2.minMax(Vector2(5.0, 5.0), Vector2(6.0, 6.0));
  // Extend the second box to contain a point
  aabbTwo.hullPoint(Vector2(3.0, 3.0));
  // Check if the two boxes intersect, returns true in this case.
  bool intersect = aabbOne.intersectsWithAabb2(aabbTwo);
}
```

6\. Check where a ray and a sphere intersect

```dart
import 'package:vector_math/vector_math.dart';

void main() {
  // Define a ray starting at the origin and going into positive x-direction.
  Ray ray = Ray.originDirection(Vector3.zero(), Vector3(1.0, 0.0, 0.0));
  // Defines a sphere with the center (5.0 0.0 0.0) and a radius of 2.
  Sphere sphere = Sphere.centerRadius(Vector3(5.0, 0.0, 0.0), 2.0);
  // Checks if the ray intersect with the sphere and returns the distance of the
  // intersection from the origin of the ray. Would return null if no intersection
  // is found.
  double distanceFromOrigin = ray.intersectsWithSphere(sphere);
  // Evaluate the position of the intersection, in this case (3.0 0.0 0.0).
  Vector3 position = ray.at(distanceFromOrigin);
}
```

7\. Work with colors

```dart
import 'package:vector_math/vector_math.dart';

void main() {
  // Access a build-in color, colors are stored in 4-dimensional vectors.
  Vector4 red = Colors.red;
  Vector4 gray = Vector4.zero();
  // Convert the red color to a grayscaled color.
  Colors.toGrayscale(red, gray);
  // Parse a blue color from a hex string.
  Vector4 blue = Vector4.zero();
  Colors.fromHexString('#0000FF', blue);
  // Convert the blue color from RGB to HSL.
  Colors.rgbToHsl(blue, blue);
  // Reduce the lightness of the color by 50%.
  blue.z *= 0.5;
  // Convert the HSL color back to RGB.
  Colors.hslToRgb(blue, blue);
}
```

8\. Use 64bit float precision (instead of 32bit)

```dart
// Use different import statement.
// Which is a drop-in replacement for 'package:vector_math/vector_math.dart'
import 'package:vector_math/vector_math_64.dart';
void main() {
  // Types work the same, but using 64 bit storage.
  Vector3 x = Vector3.zero(); 
  Matrix4 m = Matrix4.identity();
}
```

## Development

To run the unit tests:

```
~/src/vector_math/> dart test
```

To automatically generate the latest version of `vector_math_64`:

```
~/src/vector_math/> dart tool/generate_vector_math_64.dart
```
