//
//  FetchAwards.swift
//  VexAssistant
//
//  Created by James Cosgrove on 25/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import Foundation

class FetchAwards: ObservableObject {
	
//	var willChange = PassthroughSubject<FetchEvents, Never>()
//
//	var eventList = Event(status: 0, size: 0, result: []) {
//		didSet {
//			willChange.send(self)
//		}
//	}
	@Published var awardList = Award(status: 0, size: 0, result: [])
	@Published var isLoading = false
	
	
	func fetchAwards(sku: String? = nil, team: String? = nil) {
		isLoading = true
		var url = URLComponents(string: "https://api.vexdb.io/v1/get_awards")!

		url.queryItems = [
			URLQueryItem(name: "sku", value: sku),
			URLQueryItem(name: "team", value: team)
		]
		
		let request = URLRequest(url: url.url!)
		
		URLSession.shared.dataTask(with: request) {(data, response, error) in
			guard let data = data else { return }
			
			let awardList = try! JSONDecoder().decode(Award.self, from: data)
			
			DispatchQueue.main.async {
				self.awardList = awardList
			}
		}.resume()
	}
	
	
}
