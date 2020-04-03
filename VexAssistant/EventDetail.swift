//
//  EventDetail.swift
//  VexAssistant
//
//  Created by James Cosgrove on 24/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

extension Array {
    func chunked(by chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}

struct EventDetail: View {
	
	@State var event: EventData
	@State var pickerSelection = 0
	@State var selectedDivision = 0
	
	@ObservedObject private var fetchMatches = FetchMatches()
	@ObservedObject private var fetchRankings = FetchRankings()
	@ObservedObject private var fetchAwards = FetchAwards()
	
	
	var body: some View {
		
		ScrollView {
			
			BasicInfoView(name: event.name, loc_address1: event.loc_address1, postcode: event.loc_postcode)
				.padding(.top)
				.onAppear {
					self.fetchMatches.fetchMatches(sku: self.event.sku)
					self.fetchRankings.fetchRangings(sku: self.event.sku)
					self.fetchAwards.fetchAwards(sku: self.event.sku)
			}
			
			Divider().padding(.leading)
			
			Picker(selection: $pickerSelection, label: Text("What is your favorite color?")) {
				Text("Matches").tag(0)
				Text("Rankings").tag(1)
				Text("Awards").tag(2)
			}.pickerStyle(SegmentedPickerStyle())
				.padding([.leading, .trailing])
				
				
			
			
			if pickerSelection == 0 {
				if fetchMatches.matchList.size > 0 {
					VStack {
						ForEach(0..<event.divisions.chunked(by: 3).count, id: \.self) { row in
							HStack {
								ForEach(0..<self.event.divisions.chunked(by: 3)[row].count, id: \.self) {div in
									//Text(self.event.divisions.chunked(by: 3)[row][div])
//									ButtonView(selectedDiv: self.$selectedDivison, event: self.event, row: row, div: div)
									Button(action: {
										self.selectedDivision = ((row * 3) + div)
									}, label: {
										ButtonView(row: row, div: div, selectedDivision: self.$selectedDivision, event: self.event)
									})
								}
							}
						}
					}.padding(.horizontal)
						
					
				}
				else {
					if fetchMatches.isLoading == false {
						NoDataView(message: "There were no matches found for this event.")
					}

				}
				ForEach(self.fetchMatches.matchList.result, id: \.self) { match in
					Group {
						if match.division == self.event.divisions[self.selectedDivision] {
							VStack {
								MatchCell(matchData: match)
								Divider().padding(.leading)
								
							}
						}
					}
				}
				
			}
			if pickerSelection == 1 {
				
				if fetchRankings.rankingList.size != 0 {
					if event.divisions.count > 1 {
						VStack {
							ForEach(0..<modifiedDivisionList(divisions: self.event.divisions).chunked(by: 3).count, id: \.self) { row in
								HStack {
									ForEach(0..<self.modifiedDivisionList(divisions: self.event.divisions).chunked(by: 3)[row].count, id: \.self) {div in
										//Text(self.event.divisions.chunked(by: 3)[row][div])
	//									ButtonView(selectedDiv: self.$selectedDivison, event: self.event, row: row, div: div)
										Button(action: {
											self.selectedDivision = ((row * 3) + div)
										}, label: {
											ButtonView(row: row, div: div, selectedDivision: self.$selectedDivision, event: self.event)
										}).onAppear(perform: {
											if self.selectedDivision == self.event.divisions.count - 1 {
												self.selectedDivision = self.event.divisions.count - 2
											}
										})
									}
								}
							}
						}.padding(.horizontal)
//						HStack {
//							ForEach(0..<event.divisions.count, id: \.self) { division in
//								VStack {
//									if self.event.divisions[division] != "Finals" {
//										Button(action: {
//											self.selectedDivision = division
//										}, label: {
//											ZStack {
//
//												RoundedRectangle(cornerRadius: 10)
//													.foregroundColor(division == self.selectedDivision ? Color.accentColor : Color(UIColor.quaternaryLabel))
//													.frame(height: 50, alignment: .center)
//
//												Text("\(self.event.divisions[division].lowercased().capitalized)")
//													.foregroundColor(.white)
//													.font(Font.headline.weight(.semibold))
//
//											}
//										}).onAppear(perform: {
//											if self.selectedDivision == self.event.divisions.count - 1 {
//												self.selectedDivision = self.event.divisions.count - 2
//											}
//										})
//									}
//
//								}.padding(.top, 10)
//							}
//						}.padding([.leading, .trailing])
//							.padding(.bottom, 10)
					}
				}
				else {
					NoDataView(message: "There were no rankings found for this event.")
				}
				if self.fetchRankings.rankingList.result.count != 0 {
					HStack {
						Spacer()
						Text("W").frame(minWidth: 30)
						Text("L").frame(minWidth: 30)
						Text("T").frame(minWidth: 30)
					}.padding([.leading, .trailing])
				}
				ForEach(self.fetchRankings.rankingList.result, id: \.self) { ranking in
					
					VStack {
						
						if ranking.division == self.event.divisions[self.selectedDivision] {
							RankingView(ranking: ranking)
							Divider().padding(.leading)
						}
						
					}
				}
			}
			
			if pickerSelection == 2 {
				if fetchAwards.awardList.size != 0 {
				
					ForEach(self.fetchAwards.awardList.result, id: \.self) { award in
						VStack {
							AwardView(award: award).padding([.leading, .trailing])
							Divider().padding(.leading)
						}
					}
				}
				else {
					NoDataView(message: "There were no awards found for this event.")
				}
				
			}
			
			
			
		}.navigationBarTitle(Text(""), displayMode: .inline)
		
	}
	
	func modifiedDivisionList(divisions: [String]) -> [String] {
		let modDivisions = divisions.filter { $0 != "Finals" }
		print(modDivisions)
		return modDivisions
	}
	
}

struct ButtonView: View {
	@State var row: Int
	@State var div: Int
	@Binding var selectedDivision: Int
	@State var event: EventData
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 10)
				.foregroundColor(buttonColor(value: ((row * 3) + div), selected: selectedDivision))
				.frame(height: 50, alignment: .center)
			Text(self.event.divisions.chunked(by: 3)[row][div])
				.foregroundColor(.white)
				.font(Font.headline.weight(.semibold))
		}
	}
	func buttonColor(value: Int, selected: Int) -> Color {
		print(value, selected)
		if value == selected {
			return .orange
		}
		return Color(UIColor.quaternaryLabel)
	}
}


struct EventDetail_Previews: PreviewProvider {
	static var previews: some View {
		EventDetail(event: EventData(sku: "sku", key: "key", program: "program", name: "super long name that overflows", loc_venue: "loc_venue", loc_address1: "loc_address1", loc_address2: "loc_address2", loc_city: "loc_city", loc_region: "loc_region", loc_postcode: "loc_postcode", loc_country: "loc_country", season: "season", start: "start", end: "end", divisions: ["Division A", "Division B"]))
	}
}
