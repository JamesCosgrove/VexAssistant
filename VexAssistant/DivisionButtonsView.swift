////
////  DivisionButtonsView.swift
////  VexAssistant
////
////  Created by James Cosgrove on 28/03/2020.
////  Copyright © 2020 James Cosgrove. All rights reserved.
////
//
//import SwiftUI
//
//struct ButtonView: View {
//	@Binding var selectedDiv: Int
//	@State var event: EventData
//	@State var row: Int
//	@State var div: Int
//	var body: some View {
//		Button(action: {
//			self._selectedDiv = ((row * 3) + div)
//		}, label: {
//			ZStack {
//				RoundedRectangle(cornerRadius: 10)
//					.foregroundColor(buttonColor(value: ((row * 3) + div), selected: selectedDiv))
//					.frame(height: 50, alignment: .center)
//				Text(self.event.divisions.chunked(by: 3)[row][div])
//					.foregroundColor(.white)
//					.font(Font.headline.weight(.semibold))
//			}
//		})
//	}
//	func buttonColor(value: Int, selected: Int) -> Color {
//		if value == selected {
//			return .orange
//		}
//		return Color(UIColor.quaternaryLabel)
//	}
//}
//
//struct DivisionButtonsView: View {
//	@State var event: EventData
//	@Binding var selectedDivision: Int
//    var body: some View {
//		VStack {
//			ForEach(0..<event.divisions.chunked(by: 3).count, id: \.self) { row in
//				HStack {
//					ForEach(0..<self.event.divisions.chunked(by: 3)[row].count, id: \.self) {div in
//						//Text(self.event.divisions.chunked(by: 3)[row][div])
//						ButtonView(selectedDiv: self.$selectedDivision, event: self.event, row: row, div: div)
//					}
//				}
//			}
//		}
//    }
//}
//
//extension Array {
//    func chunked(by chunkSize: Int) -> [[Element]] {
//        return stride(from: 0, to: self.count, by: chunkSize).map {
//            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
//        }
//    }
//}
//
//
//struct DivisionButtonsView_Previews: PreviewProvider {
//    static var previews: some View {
//		DivisionButtonsView(event: EventData(sku: "", key: "", program: "", name: "", loc_venue: "", loc_address1: "", loc_address2: "", loc_city: "", loc_region: "", loc_postcode: "", loc_country: "", season: "", start: "", end: "", divisions: ["Division 1", "Divisions 2", "Division 3", "Division 4", "Division 5", "Division 6", "Division 7", "Division 8", "Division 9", "Division 10", "Division 11"]), selectedDivision: .constant(0))
//    }
//}
