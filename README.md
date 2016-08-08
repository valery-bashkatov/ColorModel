# ColorModel

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)]()

## Description
Allows to work with color through RGB, HSB and grayscale components.

## Requirements
- iOS 8.0+
- Xcode 7.3+

## Installation
### Carthage

To integrate `ColorModel` into your project using [Carthage](https://github.com/Carthage/Carthage), specify it in your `Cartfile`:

```
github "valery-bashkatov/ColorModel"
```
And then follow the [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos) to install the framework.

## Documentation
API Reference is located at [http://valery-bashkatov.github.io/ColorModel](http://valery-bashkatov.github.io/ColorModel)

## Usage

```swift
import ColorModel

let purple = UIColor.purpleColor()
let colorModel = ColorModel(color: purple)

colorModel.saturation -= 0.7
colorModel.brightness += 0.3

let lightPurple = colorModel.color
```