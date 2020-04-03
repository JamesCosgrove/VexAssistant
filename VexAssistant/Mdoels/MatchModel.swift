//
//  MatchModel.swift
//  VexAssistant
//
//  Created by James Cosgrove on 24/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

struct Match: Codable {
	
	
	public var status: Int
	public var size: Int
	public var result: [MatchData]
	
	

}

struct MatchData: Codable, Hashable {
	

	public var sku: String
	public var division: String
	public var round: Int
	public var instance: Int
	public var matchnum: Int
	public var field: String
	public var red1: String
	public var red2: String
	public var red3: String
	public var redsit: String
	public var blue1: String
	public var blue2: String
	public var blue3: String
	public var bluesit: String
	public var redscore: Int
	public var bluescore: Int
	public var scored: Int
	public var scheduled: String
	
}
