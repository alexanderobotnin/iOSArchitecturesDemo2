//
//  SearchPresenter.swift
//  iOSArchitecturesDemo

//  Created by Alexander Obotnin on 03.01.2023.
//  Copyright © 2023 Alexander Obotnin. All rights reserved.
//

import UIKit

protocol SearchViewInput: class {
    
    var searchAppResults: [ITunesApp] { get set }
    
    var searchSongResults: [ITunesSong] { get set }
    
    func showError(error: Error)
    
    func showNoResults()
    
    func hideNoResults()
    
    func throbber(show: Bool)
}

protocol SearchViewOutput: class {
    
    func viewDidSearchApp(with query: String)
    
    func viewDidSearchSong(with query: String)
    
    func viewDidSelectApp(_ app: ITunesApp)
    
    func viewDidSelectSong(_ song: ITunesSong)
}

class SearchPresenter {
    
    weak var viewInput: (UIViewController & SearchViewInput)?
    let interactor: SearchInteractorInput
    let router: SearchRouterInput
    
    init(interactor: SearchInteractorInput, router: SearchRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    private func requestApps(with query: String) {
        self.interactor.requestApps(with: query) { [weak self]  results in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            results
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchAppResults = apps
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
    
    private func requestSongs(with query: String) {
        self.interactor.requestSongs(with: query) { [weak self]  results in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            results
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    print("SearchPresenter: requestSongs result: \(songs.count)")
                    self.viewInput?.searchSongResults = songs
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
}

extension SearchPresenter: SearchViewOutput {
    func viewDidSearchApp(with query: String) {
        self.requestApps(with: query)
    }
    
    func viewDidSearchSong(with query: String) {
        self.requestSongs(with: query)
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        self.router.openAppDetails(with: app)
    }
    
    func viewDidSelectSong(_ song: ITunesSong) {
        self.router.openSongDetails(with: song)
    }
}
