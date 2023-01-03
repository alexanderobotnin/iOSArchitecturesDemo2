//
//  SearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Obotnin on 03.01.2023.
//  Copyright © 2023 Alexander Obotnin. All rights reserved.
//

import UIKit

protocol SearchRouterInput {
    
    func openAppDetails(with app: ITunesApp)
    
    func openAppInITunes(_ app: ITunesApp)
    
    func openSongDetails(with song: ITunesSong)
}

final class SearchRouter: SearchRouterInput {
    
    weak var viewController: UIViewController?
    
    func openAppDetails(with app: ITunesApp) {
        let appDetaillViewController = AppDetailViewController(app: app)
        self.viewController?.navigationController?
            .pushViewController(appDetaillViewController, animated: true)
    }
    
    func openAppInITunes(_ app: ITunesApp) {
        guard let urlString = app.appUrl, let url = URL(string: urlString) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func openSongDetails(with song: ITunesSong) {
        let songDetaillViewController = SongDetailViewController(song: song)
        self.viewController?.navigationController?
            .pushViewController(songDetaillViewController, animated: true)
    }
}
