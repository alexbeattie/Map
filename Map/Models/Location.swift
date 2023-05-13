//
//  Location.swift
//  Map
//
//  Created by Alex Beattie on 5/12/23.
//

import Foundation
import MapKit

struct Location: Identifiable {
//    let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    //Identifiables
    var id: String {
       name + cityName
    }
}
