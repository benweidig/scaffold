//
//  Axes/VerticalAxis.swift
//  Scaffold
//
//  https://github.com/benweidig/Scaffold
//  Copyright (c) 2023 Ben Weidig
//
//  This work is licensed under the terms of the MIT license.
//  For a copy, see LICENSE, or <https://opensource.org/licenses/MIT>
//

import UIKit

public enum VerticalAxis {

    case top(LayoutGuide = .view)
    case bottom(LayoutGuide = .view)
    case centerY(LayoutGuide = .view)

    func toAnchor(_ view: UIView) -> NSLayoutYAxisAnchor {
        switch self {
        case let .top(guide):
            guide.anchors(for: view).topAnchor

        case let .bottom(guide):
            guide.anchors(for: view).bottomAnchor

        case let .centerY(guide):
            guide.anchors(for: view).centerYAnchor
        }
    }
}
