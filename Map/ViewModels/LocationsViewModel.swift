//
//  LocationsViewModel.swift
//  Map
//
//  Created by Alex Beattie on 5/12/23.
//

import Foundation

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
