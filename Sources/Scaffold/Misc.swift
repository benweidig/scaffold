//
//  Misc.swift
//  Scaffold
//
//  https://github.com/benweidig/Scaffold
//  Copyright (c) 2023 Ben Weidig
//
//  This work is licensed under the terms of the MIT license.
//  For a copy, see LICENSE, or <https://opensource.org/licenses/MIT>
//

import UIKit

public extension Scaffold {

    @discardableResult
    func attach(_ layoutGuide: LayoutGuide = .view,
                to view: UIView,
                layoutGuide otherLayoutGuide: LayoutGuide? = nil,
                offset: CGFloat = .zero,
                rtl: Bool = false,
                priority: UILayoutPriority? = nil,
                identifier: String? = nil) -> Scaffold {

        attach(.top(layoutGuide),
               to: view,
               on: .top(otherLayoutGuide ?? layoutGuide),
               offset: offset,
               priority: priority,
               identifier: identifier)

        attach(.bottom(layoutGuide),
               to: view,
               on: .bottom(otherLayoutGuide ?? layoutGuide),
               offset: -offset,
               priority: priority,
               identifier: identifier)

        if rtl {
            attach(.leading(layoutGuide),
                   to: view,
                   on: .leading(otherLayoutGuide ?? layoutGuide),
                   offset: offset,
                   priority: priority,
                   identifier: identifier)

            attach(.trailing(layoutGuide),
                   to: view,
                   on: .trailing(otherLayoutGuide ?? layoutGuide),
                   offset: -offset,
                   priority: priority,
                   identifier: identifier)
        } else {
            attach(.left(layoutGuide),
                   to: view,
                   on: .left(otherLayoutGuide ?? layoutGuide),
                   offset: offset,
                   priority: priority,
                   identifier: identifier)

            attach(.right(layoutGuide),
                   to: view,
                   on: .right(otherLayoutGuide ?? layoutGuide),
                   offset: -offset,
                   priority: priority,
                   identifier: identifier)
        }

        return self
    }

    @discardableResult
    func center(_ layoutGuide: LayoutGuide = .view,
                in view: UIView? = nil,
                layoutGuide otherLayoutGuide: LayoutGuide? = nil,
                offset: CGFloat = .zero,
                priority: UILayoutPriority? = nil,
                identifier: String? = nil) -> Scaffold {

        let actualView = view ?? self.view.superview!

        attach(.centerX(layoutGuide),
               to: actualView,
               on: .centerX(otherLayoutGuide ?? layoutGuide),
               offset: offset,
               priority: priority,
               identifier: identifier)

        attach(.centerY(layoutGuide),
               to: actualView,
               on: .centerY(otherLayoutGuide ?? layoutGuide),
               offset: offset,
               priority: priority,
               identifier: identifier)

        return self
    }
}
