//
//  Axes/HorizontalAxis.swift
//  Scaffold
//
//  https://github.com/benweidig/Scaffold
//  Copyright (c) 2023 Ben Weidig
//
//  This work is licensed under the terms of the MIT license.
//  For a copy, see LICENSE, or <https://opensource.org/licenses/MIT>
//

import UIKit

public enum HorizontalAxis {

    case leading(LayoutGuide = .view)
    case trailing(LayoutGuide = .view)

    case left(LayoutGuide = .view)
    case right(LayoutGuide = .view)

    case centerX(LayoutGuide = .view)

    func toAnchor(_ view: UIView) -> NSLayoutXAxisAnchor {
        switch self {
        case let .leading(guide):
            guide.anchors(for: view).leadingAnchor

        case let .trailing(guide):
            guide.anchors(for: view).trailingAnchor

        case let .left(guide):
            guide.anchors(for: view).leftAnchor

        case let .right(guide):
            guide.anchors(for: view).rightAnchor

        case let .centerX(guide):
            guide.anchors(for: view).centerXAnchor
        }
    }
}
