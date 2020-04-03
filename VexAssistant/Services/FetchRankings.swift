//
//  FetchRankings.swift
//  VexAssistant
//
//  Created by James Cosgrove on 25/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import Foundation

class FetchRankings: ObservableObject {
	
//	var willChange = PassthroughSubject<FetchEvents, Never>()
//
//	var eventList = Event(status: 0, size: 0, result: []) {
//		didSet {
//			willChange.send(self)
//		}
//	}
	@Published var rankingList = Ranking(status: 0, size: 0, result: [])
	
	
	func fetchRangings(sku: String) {
		var url = URLComponents(string: "https://api.vexdb.io/v1/get_rankings")!

		url.queryItems = [URLQueryItem(name: "sku", value: sku)]
		
		let request = URLRequest(url: url.url!)
		
		URLSession.shared.dataTask(with: request) {(data, response, error) in
			guard let data = data else { return }
			
			let rankingList = try! JSONDecoder().decode(Ranking.self, from: data)
			
			DispatchQueue.main.async {
				self.rankingList = rankingList
			}
		}.resume()
	}
	
	
}
