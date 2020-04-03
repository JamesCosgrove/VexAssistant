//
//  PreferencesView.swift
//  VexAssistant
//
//  Created by James Cosgrove on 25/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct PreferencesView: View {
	var seasons = ["Toss Up", "Skyrise", "Nothing But Net", "Skyrise", "In The Zone", "Turning Point", "Tower Takeover"]
	var countries = ["United Kingdom", "United States", "Canada", "New Zealand", "Australia", "Mexico"]
	var sortingOptions = ["Future", "Past", "All"]
	var programs = ["VEXU", "VRC", "Both"]

    @State private var selectedSeason = 0
	@State private var selectedCountry = 0
	
	@Binding var toggle: Bool
	@Binding var season: Int
	@Binding var country: Int
	@Binding var sortingOrder: Int
	@Binding var program: Int
	
	@ObservedObject var settings = Settings()
	
	
    var body: some View {
		
		NavigationView {
			
			Form {
				Section(footer: Text("Choose a season and country to search."), content: {
					Picker(selection: $season, label: Text("Season")) {
						ForEach(0 ..< seasons.count) {
							Text(self.seasons[$0])

						}
					}
					Picker(selection: $country, label: Text("Country")) {
						ForEach(0 ..< countries.count) {
							Text(self.countries[$0])

						}
					}
					Picker(selection: $program, label: Text("Program")) {
						ForEach(0 ..< programs.count) {
							Text(self.programs[$0])

						}
					}
				})
				Section(footer: Text("Choose which events to display."), content: {
					
					Picker(selection: $sortingOrder, label: Text("Show Events")) {
						ForEach(0 ..< sortingOptions.count) {
							Text(self.sortingOptions[$0])

						}
					}
				})

				HStack {
					Spacer()
					VStack(alignment: .center) {
						Text("© James Cosgrove 2020")
						HStack {
							Text("Information is collected and supplied by VexDB")
						}
					}.foregroundColor(Color(UIColor.secondaryLabel))
						.font(.caption)
					Spacer()
				}
			}.navigationBarTitle("Options", displayMode: .inline)
			.listStyle(GroupedListStyle())
			.environment(\.horizontalSizeClass, .regular)
			
		}.accentColor(.orange)
		
			
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
		PreferencesView(toggle: .constant(false), season: .constant(0), country: .constant(0), sortingOrder: .constant(1), program: .constant(1))
    }
}
