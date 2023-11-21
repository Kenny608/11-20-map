//
//  ContentView.swift
//  11-20
//
//  Created by Kenny Luchau on 11/20/23.
//

import SwiftUI
import MapKit
struct ContentView: View {
    let locationManager = CLLocationManager()
    @State var message = "Map of bothel"
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.761346, longitude: -122.191990), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    //    struct IdentifiablePlace: Identifiable {
    //        let id: UUID
    //        let location: CLLocationCoordinate2D
    //        init(id: UUID = UUID(), lat: Double, long: Double) {
    //            self.id = id
    //            self.location = CLLocationCoordinate2D(
    //                latitude: lat,
    //                longitude: long)
    //        }
    //    }
    let bothell = CLLocationCoordinate2D(latitude: 47.761160, longitude: -122.205609)
    let marker = CLLocationCoordinate2D(latitude: 47.760447, longitude: -122.202381)
    let pin = CLLocationCoordinate2D(latitude: 47.761810, longitude: -122.209091)
    let college = CLLocationCoordinate2D(latitude: 47.761346, longitude: -122.191990)
    // Unsure of how to get different kinds of marker all onto the same map at the SAME time
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: [
            IdentifiablePlace(coordinate: marker, title: "Marker Location"),
            IdentifiablePlace(coordinate: pin, title: "Pin Location"),
            IdentifiablePlace(coordinate: college, title: "Cascadia College")
        ]) { item in
            MapMarker(coordinate: item.coordinate, tint: .red)
        }
        .onAppear {
            region.center = bothell
        }
    }
}

struct IdentifiablePlace: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
