//
//  Scaffold.swift
//  Scaffold
//
//  https://github.com/benweidig/Scaffold
//  Copyright (c) 2023 Ben Weidig
//
//  This work is licensed under the terms of the MIT license.
//  For a copy, see LICENSE, or <https://opensource.org/licenses/MIT>
//

import UIKit

public class Scaffold {

    var constraints: [NSLayoutConstraint] = []

    var view: UIView!
    var activateImmediately: Bool

    public init(activateImmediately: Bool = false) {
        self.activateImmediately = activateImmediately
    }

    public func view(_ view: UIView) -> Scaffold {
        self.view = view
        self.view.translatesAutoresizingMaskIntoConstraints = false

        return self
    }

    public func activate() {
        NSLayoutConstraint.activate(self.constraints)
        self.constraints.removeAll()
    }

    func addToScaffold(_ constraint: NSLayoutConstraint,
                       priority: UILayoutPriority? = nil,
                       identifier: String?) {

        if let priority {
            constraint.priority = priority
        }

        if let identifier {
            constraint.identifier = identifier
        }

        constraint.isActive = self.activateImmediately

        self.constraints.append(constraint)
    }
}
