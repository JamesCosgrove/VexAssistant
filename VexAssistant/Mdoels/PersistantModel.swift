//
//  PersistantModel.swift
//  VexAssistant
//
//  Created by James Cosgrove on 25/03/2020.
//  Copyright © 2020 James Cosgrove. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

struct PersistantData: Codable {
	public var sortBy: String
	public var country: String
	public var season: String
}
