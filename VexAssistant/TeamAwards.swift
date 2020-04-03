//
//  TeamAwards.swift
//  VexAssistant
//
//  Created by James Cosgrove on 27/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI
struct TeamAwards: View {
	
	@State var teamNumber: String
	@State var isLoading : Bool
	
	@ObservedObject var fetchAwards = FetchAwards()
	@ObservedObject var fetchOneEvent = FetchOneEvent()
	
	var event = Event(status: 0, size: 0, result: [])
	
    var body: some View {
		LoadingView(isShowing: .constant(isLoading)) {
        List {
			ForEach(0..<self.fetchAwards.awardList.result.count, id: \.self) { award in
				VStack(alignment:.leading) {
					
					Text(self.fetchAwards.awardList.result[award].name)
						.font(Font.headline.weight(.semibold))
					
					if self.fetchOneEvent.eventName.count >= self.fetchAwards.awardList.result.count {
						Text(self.fetchOneEvent.eventName[award])
							.font(Font.headline.weight(.semibold))
							.foregroundColor(Color(UIColor.secondaryLabel))
							.onAppear {
								self.isLoading = false
						}
					}
					if self.fetchOneEvent.eventDate.count >= self.fetchAwards.awardList.result.count {
						Text(self.fetchOneEvent.eventDate[award])
						.font(Font.headline.weight(.semibold))
							.foregroundColor(.orange)
					}
				}
			}.onAppear {
				if self.fetchOneEvent.eventName.count <= self.fetchAwards.awardList.result.count {
					for award in 0..<self.fetchAwards.awardList.result.count {
							self.fetchOneEvent.fetchEvent(sku: self.fetchAwards.awardList.result[award].sku)
					}
					self.isLoading = true
				}
				
		}
		}.navigationBarTitle("Recent Events")
			.onAppear {
				self.fetchAwards.fetchAwards(team: self.teamNumber)
			}
		}
    }
}

struct TeamAwards_Previews: PreviewProvider {
    static var previews: some View {
		TeamAwards(teamNumber: "3116B", isLoading: false)
    }
}
