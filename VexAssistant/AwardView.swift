//
//  AwardView.swift
//  VexAssistant
//
//  Created by James Cosgrove on 25/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct AwardView: View {
	@State var award: AwardData
    var body: some View {
		VStack {
			HStack {
				Text(award.name)
					.font(Font.headline.weight(.semibold))
				Spacer()
				Text("\(award.team)")
					.font(Font.headline.weight(.semibold))
					.foregroundColor(.orange)
				
			}
			
		}
//		VStack {
//			HStack {
//				Text(award.name)
//					.font(Font.headline.weight(.semibold))
//				Spacer(minLength: 0)
//				Text("\(award.team)")
//					.font(Font.headline.weight(.semibold))
//					.foregroundColor(.orange)
//			}
//
//		}
    }
}

struct AwardView_Previews: PreviewProvider {
    static var previews: some View {
        AwardView(award: AwardData(sku: "", name: "Excellence Award", team: "3116B", qualifies: ["VEX World Championships"], order: 0))
    }
}
