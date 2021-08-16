//
//  Config.swift
//  
//
//  Created by Brendan on 2021-01-29.
//

import os
import SwiftUI

public struct Config {
    public static var current: Config {
        get {
            return _current
        }

        set {
            guard !hasSetConfig else {
                os_log("Error! Config has already been set once, at startup. Ignoring config update. ")
                return
            }

            hasSetConfig = true
            _current = newValue
        }
    }
    private static var _current = Config()
    private static var hasSetConfig: Bool = false

    public var colorTheme: ColorTheme
    public var typeTheme: TypeTheme

    // Button Styles
    public var borderlessButtonStyle: ButtonStyle
    public var destructiveButtonStyle: ButtonStyle
    public var inactiveButtonStyle: ButtonStyle
    public var primaryButtonStyle: ButtonStyle
    public var secondaryButtonStyle: ButtonStyle

    // Text Styles

    public var bodyTextStyle: TypeStyle
    public var detailTextStyle: TypeStyle
    public var itemTitleStyle: TypeStyle
    public var screenTitleStyle: TypeStyle
    public var sectionTitleStyle: TypeStyle

    public init(colorTheme: ColorTheme? = nil, typeTheme: TypeTheme? = nil) {
        self.colorTheme = colorTheme ?? ColorTheme()
        self.typeTheme = typeTheme ?? TypeTheme()

        // Set Button styles
        
        borderlessButtonStyle = ButtonStyle(
            textStyle: self.typeTheme.button,
            surfaceColor: Color.clear,
            onSurfaceColor: self.colorTheme.primary
        )

        destructiveButtonStyle = ButtonStyle(
            textStyle: self.typeTheme.button,
            surfaceColor: self.colorTheme.error,
            onSurfaceColor: self.colorTheme.onError
        )

        inactiveButtonStyle = ButtonStyle(
            textStyle: self.typeTheme.button,
            surfaceColor: self.colorTheme.background,
            onSurfaceColor: self.colorTheme.secondary
        )

        primaryButtonStyle = ButtonStyle(
            textStyle: self.typeTheme.button,
            surfaceColor: self.colorTheme.primary,
            onSurfaceColor: self.colorTheme.onPrimary
        )

        secondaryButtonStyle = ButtonStyle(
            textStyle: self.typeTheme.button,
            surfaceColor: self.colorTheme.secondary,
            onSurfaceColor: self.colorTheme.onSecondary
        )

        // Set Text styles

        bodyTextStyle = TypeStyle(
            color: self.colorTheme.onSurface,
            theme: self.typeTheme.body1
        )

        detailTextStyle = TypeStyle(
            color: self.colorTheme.onSurface,
            theme: self.typeTheme.caption // body2?
        )

        // Set Title styles

        itemTitleStyle = TypeStyle(
            color: self.colorTheme.onSurface,
            theme: self.typeTheme.headline4
        )

        screenTitleStyle = TypeStyle(
            color: self.colorTheme.onSurface,
            theme: self.typeTheme.headline1
        )

        sectionTitleStyle = TypeStyle(
            color: self.colorTheme.onSurface,
            theme: self.typeTheme.headline2
        )
    }

}