//
//  SearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Obotnin on 03.01.2023.
//  Copyright © 2023 Alexander Obotnin. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchInteractorInput {
    
    func requestApps(with query: String,
                     completion: @escaping (Result<[ITunesApp]>) -> Void)
    func requestSongs(with query: String,
                      completion: @escaping (Result<[ITunesSong]>) -> Void)
}

final class SearchInteractor: SearchInteractorInput {
    
    private let searchService = ITunesSearchService()
    
    func requestApps(with query: String,
                     completion: @escaping (Result<[ITunesApp]>) -> Void) {
        self.searchService.getApps(forQuery: query, then: completion)
    }
    
    func requestSongs(with query: String,
                      completion: @escaping (Result<[ITunesSong]>) -> Void) {
        self.searchService.getSongs(forQuery: query, completion: completion)
    }
}
