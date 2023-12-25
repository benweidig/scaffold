//
//  Dimensions/Scaffold+Dimension.swift
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

    /// Add a constraint for a `Dimension` in relation to another view.
    @discardableResult
    func set(_ dimension: Dimension,
             to view: UIView? = nil,
             on otherDimension: Dimension? = nil,
             relatedBy: NSLayoutConstraint.Relation = .equal,
             multiplier: CGFloat = 1.0,
             value constant: CGFloat = .zero,
             priority: UILayoutPriority? = nil,
             identifier: String? = nil) -> Scaffold {

        let layoutDimension = dimension.toLayoutDimension(self.view)
        let otherLayoutDimension = (otherDimension ?? dimension).toLayoutDimension(view ?? self.view)

        let constraint = switch relatedBy {

        case .lessThanOrEqual:
            layoutDimension.constraint(lessThanOrEqualTo: otherLayoutDimension,
                                       multiplier: multiplier,
                                       constant: constant)
        case .equal:
            layoutDimension.constraint(equalTo: otherLayoutDimension,
                                       multiplier: multiplier,
                                       constant: constant)

        case .greaterThanOrEqual:
            layoutDimension.constraint(greaterThanOrEqualTo: otherLayoutDimension,
                                       multiplier: multiplier,
                                       constant: constant)

        @unknown default:
            fatalError()
        }

        addToScaffold(constraint,
                      priority: priority,
                      identifier: identifier)

        return self
    }

    /// Add a constraint for a `Dimension` with a constant value.
    @discardableResult
    func set(_ dimension: Dimension,
             _ constant: CGFloat,
             _ relatedBy: NSLayoutConstraint.Relation = .equal,
             priority: UILayoutPriority? = nil,
             identifier: String? = nil) -> Scaffold {

        let layoutDimension = dimension.toLayoutDimension(self.view)

        let constraint = switch relatedBy {
        case .lessThanOrEqual:
            layoutDimension.constraint(lessThanOrEqualToConstant: constant)

        case .equal:
            layoutDimension.constraint(equalToConstant: constant)

        case .greaterThanOrEqual:
            layoutDimension.constraint(greaterThanOrEqualToConstant: constant)

        @unknown default:
            fatalError()
        }

        addToScaffold(constraint,
                      priority: priority,
                      identifier: identifier)

        self.constraints.append(constraint)

        return self
    }

    // MARK: -

    /// Add a `.width`-based constraint in relation to another view.
    @discardableResult
    func width(_ layoutGuide: LayoutGuide,
               to view: UIView,
               on otherDimension: Dimension? = nil,
               relatedBy: NSLayoutConstraint.Relation = .equal,
               multiplier: CGFloat = 1.0,
               value constant: CGFloat = .zero,
               priority: UILayoutPriority? = nil,
               identifier: String? = nil) -> Scaffold {

        set(.width(layoutGuide),
            to: view,
            on: otherDimension,
            relatedBy: relatedBy,
            multiplier: multiplier,
            value: constant,
            priority: priority,
            identifier: identifier)
    }

    /// Add a `.width`-based constraint with a constant value.
    @discardableResult
    func width(_ layoutGuide: LayoutGuide,
               _ constant: CGFloat,
               _ relatedBy: NSLayoutConstraint.Relation = .equal,
               priority: UILayoutPriority? = nil,
               identifier: String? = nil) -> Scaffold {

        set(.width(layoutGuide),
            constant,
            relatedBy,
            priority: priority,
            identifier: identifier)
    }

    /// Add a `.width`-based constraint with a constant value.
    @discardableResult
    func width(_ constant: CGFloat,
               _ relatedBy: NSLayoutConstraint.Relation = .equal,
               priority: UILayoutPriority? = nil,
               identifier: String? = nil) -> Scaffold {

        set(.width(),
            constant,
            relatedBy,
            priority: priority,
            identifier: identifier)
    }

    // MARK: -

    /// Add a `.height`-based constraint in relation to another view.
    @discardableResult
    func height(_ layoutGuide: LayoutGuide,
                to view: UIView,
                on otherDimension: Dimension? = nil,
                relatedBy: NSLayoutConstraint.Relation = .equal,
                multiplier: CGFloat = 1.0,
                value constant: CGFloat = .zero,
                priority: UILayoutPriority? = nil,
                identifier: String? = nil) -> Scaffold {

        set(.height(layoutGuide),
            to: view,
            on: otherDimension,
            relatedBy: relatedBy,
            multiplier: multiplier,
            value: constant,
            priority: priority,
            identifier: identifier)
    }

    /// Add a `.height`-based constraint with a constant value.
    @discardableResult
    func height(_ layoutGuide: LayoutGuide,
                _ constant: CGFloat,
                _ relatedBy: NSLayoutConstraint.Relation = .equal,
                priority: UILayoutPriority? = nil,
                identifier: String? = nil) -> Scaffold {

        set(.height(layoutGuide),
            constant,
            relatedBy,
            priority: priority,
            identifier: identifier)
    }

    /// Add a `.height`-based constraint with a constant value.
    @discardableResult
    func height(_ constant: CGFloat,
                _ relatedBy: NSLayoutConstraint.Relation = .equal,
                priority: UILayoutPriority? = nil,
                identifier: String? = nil) -> Scaffold {

        set(.width(),
            constant,
            relatedBy,
            priority: priority,
            identifier: identifier)
    }

    // MARK: -

    /// Add a `.width`- and `.height`-based constraint with a constant value.
    @discardableResult
    func size(_ layoutGuide: LayoutGuide = .view,
              width: CGFloat,
              height: CGFloat,
              _ relatedBy: NSLayoutConstraint.Relation = .equal,
              priority: UILayoutPriority? = nil,
              identifier: String? = nil) -> Scaffold {

        set(.width(layoutGuide),
            width,
            relatedBy,
            priority: priority,
            identifier: identifier)

        set(.height(layoutGuide),
            height,
            relatedBy,
            priority: priority,
            identifier: identifier)

        return self
    }

    /// Add a `.width`- and `.height`-based constraint with a constant value.
    @discardableResult
    func size(_ value: CGFloat,
              _ relatedBy: NSLayoutConstraint.Relation = .equal,
              priority: UILayoutPriority? = nil,
              identifier: String? = nil) -> Scaffold {

        size(.view,
             width: value,
             height: value,
             relatedBy,
             priority: priority,
             identifier: identifier)
    }
}
