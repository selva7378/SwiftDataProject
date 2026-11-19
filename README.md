# SwiftData Project — Lesson 1: Editing SwiftData Model Objects

This branch covers **Lesson 1** of Project 12 in Paul Hudson's [100 Days of SwiftUI](https://www.hackingwithswift.com/books/ios-swiftui/editing-swiftdata-model-objects).

---

## 📱 Preview

<p align="center">
  <img src="screenshots/screenshot_lesson1.png" alt="Lesson 1 - Editing Model Objects" width="300" />
</p>

---

## 💡 Concepts Covered

1. **`@Model` Macro**:
   - Creating a persistent data model class `User` tracking `name`, `city`, and `joinDate`.
2. **`@Bindable` Property Wrapper**:
   - Creating direct two-way bindings to SwiftData model properties inside `EditUserView`.
3. **Seamless Navigation & In-Place Editing**:
   - Navigating via `NavigationLink(value: user)` and `.navigationDestination(for: User.self)`.
   - Modifying fields directly in `Form` with automatic model context persistence.
4. **`modelContainer(for: User.self)`**:
   - Registering the SwiftData container at the app entry point (`SwiftDataProjectApp.swift`).
