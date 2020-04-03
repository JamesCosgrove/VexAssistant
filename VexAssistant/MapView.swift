//
//  MapView.swift
//  VexAssistant
//
//  Created by James Cosgrove on 27/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation


struct MapView: UIViewRepresentable {
	
	@State var address: String
	@State var showPin = false
	
	func updateUIView(_ view: MKMapView, context: Context){
		

		let geoCoder = CLGeocoder()
		geoCoder.geocodeAddressString(address) { (placemarks, error) in
			guard
				let placemarks = placemarks,
				let location = placemarks.first?.location
			else {
				// handle no location found
				return
			}
			let dropPin = MKPointAnnotation()
			dropPin.coordinate = location.coordinate
			if self.showPin {
				view.addAnnotation(dropPin)
				view.selectAnnotation(dropPin, animated: true)
			}
//			self.myMapView.addAnnotation(dropPin)
//			self.myMapView.selectAnnotation( dropPin, animated: true)
			
			let span = MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025)
			let region = MKCoordinateRegion(center: location.coordinate, span: span)
			view.setRegion(region, animated: false)
			// Use your location
		}
			

			
	}
	
    /**
     - Description - Replace the body with a make UIView(context:) method that creates and return an empty MKMapView
     */
    func makeUIView(context: Context) -> MKMapView{
         MKMapView(frame: .zero)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
		MapView(address: "3 Briscoe Road, Hoddesdon")
    }
}
