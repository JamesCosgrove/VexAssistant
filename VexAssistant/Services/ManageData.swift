//
//  ManageData.swift
//  VexAssistant
//
//  Created by James Cosgrove on 25/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import Foundation
import Combine

class ManageData: ObservableObject {

	@Published var persistentData = PersistantData(sortBy: "Past", country: "United Kingdom", season: "Tower Takeover")
	
	
	func modifySortOrder(order: String) {
		persistentData.sortBy = order
	}
	
	func modifyCountry(country: String) {
		persistentData.country = country
	}
	
	func modifySeason(season: String) {
		persistentData.season = season
	}
	
	
}
