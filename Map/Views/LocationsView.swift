//
//  LocationsView.swift
//  Map
//
//  Created by Alex Beattie on 5/12/23.
//

import SwiftUI
import MapKit


struct LocationsView: View {
    @EnvironmentObject private var vm:LocationsViewModel

    var body: some View {
        
        ZStack{
            mapLayer
                .ignoresSafeArea()
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
                locationsPreview
            }
            
        }
        .sheet(item: $vm.sheetLocation,onDismiss: nil) { location in
            LocationDetailsView(location: location)
        }
        
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}


extension LocationsView {
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
    //                .background(Color.red)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down").font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }
            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial).cornerRadius(10).shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion,  annotationItems: vm.locations) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        }
    }
    private var locationsPreview: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                    
                }
            }
        }
    }
}
