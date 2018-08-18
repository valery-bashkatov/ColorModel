# ColorModel
`ColorModel` allows to work with colors through RGB, HSB and grayscale components.

## Requirements
- iOS 9.0+
- Swift 4.1+

## Installation
### Carthage
To integrate `ColorModel` into your project using [Carthage](https://github.com/Carthage/Carthage), specify it in your `Cartfile`:

```
github "valery-bashkatov/ColorModel" ~> 3.0.0
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
