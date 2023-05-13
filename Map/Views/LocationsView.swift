//
//  LocationsView.swift
//  Map
//
//  Created by Alex Beattie on 5/12/23.
//

import SwiftUI



struct LocationsView: View {
//    @StateObject private var vm = LocationsViewModel()
    @EnvironmentObject private var vm:LocationsViewModel
    var body: some View {
        List {
            ForEach(vm.locations) {
                Text($0.cityName)
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
