//
//  LocationDetailsView.swift
//  Map
//
//  Created by Alex Beattie on 5/19/23.
//

import SwiftUI

struct LocationDetailsView: View {
    let location: Location
    var body: some View {
//        Text(location.name)
        ScrollView {
            VStack {
                

                TabView  {
                    ForEach(location.imageNames, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                    }
                }
                .frame(height: 500)
                .tabViewStyle(PageTabViewStyle())
            }
        }
        .ignoresSafeArea()
    }
}

struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsView(location: LocationsDataService.locations.first!)
    }
}
