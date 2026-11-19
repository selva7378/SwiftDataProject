//
//  UsersView.swift
//  SwiftDataProject
//

import SwiftUI
import SwiftData

struct UsersView: View {
    @Query var users: [User]

    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }

    var body: some View {
        List(users) { user in
            NavigationLink(value: user) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.city)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Text(user.joinDate.formatted(date: .abbreviated, time: .omitted))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    UsersView(minimumJoinDate: .distantPast, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self, inMemory: true)
}
