//
//  MapApp.swift
//  Map
//
//  Created by Alex Beattie on 5/12/23.
//

import SwiftUI

@main
struct MapApp: App {
    @StateObject private var vm = LocationsViewModel()

    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
