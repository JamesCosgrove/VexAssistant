//
//  ContentView.swift
//  VexAssistant
//
//  Created by James Cosgrove on 22/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI
import Combine

struct EventsView: View {
	
	@ObservedObject var fetch = FetchEvents()
	@ObservedObject var oldSettings = ManageData()
	@ObservedObject var settings = Settings()
	
	@State var showSortingSheet = false
	@State var navBarTitle = "Past Events"
	@State var presentModal = false
	
	@State var toggle: Bool = false
	@State var season: Int = 6
	@State var country: Int = 0
	@State var sortOrder: Int = 2
	@State var program: Int = 1
	
	var seasons = ["Toss Up", "Skyrise", "Nothing But Net", "Skyrise", "In The Zone", "Turning Point", "Tower Takeover"]
	var countries = ["United Kingdom", "United States", "Canada", "New Zealand", "Australia", "Mexico"]
	var sortingOptions = ["future", "past", "all"]
	var sortingOptionsToShow = ["future", "past", "all"]
	var programs = ["VEXU", "VRC", ""]

	
    var body: some View {
		
		LoadingView(isShowing: .constant(fetch.dataLoading)) {
			NavigationView {
				VStack(alignment: .center) {
					
					if self.fetch.eventList.result.count != 0 {
						List() {
							ForEach(self.fetch.eventList.result, id: \.sku) { event in
								//print("hi")
								NavigationLink(destination: EventDetail(event: event)) {
									EventCell(name: event.name, location: event.loc_city, date: event.start)
								}
							}
						}
					}
					else {
						if self.fetch.dataLoading == false {
							NoDataView(message: "There are no events that match your search options.")
						}
					}
				}.navigationBarTitle("\(self.sortingOptionsToShow[self.sortOrder].capitalized) Events")
					.navigationBarItems(trailing: Button(action: {
						self.presentModal = true
					}, label: {
						Image(systemName: "arrow.up.arrow.down")
							.imageScale(.large)
							.font(Font.headline.weight(.bold))
							.frame(width: 30, height: 30, alignment: .center)
					})
				)

			}.onAppear {
				self.fetch.fetchEvents(status: self.sortingOptions[self.sortOrder], country: self.countries[self.country], season: self.seasons[self.season], program: self.programs[self.program])
			}
			
			
			.sheet(isPresented: self.$presentModal, onDismiss: {
				self.fetch.fetchEvents(status: self.sortingOptions[self.sortOrder], country: self.countries[self.country], season: self.seasons[self.season], program: self.programs[self.program])
			}, content: {
				PreferencesView(toggle: self.$toggle, season: self.$season, country: self.$country, sortingOrder: self.$sortOrder, program: self.$program).accentColor(.orange)
		})
		}.animation(.linear(duration: 0.15))
    }
	
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
