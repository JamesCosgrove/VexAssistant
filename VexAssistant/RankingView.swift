//
//  RankingView.swift
//  VexAssistant
//
//  Created by James Cosgrove on 25/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct RankingView: View {
	@State var ranking: RankingData
    var body: some View {
		HStack {
			Text("#\(ranking.rank)")
				.frame(minWidth: 50, alignment: .leading)
			Text(ranking.team)
				.foregroundColor(.orange)
			Spacer()
			Text("\(ranking.wins)")
				.frame(minWidth: 30)
			Text("\(ranking.losses)")
			.frame(minWidth: 30)
			Text("\(ranking.ties)")
			.frame(minWidth: 30)
			}.font(.system(size: 18, weight: .bold, design: .monospaced))
			.padding([.leading, .trailing])
    }
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
		RankingView(ranking: RankingData(sku: "", division: "High School", rank: 15, team: "3116B", wins: 7, losses: 3, ties: 1, wp: 14, ap: 12, sp: 50, trsp: 6, max_score: 99, opr: 31.5, dpr: 18.6, ccwm: 14.2))
    }
}
