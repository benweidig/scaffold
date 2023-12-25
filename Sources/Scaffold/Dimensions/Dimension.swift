//
//  Dimension/Dimensions.swift
//  Scaffold
//
//  https://github.com/benweidig/Scaffold
//  Copyright (c) 2023 Ben Weidig
//
//  This work is licensed under the terms of the MIT license.
//  For a copy, see LICENSE, or <https://opensource.org/licenses/MIT>
//

import UIKit

/// `Dimension`is an abstraction over NSLayoutDimension.
public enum Dimension {

    case width(LayoutGuide = .view)
    case height(LayoutGuide = .view)

    func toLayoutDimension(_ view: UIView) -> NSLayoutDimension {
        switch self {

        case let .width(guide):
            guide.anchors(for: view).widthAnchor

        case let .height(guide):
            guide.anchors(for: view).heightAnchor
        }
    }
}
