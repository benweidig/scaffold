# Scaffold

:exclamation: THIS PROJECT IS ONLY A PROOF-OF-CONCEPT SO FAR

A fluent AutoLayout API helper thingie.

## Why?

I don't use SwiftUI (yet) due to the iOS versions I need to support, and I hate StoryBoards with a passion... So naturally, I create all my constraints in code.

That's quite a verbose process, resulting in a lot of ugly code.
Previously, I've experimented with custom operators and extension methods to simplify the required code.

However, it's still not as nice as other approaches.
So, I gave creating a custom library another shot.

Initially, I tried to build the library around `@resultBulder` to create a SwiftUI-like experience.
Maybe something along the lines of this code:

```swift
Scaffold {
    View(self.textLabel) {
        Left(equalsTo: self.view)
        Right(equalsTo: self.view)
        Height(33.0)
    }
    View(self.icon) {
        Center(in: self.view)
        Size(24.0)
    }
}
```

Looks nice, but each component needs to be backed by a distinct type, leading to a lot of object creation for the sake of gathering the required layout information.

I'm pretty sure the additional structs wouldn't be much of an issue, but I like to prevent as many object creations as possible.
After playing around with the concept, I eventually decided to create a fluent API instead.

## Designing a Fluent API

AutoLayout expresses a View layout by using multiple `NSLayoutConstraint`s that connect certain view attributes/anchors to another view.
There are also constant values, various `UILayoutGuide`s that affect where exactly constraints connect.

To create an easy-to-use fluent API, we need to abstract all the different aspects of AutoLayout into a more common abstraction so we can circumvent any special cases or "evolutionary discrepancies" introduced by newer iOS versions.

That's why I tried to compress the different types of AutoLayout to the following concepts:
HorizontalAxis (left, leading, right, trailing, centerX)
VerticalAxis (top, bottom, centerY)
Dimension (width, height)
Layout Guides
The related anchors exist either on `UIView` or on their `UILayoutGuide`s (`safeArea`, `readableContent`, `keyboard`).
They don't share a common protocol, so I added one and made both types implement it via an empty extension.
This way, the enum `LayoutGuide` has a `func anchors(for view: UIView) -> Anchors` which simplifies the code immensely.

## Show Me The Code!

Everything t around a `Scaffold`  object.
You create it once, set the `UIView` you want to layout, and then attach the needed constraints.
When you're finished, you call `activate()`.

That's it!

Here's an example how I'm using it in one of my views:

```swift
 let scaffold = Scaffold()

// SCREENSHOT
scaffold.view(self.screenshot)
    .attach(to: view)

// FAVORITE
scaffold.view(self.favoriteButton)
    .top(offset: 4.0)
    .left(offset: 4.0)

// NEW INDICATOR
scaffold.view(self.newLabel)
    .top()
    .trailing(offset: -8.0)
    .size(width: 28.0,
          height: 26.0)

// PLAY
scaffold.view(self.playImage)
    .centerX()
    .bottom(to: self.infoView,
            on: .top(),
            offset: -4.0)
    .size(35.0)

// ACTIONS
scaffold.view(self.actions)
    .bottom(offset: -3.0)
    .trailing()
    .size(38)

scaffold.activate()
```

The underlying functions are way more complete, like this one:

```swift
func attach(_ axis: HorizontalAxis,
            to view: UIView? = nil,
            on otherAxis: HorizontalAxis? = nil,
            relatedBy: NSLayoutConstraint.Relation = .equal,
            offset constant: CGFloat = .zero,
            priority: UILayoutPriority? = nil,
            identifier: String? = nil) -> Scaffold
```

Most methods follow the same style, and try to have sensible default.
For example, if you don't provide a `view`, the constraint gets attached to the current scaffolded `view.superview!` instead.
If no target anchor/attribute is specified, the same as the left side one is used:

```swift
self.view.addSubview(self.textLabel)

let scaffold = Scaffold().view(self.textLabel)

// variant 1: most expressive
scaffold.attach(.left(),
                to: self.view,
                on: left)

// variant 2: no target anchor/attribute
scaffold.attach(.left(),
                to: self.view)

// variant 3: attach to super view
scaffold.attach(.left())

// variant 4: convenience method
scaffold.left()
```

To use layout guides, you can use them as the associated value of the anchor/attribute:

```swift
scaffold.attach(.left(.safeArea))

// or

scaffold.left(.safeArea)
```

## What's missing?

I've implemented only some of what AutoLayout supports. System spacing still needs to be added, and I also want to add more convenient methods.

Function signatures, especially argument names, might change to better match a "fluent" approach.
But so far, I'm happy with my proof-of-concept.

## Licence

MIT.
