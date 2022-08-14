//
//  Kumparan_RecruitmentApp.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 11/08/22.
//

import SwiftUI

@main
struct Kumparan_RecruitmentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            UserDetailView(userId: 1, userName: "Jonathan")
                .preferredColorScheme(.light)
        }
    }
}
