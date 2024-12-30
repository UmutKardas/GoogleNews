//
//  CustomToolBarItem.swift
//  GoogleNews
//
//  Created by Hüseyin Umut Kardaş on 30.12.2024.
//

import SwiftUI

struct TitleStyle {
    var font: Font = .system(size: 14)
    var fontWeight: Font.Weight = .regular
    var color: Color = .primary
}

struct ImageStyle {
    var frame: CGSize = .init(width: 25, height: 25)
    var foregroundColor: Color = .primary
}

struct CustomToolBarItem: View {
    let title: String?
    let titleStyle: TitleStyle?

    let image: Image?
    let imageStyle: ImageStyle?

    let action: (() -> Void)?

    var body: some View {
        if let action = action {
            Button(action: action) {
                buildContent()
            }
            .buttonStyle(PlainButtonStyle())
        } else {
            buildContent()
        }
    }

    private func buildContent() -> some View {
        HStack {
            if let image = image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageStyle?.frame.width ?? 25, height: imageStyle?.frame.height ?? 25)
                    .foregroundColor(imageStyle?.foregroundColor ?? .primary)
            }
            if let title = title {
                Text(title)
                    .font(titleStyle?.font ?? .system(size: 14))
                    .fontWeight(titleStyle?.fontWeight ?? .regular)
                    .foregroundColor(titleStyle?.color ?? .primary)
                    .lineLimit(1)
            }
        }
    }
}
