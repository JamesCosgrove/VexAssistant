//
//  EventCell.swift
//  VexAssistant
//
//  Created by James Cosgrove on 23/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import SwiftUI

struct EventCell: View {
	
	@State var name: String
	@State var location: String
	@State var date: String
	
    var body: some View {
		HStack {
			
			VStack(alignment: .leading) {
				Text(name)
					.font(.headline)
				Text(location)
					.font(Font.headline.weight(.regular))
					.foregroundColor(Color(UIColor.secondaryLabel))
				Text(dateFormatter(date: date))
				.font(Font.caption.weight(.semibold))
					.foregroundColor(.orange)
			}
		}
    }
	
	func dateFormatter(date: String) -> String {
		let dateFormatterGet = DateFormatter()
		dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
		
		if let newDate = dateFormatterGet.date(from: date) {
			let dateFormatterPrint = DateFormatter()
			dateFormatterPrint.dateFormat = "dd/MM/YY"
			return dateFormatterPrint.string(from: newDate)
		}
		return ""
	}
}

struct EventCell_Previews: PreviewProvider {
    static var previews: some View {
		EventCell(name: "Event Name", location: "Event Location", date: "")
    }
}
