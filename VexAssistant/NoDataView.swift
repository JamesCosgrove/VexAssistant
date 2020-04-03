//
//  NoDataView.swift
//  VexAssistant
//
//  Created by James Cosgrove on 28/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct NoDataView: View {
	@State var message: String
    var body: some View {
        VStack {
			Spacer()
			Text("Oh No!")
				.font(Font.title.weight(.bold))
				.foregroundColor(Color(UIColor.label))
			Text(message)
				.font(Font.body.weight(.regular))
				.foregroundColor(Color(UIColor.secondaryLabel))
			Spacer()
		}.multilineTextAlignment(.center).padding()
    }
}

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView(message: "On no this is a really long error message that goes on for too long")
    }
}
