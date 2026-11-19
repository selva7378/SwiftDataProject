# SwiftData Project — Lesson 3: Dynamically Sorting and Filtering @Query

This branch covers **Lesson 3** of Project 12 in Paul Hudson's [100 Days of SwiftUI](https://www.hackingwithswift.com/books/ios-swiftui/dynamically-sorting-and-filtering-query-with-swiftdata).

---

## 📱 Preview

<p align="center">
  <img src="screenshots/screenshot_lesson3.png" alt="Lesson 3 - Dynamic Sorting and Filtering" width="300" />
</p>

---

## 💡 Concepts Covered

1. **Dynamic `@Query` in a Custom Subview (`UsersView`)**:
   - Because a view's `@Query` cannot be reconfigured directly after initialization, we extract the list into a dedicated child view (`UsersView`).
   - Inside `UsersView.init`, we configure `_users = Query(...)` using dynamic runtime predicates and sort descriptors:
     ```swift
     init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
         _users = Query(filter: #Predicate<User> { user in
             user.joinDate >= minimumJoinDate
         }, sort: sortOrder)
     }
     ```
2. **Dynamic Sort Orders**:
   - Using `SortDescriptor` arrays with a toolbar `Menu` and `Picker` to switch between "Sort by Name" and "Sort by Join Date".
3. **Dynamic Filtering**:
   - Toggling between "Show Upcoming" (users whose `joinDate >= .now`) and "Show Everyone".
