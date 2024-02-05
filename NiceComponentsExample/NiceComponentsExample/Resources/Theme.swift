//
//  Theme.swift
//  NiceComponentsExample
//
//  Created by Brendan on 2021-09-02.
//

import NiceComponents
import SwiftUI

enum Theme {
    static var config: Config {
        var newConfig = Config()

//        newConfig.secondaryButtonStyle = NiceButtonStyle(
//            border: .rounded(color: .black, cornerRadius: 12, width: 1.5)
//        )

        newConfig.sectionTitleStyle = NiceTextStyle(
            color: .brown,
            font: "Avenir Roman",
            size: 30
        )

        newConfig.screenTitleStyle = .screenTitle
//            .with(weight: .black)

        return newConfig
    }
}
