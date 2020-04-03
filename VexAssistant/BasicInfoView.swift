//
//  BasicInfoView.swift
//  VexAssistant
//
//  Created by James Cosgrove on 24/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct BasicInfoView: View {
	@State var name: String
	@State var loc_address1: String
	@State var postcode: String
	@State var showMap = false
    var body: some View {
		HStack(alignment: .top) {
			Button(action: {
				self.showMap = true
			}, label: {
				MapView(address: "\(loc_address1), \(postcode)", showPin: false)
				.cornerRadius(10)
					.frame(width: 140, height: 140, alignment: .center)
					
					.shadow(color: Color(UIColor.tertiaryLabel), radius: 15, x: 0, y: 0)
			})
			
//				.overlay(RoundedRectangle(cornerRadius: 10))
//			Rectangle()
//				.frame(width: 140, height: 140, alignment: .center)
//				.cornerRadius(5)
//				.foregroundColor(Color(UIColor.quaternaryLabel))
			VStack(alignment: .leading) {
				Text(name)
					.font(Font.headline.weight(.semibold))
					.padding(.bottom, 5)
					.lineLimit(3)
				Text(loc_address1)
					.font(Font.headline.weight(.regular))
					.foregroundColor(.orange)
					.padding(.bottom, 5)
				Text(postcode)
					.font(Font.headline.weight(.regular))
					.foregroundColor(Color(UIColor.secondaryLabel))
			}
			Spacer(minLength: 0)
		}.padding([.leading, .trailing]).frame(height: 140, alignment: .center)
		.sheet(isPresented: $showMap, content: {
			VStack {
				Text(self.loc_address1)
				Text(self.postcode).foregroundColor(Color(UIColor.secondaryLabel))
				MapView(address: "\(self.loc_address1), \(self.postcode)", showPin: true).edgesIgnoringSafeArea(.all)
			}.padding(.top).font(Font.headline.weight(.semibold))
		})
    }
	
}

struct BasicInfoView_Previews: PreviewProvider {
    static var previews: some View {
		BasicInfoView(name: "Event name that is really long and overfflows", loc_address1: "Event address", postcode: "EV37 TN4")
    }
}
