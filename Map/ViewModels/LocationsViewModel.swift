//
//  LocationsViewModel.swift
//  Map
//
//  Created by Alex Beattie on 5/12/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    //ALL LOADED LOCATIONS
    @Published var locations: [Location]
    
    //CURRENT LOCATION on Map - in order to update mapRegion we add a didSet to mapLocation - "every time we SET mapLocation we update (SET) mapRegion
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    //Current Region On Map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)

    @Published var showLocationsList: Bool = false
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            
              mapRegion = MKCoordinateRegion(
                  center: location.coordinates,
                  span: mapSpan)
        }
    }
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false 
        }
    }
}
