//
//  TabBarView.swift
//  VexAssistant
//
//  Created by James Cosgrove on 24/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
		TabView {
			EventsView()
			.tag(0)
			.tabItem {
				VStack {
					Image(systemName: "rosette")
						.imageScale(.large)
					Text("Events")
				}.font(Font.headline.weight(.bold))
			}
			TeamsView()
			.tag(1)
			.tabItem {
				VStack {
					Image(systemName: "person.3.fill")
						.imageScale(.large)
					Text("Teams")
				}.font(Font.headline.weight(.bold))
			}
			}
		.accentColor(.orange)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
