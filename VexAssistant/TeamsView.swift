//
//  TeamsView.swift
//  VexAssistant
//
//  Created by James Cosgrove on 24/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct TeamsView: View {
	
	@State var searchTerm = ""
	
	@ObservedObject var teamData = FetchTeams()
	@State var showDelete = false
	
    var body: some View {
		
		NavigationView {
			Form {
				
				Section(footer: Text(teamData.teamData.size == 0 ? "Search for a team to see information about them." : ""), content: {
					HStack {
						Image(systemName: "magnifyingglass").imageScale(.large)
							.font(Font.headline.weight(.semibold))
						TextField("Team number", text: $searchTerm, onEditingChanged: {_ in
							self.showDelete.toggle()
						}, onCommit: {
							self.teamData.fetchTeams(team: self.searchTerm)
							self.searchTerm = ""
						})
//							.onTapGesture {
//								self.teamData.teamData.result = []
//						}
						if showDelete && searchTerm != "" {
							Button(action: {
								self.searchTerm = ""
							}, label: {
								Image(systemName: "x.circle").imageScale(.large)
								.font(Font.headline.weight(.semibold))
							})
						}
					}.padding()
				})
				if teamData.teamData.result != [] {
					Section(header: Text("TEAM INFORMATION"), content: {
						HStack {
							Text(self.teamData.teamData.result[0].team_name)
							Spacer()
							Text(self.teamData.teamData.result[0].number)
								.foregroundColor(.orange)
						}
						HStack {
							Text("Program")
							Spacer()
							Text(self.teamData.teamData.result[0].program)
								.foregroundColor(.orange)
						}
						HStack {
							Text("Robot Name")
							Spacer()
							Text(self.teamData.teamData.result[0].robot_name)
								.foregroundColor(.orange)
						}
						HStack {
							Text("Organisation")
							Spacer()
							Text(self.teamData.teamData.result[0].organisation)
								.foregroundColor(.orange)
						}
						HStack {
							Text("Location")
							Spacer()
							VStack(alignment: .trailing) {
								Text(self.teamData.teamData.result[0].city)
								Text(self.teamData.teamData.result[0].region)
								Text(self.teamData.teamData.result[0].country)
							}.foregroundColor(.orange)
						}
					})
					Section(header: Text("COMPETITION INFORMATION"), content: {
						NavigationLink(destination: TeamEvents(teamNumber: teamData.teamData.result[0].number), label: {
							Text("Recent Events")
						})
						NavigationLink(destination: TeamAwards(teamNumber: teamData.teamData.result[0].number, isLoading: false), label: {
							Text("Recent Awards")
						})
					})
				}
				}
			.navigationBarTitle("Teams")
		}
	}
}
		
		
//		NavigationView {
//			VStack {
//				HStack {
//					Image(systemName: "magnifyingglass").imageScale(.large)
//						.font(Font.headline.weight(.semibold))
//					TextField("Team number", text: $searchTerm, onEditingChanged: {_ in
//						self.showDelete.toggle()
//					}, onCommit: {
//						self.teamData.fetchTeams(team: self.searchTerm)
//						self.searchTerm = ""
//					})
//					if showDelete && searchTerm != "" {
//						Button(action: {
//							self.searchTerm = ""
//						}, label: {
//							Image(systemName: "x.circle").imageScale(.large)
//							.font(Font.headline.weight(.semibold))
//						})
//					}
//
//
//					}.padding()
//					.overlay(RoundedRectangle(cornerRadius: 30).stroke(Color(UIColor.label), lineWidth: 3))
//				if teamData.teamData.result != [] {
//
////					VStack(alignment: .leading) {
////
////
////
////					}
////						.font(Font.headline.weight(.semibold))
//
//					List {
//						VStack {
//							HStack {
//								Text(self.teamData.teamData.result[0].team_name)
//								Spacer()
//								Text(self.teamData.teamData.result[0].number)
//									.foregroundColor(.orange)
//							}
//							Divider()
//							HStack {
//								Text("Program")
//								Spacer()
//								Text(self.teamData.teamData.result[0].program).foregroundColor(.orange)
//							}
//							Divider()
//
//							HStack {
//								Text("Robot Name")
//								Spacer()
//								Text(self.teamData.teamData.result[0].robot_name).foregroundColor(.orange)
//							}
//							Divider()
//
//							HStack {
//								Text("Organisation")
//								Spacer()
//								Text(self.teamData.teamData.result[0].organisation).foregroundColor(.orange)
//							}
//							Divider()
//
//							HStack(alignment: .top) {
//								Text("Location")
//								Spacer()
//								VStack(alignment: .trailing) {
//									Text(self.teamData.teamData.result[0].city)
//									Text(self.teamData.teamData.result[0].region)
//									Text(self.teamData.teamData.result[0].country)
//								}.foregroundColor(.orange)
//							}
//						}
//						Group {
//							NavigationLink(destination: TeamEvents(), label: {
//								Text("Recent Events")
//							})
//							NavigationLink(destination: TeamAwards(), label: {
//								Text("Recent Awards")
//							})
//						}
//
//					}
//
//				}
//				Spacer()
//			}.padding(.horizontal)
//			.navigationBarTitle("Search Teams", displayMode: .automatic)
//		}
//    }
	


//	}



struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
