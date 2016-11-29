//
//  ColorModelTests.swift
//  ColorModel
//
//  Created by Valery Bashkatov on 06.08.16.
//  Copyright © 2016 Valery Bashkatov. All rights reserved.
//

import XCTest
import ColorModel

class ColorModelTests: XCTestCase {
    
    // No reset hue to 0 when the brightness and saturation are set to 0
    func testNoResetHue() {
        let colorModel = ColorModel(color: UIColor.green)
        
        colorModel.brightness = 0
        colorModel.saturation = 0
        
        XCTAssert(colorModel.hue != 0)
    }
    
    // No reset saturation to 0 when the brightness is set to 0
    func testNoResetSaturation() {
        let colorModel = ColorModel(color: UIColor.yellow)
        
        colorModel.brightness = 0
        
        XCTAssert(colorModel.saturation != 0)
    }
    
    func testRGB() {
        let colorModel = ColorModel(color: UIColor(red: 0.55, green: 0.12, blue: 0.47, alpha: 1.0))
        
        colorModel.red = 0.17
        colorModel.green = 0.17
        colorModel.blue = 0.17
        colorModel.alpha = 0.17
        
        let color = colorModel.color
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        XCTAssertEqualWithAccuracy(red, 0.17, accuracy: 0.001)
        XCTAssertEqualWithAccuracy(green, 0.17, accuracy: 0.001)
        XCTAssertEqualWithAccuracy(blue, 0.17, accuracy: 0.001)
        XCTAssertEqualWithAccuracy(alpha, 0.17, accuracy: 0.001)
    }
    
    func testHSB() {
        let colorModel = ColorModel(color: UIColor(hue: 0.15, saturation: 0.22, brightness: 0.33, alpha: 1.0))
        
        colorModel.hue = 0.25
        colorModel.saturation = 0.22
        colorModel.brightness = 0.67
        colorModel.alpha = 0.17
        
        let color = colorModel.color
        
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        XCTAssertEqualWithAccuracy(hue, 0.25, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(saturation, 0.22, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(brightness, 0.67, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(alpha, 0.17, accuracy: 0.01)
    }
    
    func testRGBtoHSB() {
        let colorModel = ColorModel(color: UIColor(red: 0.094, green: 0.204, blue: 0.502, alpha: 1.0))
        
        let color = colorModel.color
        
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        XCTAssertEqualWithAccuracy(hue, 0.622, accuracy: 0.001)
        XCTAssertEqualWithAccuracy(saturation, 0.812, accuracy: 0.001)
        XCTAssertEqualWithAccuracy(brightness, 0.502, accuracy: 0.001)
        XCTAssertEqualWithAccuracy(alpha, 1.0, accuracy: 0.001)
    }
}
