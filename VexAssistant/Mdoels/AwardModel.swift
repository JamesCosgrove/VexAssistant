//
//  AwardModel.swift
//  VexAssistant
//
//  Created by James Cosgrove on 25/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

struct Award: Codable {
	
	
	public var status: Int
	public var size: Int
	public var result: [AwardData]
	
	

}

struct AwardData: Codable, Hashable {
	

	public var sku: String
	public var name: String
	public var team: String
	public var qualifies: [String]
	public var order: Int


	
	

}
