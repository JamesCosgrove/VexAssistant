//
//  FetchEvents.swift
//  VexAssistant
//
//  Created by James Cosgrove on 24/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import Foundation

class FetchMatches: ObservableObject {
	
//	var willChange = PassthroughSubject<FetchEvents, Never>()
//
//	var eventList = Event(status: 0, size: 0, result: []) {
//		didSet {
//			willChange.send(self)
//		}
//	}
	@Published var matchList = Match(status: 0, size: 0, result: [])
	@Published var isLoading = false
	
	
	func fetchMatches(sku: String) {
		isLoading = true
		var url = URLComponents(string: "https://api.vexdb.io/v1/get_matches")!

		url.queryItems = [URLQueryItem(name: "sku", value: sku)]
		
		let request = URLRequest(url: url.url!)
		
		URLSession.shared.dataTask(with: request) {(data, response, error) in
			guard let data = data else { return }
			
			let matchList = try! JSONDecoder().decode(Match.self, from: data)
			
			DispatchQueue.main.async {
				self.matchList = matchList
				self.isLoading = false
			}
		}.resume()
	}
	
	
}
