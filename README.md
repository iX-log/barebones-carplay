# CarPlay Diem

A CarPlay app with nothing on it but the bare necessities. Pure SwiftUI,
omitting `CPTemplate`.

Two screens, one store,
[no arguments](https://www.youtube.com/watch?v=D1fOLHnTlyA).

https://github.com/user-attachments/assets/9b0082e7-bd92-4ea7-ae25-8d58615ff05f

## Huh? What is this?

The code behind my Medium series, **Barebones CarPlay App**. 

When I first built a CarPlay app in SwiftUI, I couldn't find the articles I needed. So I wrote them, mostly for Future Me.

The series explains the *why*. This repo is the *what*.

- [Part Xero: Shortest Path](https://medium.com/@ixhen.dev/barebones-carplay-app-part-xero-shortest-path-8213f10dceff): the bare minimum to get it running
- [Part Un: A Path to Remember](https://medium.com/@ixhen.dev/barebones-carplay-app-part-un-a-path-to-remember-da9d640e5314): getting it onto a screen, simulated or real
- [Part Deux: A Path Upon a Dream](https://medium.com/@ixhen.dev/barebones-carplay-app-part-deux-a-path-upon-a-dream-467db81a0be3): the structure, the model and the backend
- [Part Deux: Happily Ever CarPlay](https://medium.com/@ixhen.dev/barebones-carplay-app-part-deux-happily-ever-carplay-29987132d9fd): the store that keeps both screens in sync

## Run it

1. Open `IHCarplayBarebonesApp.xcodeproj`.
2. Pick an iPhone simulator and hit ⌘R.
3. In the Simulator menu, go to **I/O > External Displays > CarPlay**.
4. Flip the dress color on one screen. Watch the other one follow.

## Small print

The CarPlay protocol in the entitlements and `Info.plist` is a placeholder,
`com.not-my-audi`. 

The simulator doesn't care what you call it. A real head
unit does, and for that you need the identifier Apple grants you.

Read this as a companion to
[Apple's own CarPlay documentation](https://developer.apple.com/carplay/),
not a replacement.
