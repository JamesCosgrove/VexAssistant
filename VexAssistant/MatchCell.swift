//
//  MatchCell.swift
//  VexAssistant
//
//  Created by James Cosgrove on 25/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct MatchCell: View {
	
	@State var matchData: MatchData
	
    var body: some View {
		VStack {
			HStack {

				if matchData.round == 1 {
					Text("Practice #\(matchData.matchnum)")
				}
				else if matchData.round == 2 {
					Text("Qualification #\(matchData.matchnum)")
				}
				else if matchData.round == 6 {
					Text("Round of 16 #\(matchData.instance)-\(matchData.matchnum)")
				}
				else if matchData.round == 3 {
					Text("Quater Final #\(matchData.instance)-\(matchData.matchnum)")
				}
				else if matchData.round == 4 {
					Text("Semi Final #\(matchData.instance)-\(matchData.matchnum)")
				}
				else if matchData.round == 5 {
					Text("Final #\(matchData.instance)-\(matchData.matchnum)")
				}
				Spacer()
				Text(matchData.field != "" ? (matchData.field.lowercased().contains("field") ? "\(matchData.field)" : "\(matchData.field) Field") : "")
			}.font(Font.caption.weight(.semibold))
			HStack {
				VStack(alignment: .leading) {
					Text(matchData.red1)
						.foregroundColor(.red)
						.opacity(matchData.red1 == matchData.redsit ? 0.5 : 1.0)
					Text(matchData.blue1)
						.foregroundColor(.blue)
						.opacity(matchData.blue1 == matchData.bluesit ? 0.5 : 1.0)
				}
				VStack(alignment: .leading) {
					Text(matchData.red2)
						.foregroundColor(.red)
						.opacity(matchData.red2 == matchData.redsit ? 0.5 : 1.0)
					Text(matchData.blue2)
						.foregroundColor(.blue)
						.opacity(matchData.blue2 == matchData.bluesit ? 0.5 : 1.0)
				}
				VStack(alignment: .leading) {
					Text(matchData.red3)
						.foregroundColor(.red)
						.opacity(matchData.red3 == matchData.redsit ? 0.5 : 1.0)
					Text(matchData.blue3)
						.foregroundColor(.blue)
						.opacity(matchData.blue3 == matchData.bluesit ? 0.5 : 1.0)
				}
				Spacer()
				
				VStack(alignment: .trailing) {
					if matchData.scored == 1 {
						Text("\(matchData.redscore)")
							.foregroundColor(.red)
						Text("\(matchData.bluescore)")
							.foregroundColor(.blue)
					}
					else {
						Text("Unscored")
					}
				}
			}.font(.system(size: 18, weight: .bold, design: .monospaced))
			
			
		}.padding([.leading, .trailing])
    }
}

struct MatchCell_Previews: PreviewProvider {
    static var previews: some View {
        MatchCell(matchData: MatchData(sku: "", division: "", round: 3, instance: 1, matchnum: 4, field: "Lovelace", red1: "3116B", red2: "3116C", red3: "3116A", redsit: "3116A", blue1: "4915A", blue2: "60153B", blue3: "99819A", bluesit: "4915A", redscore: 999, bluescore: 999, scored: 1, scheduled: ""))
    }
}
