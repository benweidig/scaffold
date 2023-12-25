//
//  Axes/Scaffold+VerticalAxis.swift
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
    func attach(_ axis: VerticalAxis,
                to view: UIView? = nil,
                on otherAxis: VerticalAxis? = nil,
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

        self.constraints.append(constraint)

        return self
    }

    @discardableResult
    func attach(_ axis: VerticalAxis,
                to view: UIView,
                on otherAxis: VerticalAxis? = nil,
                relatedBy: NSLayoutConstraint.Relation = .equal,
                systemSpacingMultiplier multiplier: CGFloat = 1.0,
                priority: UILayoutPriority? = nil,
                identifier: String? = nil) -> Scaffold {

        let anchor = axis.toAnchor(self.view)
        let otherAnchor = (otherAxis ?? axis).toAnchor(view)

        let constraint = switch relatedBy {
        case .lessThanOrEqual:
            anchor.constraint(lessThanOrEqualToSystemSpacingBelow: otherAnchor,
                              multiplier: multiplier)
        case .equal:
            anchor.constraint(equalToSystemSpacingBelow: otherAnchor,
                              multiplier: multiplier)
        case .greaterThanOrEqual:
            anchor.constraint(greaterThanOrEqualToSystemSpacingBelow: otherAnchor,
                              multiplier: multiplier)
        @unknown default:
            fatalError()
        }

        addToScaffold(constraint,
                      priority: priority,
                      identifier: identifier)

        return self
    }

    @discardableResult
    func top(_ layoutGuide: LayoutGuide = .view,
             to view: UIView? = nil,
             on otherAxis: VerticalAxis? = nil,
             relatedBy: NSLayoutConstraint.Relation = .equal,
             offset constant: CGFloat = .zero,
             priority: UILayoutPriority? = nil,
             identifier: String? = nil) -> Scaffold {

        attach(.top(layoutGuide),
               to: view,
               on: otherAxis,
               relatedBy: relatedBy,
               offset: constant,
               priority: priority,
               identifier: identifier)
    }

    @discardableResult
    func bottom(_ layoutGuide: LayoutGuide = .view,
                to view: UIView? = nil,
                on otherAxis: VerticalAxis? = nil,
                relatedBy: NSLayoutConstraint.Relation = .equal,
                offset constant: CGFloat = .zero,
                priority: UILayoutPriority? = nil,
                identifier: String? = nil) -> Scaffold {

        attach(.bottom(layoutGuide),
               to: view,
               on: otherAxis,
               relatedBy: relatedBy,
               offset: constant,
               priority: priority,
               identifier: identifier)
    }

    @discardableResult
    func centerY(_ layoutGuide: LayoutGuide = .view,
                 to view: UIView? = nil,
                 on otherAxis: VerticalAxis? = nil,
                 relatedBy: NSLayoutConstraint.Relation = .equal,
                 offset constant: CGFloat = .zero,
                 priority: UILayoutPriority? = nil,
                 identifier: String? = nil) -> Scaffold {

        attach(.centerY(layoutGuide),
               to: view,
               on: otherAxis,
               relatedBy: relatedBy,
               offset: constant,
               priority: priority,
               identifier: identifier)
    }
}
