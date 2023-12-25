//
//  Anchors.swift
//  Scaffold
//
//  https://github.com/benweidig/Scaffold
//  Copyright (c) 2023 Ben Weidig
//
//  This work is licensed under the terms of the MIT license.
//  For a copy, see LICENSE, or <https://opensource.org/licenses/MIT>
//

import UIKit

/// `Anchors` bridges the gap between `UIView` and `UILayoutGuide` for
/// accessing their respective anchors in a simpler fashion.
protocol Anchors {

    // HORIZONTAL
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }

    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }

    // VERTICAL
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }

    // DIMENSION
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
}

extension UIView: Anchors { }
extension UILayoutGuide: Anchors { }
