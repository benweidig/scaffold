//
//  Axes/Scaffold+HorizontalAxis.swift
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

    /// Attach a `HorizontalAxis`.
    /// - Parameters:
    ///     - view: The `UIView` to attach to. If `nil` the currently
    ///             scaffolded `view` tries to attach ot its `superview`.
    ///     - otherAxis: If `nil` then `axis` is used instead.
    @discardableResult
    func attach(_ axis: HorizontalAxis,
                to view: UIView? = nil,
                on otherAxis: HorizontalAxis? = nil,
                relatedBy: NSLayoutConstraint.Relation = .equal,
                offset constant: CGFloat = .zero,
                priority: UILayoutPriority? = nil,
                identifier: String? = nil) -> Scaffold {

        let anchor = axis.toAnchor(self.view)
        let otherAnchor = (otherAxis ?? axis).toAnchor(view ?? self.view.superview!)

        let constraint = switch relatedBy {

        case .lessThanOrEqual:
            anchor.constraint(lessThanOrEqualTo: otherAnchor,
                              constant: constant)
        case .equal:
            anchor.constraint(equalTo: otherAnchor,
                              constant: constant)
        case .greaterThanOrEqual:
            anchor.constraint(greaterThanOrEqualTo: otherAnchor,
                              constant: constant)
        @unknown default:
            fatalError()
        }

        addToScaffold(constraint,
                      priority: priority,
                      identifier: identifier)

        return self
    }

    // MARK: -

    /// Attach to `.left`.
    /// - Parameters:
    ///     - view: The `UIView` to attach to. If `nil` the currently
    ///             scaffolded `view` tries to attach ot its `superview`.
    ///     - otherAxis: If `nil` then `.left(layoutGuide)` is used instead.
    @discardableResult
    func left(_ layoutGuide: LayoutGuide = .view,
              to view: UIView? = nil,
              on otherAxis: HorizontalAxis? = nil,
              relatedBy: NSLayoutConstraint.Relation = .equal,
              offset constant: CGFloat = .zero,
              priority: UILayoutPriority? = nil,
              identifier: String? = nil) -> Scaffold {

        attach(.left(layoutGuide),
               to: view,
               on: otherAxis,
               relatedBy: relatedBy,
               offset: constant,
               priority: priority,
               identifier: identifier)
    }

    // MARK: -

    /// Attach to `.leading`.
    /// - Parameters:
    ///     - view: The `UIView` to attach to. If `nil` the currently
    ///             scaffolded `view` tries to attach ot its `superview`.
    ///     - otherAxis: If `nil` then `.left(layoutGuide)` is used instead.
    @discardableResult
    func leading(_ layoutGuide: LayoutGuide = .view,
                 to view: UIView? = nil,
                 on otherAxis: HorizontalAxis? = nil,
                 relatedBy: NSLayoutConstraint.Relation = .equal,
                 offset constant: CGFloat = .zero,
                 priority: UILayoutPriority? = nil,
                 identifier: String? = nil) -> Scaffold {

        attach(.leading(layoutGuide),
               to: view,
               on: otherAxis,
               relatedBy: relatedBy,
               offset: constant,
               priority: priority,
               identifier: identifier)
    }

    // MARK: -

    /// Attach to `.right`.
    /// - Parameters:
    ///     - view: The `UIView` to attach to. If `nil` the currently
    ///             scaffolded `view` tries to attach ot its `superview`.
    ///     - otherAxis: If `nil` then `.left(layoutGuide)` is used instead.
    @discardableResult
    func right(_ layoutGuide: LayoutGuide = .view,
               to view: UIView? = nil,
               on otherAxis: HorizontalAxis? = nil,
               relatedBy: NSLayoutConstraint.Relation = .equal,
               offset constant: CGFloat = .zero,
               priority: UILayoutPriority? = nil,
               identifier: String? = nil) -> Scaffold {

        attach(.right(layoutGuide),
               to: view,
               on: otherAxis,
               relatedBy: relatedBy,
               offset: constant,
               priority: priority,
               identifier: identifier)
    }

    // MARK: -

    /// Attach to `.trailing`.
    /// - Parameters:
    ///     - view: The `UIView` to attach to. If `nil` the currently
    ///             scaffolded `view` tries to attach ot its `superview`.
    ///     - otherAxis: If `nil` then `.left(layoutGuide)` is used instead.
    @discardableResult
    func trailing(_ layoutGuide: LayoutGuide = .view,
                  to view: UIView? = nil,
                  on otherAxis: HorizontalAxis? = nil,
                  relatedBy: NSLayoutConstraint.Relation = .equal,
                  offset constant: CGFloat = .zero,
                  priority: UILayoutPriority? = nil,
                  identifier: String? = nil) -> Scaffold {

        attach(.trailing(layoutGuide),
               to: view,
               on: otherAxis,
               relatedBy: relatedBy,
               offset: constant,
               priority: priority,
               identifier: identifier)
    }

    /// Attach to `.centerX`.
    /// - Parameters:
    ///     - view: The `UIView` to attach to. If `nil` the currently
    ///             scaffolded `view` tries to attach ot its `superview`.
    ///     - otherAxis: If `nil` then `.left(layoutGuide)` is used instead.
    @discardableResult
    func centerX(_ layoutGuide: LayoutGuide = .view,
                 to view: UIView? = nil,
                 on otherAxis: HorizontalAxis? = nil,
                 relatedBy: NSLayoutConstraint.Relation = .equal,
                 offset constant: CGFloat = .zero,
                 priority: UILayoutPriority? = nil,
                 identifier: String? = nil) -> Scaffold {

        attach(.centerX(layoutGuide),
               to: view,
               on: otherAxis,
               relatedBy: relatedBy,
               offset: constant,
               priority: priority,
               identifier: identifier)
    }
}
