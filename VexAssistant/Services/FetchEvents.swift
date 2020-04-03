//
//  FetchEvents.swift
//  VexAssistant
//
//  Created by James Cosgrove on 24/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import Foundation

class FetchEvents: ObservableObject {
	
//	var willChange = PassthroughSubject<FetchEvents, Never>()
//
//	var eventList = Event(status: 0, size: 0, result: []) {
//		didSet {
//			willChange.send(self)
//		}
//	}
	@Published var eventList = Event(status: 0, size: 0, result: [])
	
	@Published var dataLoading = false
	
	
	func fetchEvents(status: String? = nil, country: String? = nil, season: String? = nil, team: String? = nil, program: String?) {
		dataLoading = true
		var url = URLComponents(string: "https://api.vexdb.io/v1/get_events")!

		url.queryItems = [
			URLQueryItem(name: "status", value: status),
			URLQueryItem(name: "country", value: country),
			URLQueryItem(name: "season", value: season),
			URLQueryItem(name: "team", value: team),
			URLQueryItem(name: "program", value: program)
		]
		
		let request = URLRequest(url: url.url!)
		
		print(request)
		URLSession.shared.dataTask(with: request) {(data, response, error) in
			guard let data = data else { return }
			
			let eventList = try! JSONDecoder().decode(Event.self, from: data)
			
			
			DispatchQueue.main.async {
				self.eventList = eventList
				self.dataLoading = false
			}

		}.resume()
		
	}
	
	
}
