# SwiftData Project — Lesson 2: Filtering @Query Using #Predicate

This branch covers **Lesson 2** of Project 12 in Paul Hudson's [100 Days of SwiftUI](https://www.hackingwithswift.com/books/ios-swiftui/filtering-query-using-predicate).

---

## 📱 Preview

<p align="center">
  <img src="screenshots/screenshot_lesson2.png" alt="Lesson 2 - Filtering with #Predicate" width="300" />
</p>

---

## 💡 Concepts Covered

1. **`#Predicate` Macro**:
   - Filtering SwiftData models directly at database query time.
   - Example: filtering users whose names contain "R" and whose city is "London":
     ```swift
     @Query(filter: #Predicate<User> { user in
         user.name.localizedStandardContains("R") &&
         user.city == "London"
     }, sort: \User.name) var users: [User]
     ```
2. **Type-Safe Predicate Expressions**:
   - Using standard Swift closure syntax that compiles down into underlying database conditions.
   - Leveraging `localizedStandardContains` for case- and diacritic-insensitive search.
3. **Combining Multiple Conditions**:
   - Using logical `&&` and `||` to chain multiple query constraints cleanly.
