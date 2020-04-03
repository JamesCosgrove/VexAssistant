//
//  FetchOneEvent.swift
//  VexAssistant
//
//  Created by James Cosgrove on 27/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import Foundation

class FetchOneEvent: ObservableObject {

//	var willChange = PassthroughSubject<FetchEvents, Never>()
//
//	var eventList = Event(status: 0, size: 0, result: []) {
//		didSet {
//			willChange.send(self)
//		}
//	}
	@Published var eventName = [String]()
	@Published var eventDate = [String]()

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


	func fetchEvent(sku: String) {
		var url = URLComponents(string: "https://api.vexdb.io/v1/get_events")!

		url.queryItems = [
			URLQueryItem(name: "sku", value: sku)
		]

		let request = URLRequest(url: url.url!)

		print(request)
		URLSession.shared.dataTask(with: request) {(data, response, error) in
			guard let data = data else { return }

			let eventList = try! JSONDecoder().decode(Event.self, from: data)


			DispatchQueue.main.async {
				self.eventName.append(eventList.result[0].name)
				
				self.eventDate.append(self.dateFormatter(date: eventList.result[0].start))

			}

		}.resume()

	}



}
