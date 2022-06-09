//
//  ItemTitle.swift
//
//
//  Created by Brendan on 2021-01-29.
//

import SwiftUI

public struct ItemTitle: NiceText {

    public let text: NSAttributedString
    public let style: TypeStyle

    static public var defaultStyle: TypeStyle {
        Config.current.itemTitleStyle
    }

    public init(_ text: NSAttributedString, style: TypeStyle? = nil) {
        self.text = text
        self.style = style ?? Self.defaultStyle
    }

    public var body: some View {
        Text(text)
            .foregroundColor(style.color)
            .scaledFont(name: style.theme.name, size: style.theme.size, weight: style.theme.weight)
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(style.lineLimit)
    }
}

struct ItemTitle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: Layout.Spacing.large) {
            ItemTitle("Item Title")
            ItemTitle("Item Title", color: .red)
            ItemTitle(
                NSAttributedString(
                    string: "Item Title",
                    attributes: [
                        .underlineStyle: 1,
                        .foregroundColor: Color.blue
                    ]
                )
            )
        }
    }
}
