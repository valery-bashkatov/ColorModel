//
//  ColorModel.swift
//  ColorModel
//
//  Created by Valery Bashkatov on 06.08.16.
//  Copyright (c) 2016 Valery Bashkatov. All rights reserved.
//

import UIKit

/**
 The `ColorModel` class provides simple mechanism for modeling color by components.
 */
open class ColorModel: CustomStringConvertible {
    
    // MARK: - Properties
    
    /// An internal flag to prevent loops: changing the components changes color and brings components updating.
    fileprivate var needsUpdateColor = true
    
    /// The `UIColor` associated with model.
    open var color: UIColor {
        didSet {
            updateComponents()
        }
    }
    
    /// The red component. Value between 0.0 and 1.0.
    open var red = CGFloat() {
        didSet {
            if needsUpdateColor {
                color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
            }
        }
    }
    
    /// The green component. Value between 0.0 and 1.0.
    open var green = CGFloat() {
        didSet {
            if needsUpdateColor {
                color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
            }
        }
    }
    
    /// The blue component. Value between 0.0 and 1.0.
    open var blue = CGFloat() {
        didSet {
            if needsUpdateColor {
                color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
            }
        }
    }
    
    /// The hue component. Value between 0.0 and 1.0.
    open var hue = CGFloat() {
        didSet {
            if needsUpdateColor {
                color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
            }
        }
    }
    
    /// The saturation component. Value between 0.0 and 1.0.
    open var saturation = CGFloat() {
        didSet {
            if needsUpdateColor {
                color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
            }
        }
    }
    
    /// The brightness component. Value between 0.0 and 1.0.
    open var brightness = CGFloat() {
        didSet {
            if needsUpdateColor {
                color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
            }
        }
    }
    
    /// The grayscale component. Value between 0.0 and 1.0.
    open var white = CGFloat() {
        didSet {
            if needsUpdateColor {
                color = UIColor(white: white, alpha: alpha)
            }
        }
    }
    
    /// The opacity component. Value between 0.0 and 1.0.
    open var alpha = CGFloat() {
        didSet {
            if needsUpdateColor {
                color = color.withAlphaComponent(alpha)
            }
        }
    }
    
    /// A textual representation of the color model.
    open var description: String {
        return "RGB(\(red), \(green), \(blue)), HSB(\(hue), \(saturation), \(brightness)), Grayscale(\(white)), Alpha(\(alpha))"
    }
    
    // MARK: - Creating the Color Model
    
    /**
     Creates and returns color model instance.
     
     - parameter color: The `UIColor` object to be used for modeling.
     
     - returns: `ColorModel` instance.
     */
    public init(color: UIColor) {
        self.color = color
        updateComponents()
    }
    
    // MARK: - Updating Components
    
    /// Updates the color components.
    fileprivate func updateComponents() {
        var newHue = CGFloat()
        var newSaturation = CGFloat()
        var newBrightness = CGFloat()
        
        needsUpdateColor = false
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        color.getWhite(&white, alpha: nil)
        
        color.getHue(&newHue, saturation: &newSaturation, brightness: &newBrightness, alpha: nil)
        
        // Handling the reset hue to 0 when the brightness and saturation are set to 0
        if newBrightness != 0 && newSaturation != 0 {
            hue = newHue
        }
        
        // Handling the reset saturation to 0 when the brightness is set to 0
        if newBrightness != 0 {
            saturation = newSaturation
        }
        
        brightness = newBrightness
        
        needsUpdateColor = true
    }
}
