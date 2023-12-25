//
//  LayoutGuide.swift
//  Scaffold
//
//  https://github.com/benweidig/Scaffold
//  Copyright (c) 2023 Ben Weidig
//
//  This work is licensed under the terms of the MIT license.
//  For a copy, see LICENSE, or <https://opensource.org/licenses/MIT>
//

import UIKit

/// `LayoutGuide` is an abastraction over different anchor points.
public enum LayoutGuide {

    /// Anchors are determined directly on the view.
    case view

    /// Anchors of `view.safeAreaLayoutGuide` are used.
    case safeArea

    /// Anchors of `view.readableContentLayoutGuide` are used.
    case readableContent

    /// Anchors of `view.keyboardLayoutGuide` are used.
    @available(iOS 15, *)
    case keyboard

    func anchors(for view: UIView) -> Anchors {
        switch self {
        case .view: view
        case .safeArea: view.safeAreaLayoutGuide
        case .readableContent: view.readableContentGuide
        case .keyboard:
            if #available(iOS 15, *) {
                view.keyboardLayoutGuide
            } else {
                view.safeAreaLayoutGuide
            }
        }
    }
}
