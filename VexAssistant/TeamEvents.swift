//
//  TeamEvents.swift
//  VexAssistant
//
//  Created by James Cosgrove on 27/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct TeamEvents: View {
	
	@State var teamNumber: String
	
	@ObservedObject var fetchEvents = FetchEvents()
	
    var body: some View {
		List {
			Section(header: Text(fetchEvents.eventList.result.count != 1 ? "\(fetchEvents.eventList.result.count) Events" : "1 Event")) {
				ForEach(fetchEvents.eventList.result, id: \.sku) { event in
					NavigationLink(destination: EventDetail(event: event)) {
						EventCell(name: event.name, location: event.loc_city, date: event.start)
					}
				}
			}
		}.navigationBarTitle("Recent Events")
			.onAppear {
				self.fetchEvents.fetchEvents(team: self.teamNumber, program: "")
		}
		
    }
}

struct TeamEvents_Previews: PreviewProvider {
    static var previews: some View {
        TeamEvents(teamNumber: "3116B")
    }
}
