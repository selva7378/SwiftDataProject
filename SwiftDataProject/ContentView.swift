//
//  ContentView.swift
//  SwiftDataProject
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    @State private var path = [User]()

    var body: some View {
        NavigationStack(path: $path) {
            UsersView(
                minimumJoinDate: showingUpcomingOnly ? .now : .distantPast,
                sortOrder: sortOrder
            )
            .navigationTitle("Users & Jobs")
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                        showingUpcomingOnly.toggle()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by Name")
                                .tag([
                                    SortDescriptor(\User.name),
                                    SortDescriptor(\User.joinDate)
                                ])

                            Text("Sort by Join Date")
                                .tag([
                                    SortDescriptor(\User.joinDate),
                                    SortDescriptor(\User.name)
                                ])
                        }
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Samples", systemImage: "plus") {
                        addSamples()
                    }
                }
            }
            .onAppear {
                addSamples()
            }
        }
    }

    private func addSamples() {
        try? modelContext.delete(model: User.self)
        try? modelContext.delete(model: Job.self)

        let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
        let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
        let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
        let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

        let job1 = Job(name: "Record new album", priority: 3)
        let job2 = Job(name: "World stadium tour", priority: 5)
        let job3 = Job(name: "Solve tactical cases", priority: 4)
        let job4 = Job(name: "Coach Richmond FC", priority: 5)

        modelContext.insert(first)
        modelContext.insert(second)
        modelContext.insert(third)
        modelContext.insert(fourth)

        first.jobs.append(job1)
        first.jobs.append(job2)
        second.jobs.append(job3)
        third.jobs.append(job4)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self, inMemory: true)
}
