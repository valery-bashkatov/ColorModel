# ColorModel

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)]()

## Description
Allows to work with colors through RGB, HSB or grayscale components.

## Requirements
- iOS 9.0+
- Swift 3

## Installation
### Carthage

To integrate `ColorModel` into your project using [Carthage](https://github.com/Carthage/Carthage), specify it in your `Cartfile`:

```
github "valery-bashkatov/ColorModel" ~> 2.0.0
```

And then follow the [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos) to install the framework.

## Documentation
API Reference is located at [http://valery-bashkatov.github.io/ColorModel](http://valery-bashkatov.github.io/ColorModel).

## Usage

```swift
import ColorModel

let colorModel = ColorModel(color: UIColor.purple)

colorModel.saturation -= 0.7
colorModel.brightness += 0.3

let lightPurple = colorModel.color
```
