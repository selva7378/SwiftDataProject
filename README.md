# SwiftData Project — Lesson 4: Relationships with SwiftData, SwiftUI, and @Query

This branch covers **Lesson 4** of Project 12 in Paul Hudson's [100 Days of SwiftUI](https://www.hackingwithswift.com/books/ios-swiftui/relationships-with-swiftdata-swiftui-and-query).

---

## 📱 Preview

<p align="center">
  <img src="screenshots/screenshot_lesson4.png" alt="Lesson 4 - Relationships with SwiftData" width="300" />
</p>

---

## 💡 Concepts Covered

1. **Modeling Relationships with `@Relationship`**:
   - Creating a second model `Job` with properties `name`, `priority`, and optional inverse `owner: User?`.
   - Linking `User` to `Job` with a cascade deletion rule:
     ```swift
     @Relationship(deleteRule: .cascade) var jobs = [Job]()
     ```
2. **Cascade Delete Rule**:
   - Ensuring that when a `User` is deleted from the SwiftData context, all of their associated `Job` records are automatically removed.
3. **Displaying Related Entities**:
   - Rendering relationship counts cleanly in the UI with Swift's built-in Markdown inflection:
     ```swift
     Text("^[\(user.jobs.count) job](inflect: true)")
     ```
4. **Automatic Model Container Schema Detection**:
   - Registering `modelContainer(for: User.self)` automatically discovers and configures the related `Job` entity.
