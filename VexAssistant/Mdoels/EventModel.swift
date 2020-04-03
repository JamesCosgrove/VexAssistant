//
//  EventModel.swift
//  VexAssistant
//
//  Created by James Cosgrove on 22/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

struct Event: Codable {
	
	
	public var status: Int
	public var size: Int
	public var result: [EventData]
	
	

}

struct EventData: Codable {
	

	public var sku: String
	public var key: String
	public var program: String
	public var name: String
	public var loc_venue: String
	public var loc_address1: String
	public var loc_address2: String
	public var loc_city: String
	public var loc_region: String
	public var loc_postcode: String
	public var loc_country: String
	public var season: String
	public var start: String
	public var end: String
	public var divisions: [String]
	

	
	

}



	
//	enum CodingKeys: String, CodingKey {
//
//		case id = "id"
//
//		case sku = "sku"
//		case program = "program"
//		case name = "name"
//		case loc_venue = "venue"
//		case loc_address1 = "address1"
//		case loc_address2 = "address2"
//		case loc_city = "city"
//		case loc_region = "region"
//		case loc_postcode = "postcode"
//		case loc_country = "country"
//		case season = "season"
//		case start = "start"
//		case end = "end"
//		case divisions = ["Division 1"]
//	}
	
