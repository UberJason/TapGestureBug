# TapGestureBug

This project shows a bug with SwiftUI onTapGesture in Mac Catalyst apps on Big Sur. onTapGesture works fine on iOS and Mac native (AppKit) apps. In this project, the green and blue squares use onTapGesture, while the orange square (only available in iOS and Catalyst) uses a UIViewRepresentable wrapper with a UITapGestureRecognizer.

Steps to reproduce:
1. Run the project using the TapGestureBug (iOS) scheme in an iPhone simulator, and observe that tapping the green and blue squares always toggles their state (from 5% to 100% opacity), also printing "green tapped" or "blue tapped" in the console.
2. Run the project using the TapGestureBug (macOS) scheme for Mac, observing the same correct behavior.
3. Run the project using the TapGestureBug (iOS) scheme on My Mac, which is the Catalyst build. The behavior is *not* correct:
    * Observe that tapping green or blue squares *often does not toggle their state.*
    * The behavior may start out consistent, but once you start tapping different squares, it all falls apart.
    * Also observe that the console often prints a statement similar to "Invalid timestamps for HID response delay: 8104836708916 to 194516280245"
