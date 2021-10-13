//
//  DashboardViewController.swift
//  CampusWalk
//
//  Created by Terence Williams on 10/13/21.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!

    var sections: [DashboardSections] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
    func setupData() {
        sections = [.poster, .dining, .events, .news, .banner, .sports]
        
        table.register(UINib(nibName: "StandardTableViewCell", bundle: nil),
                       forCellReuseIdentifier: "StandardTableViewCell")
        table.register(UINib(nibName: "BannerTableViewCell", bundle: nil),
                       forCellReuseIdentifier: "BannerTableViewCell")
        table.register(UINib(nibName: "PosterTableViewCell", bundle: nil),
                       forCellReuseIdentifier: "PosterTableViewCell")
    }
    
    //MARK: - Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dashboardSection = sections[indexPath.row]
        switch dashboardSection {
        case .dining, .events, .news, .sports:
            return 230
        case .poster:
            return 330
        case .banner:
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dashboardSection = sections[indexPath.row]
        
        switch dashboardSection {
        case .dining:
            let dashboardCard = tableView.dequeueReusableCell(withIdentifier: "StandardTableViewCell",
                                                              for: indexPath) as? StandardTableViewCell
            dashboardCard?.titleLabel.text = "View Dining Options"
            dashboardCard?.subtitleLabel.text = "See what's for lunch"
            dashboardCard?.cardImageView.image = UIImage(named: "")
            dashboardCard?.setTheme(theme: .light)
            return dashboardCard!
            
        case .events:
            let dashboardCard = tableView.dequeueReusableCell(withIdentifier: "StandardTableViewCell",
                                                              for: indexPath) as? StandardTableViewCell
            dashboardCard?.titleLabel.text = "See Events & Calendars"
            dashboardCard?.subtitleLabel.text = "View upcoming events and academic dates"
            dashboardCard?.cardImageView.image = UIImage(named: "")
            return dashboardCard!
            
        case .news:
            let dashboardCard = tableView.dequeueReusableCell(withIdentifier: "StandardTableViewCell",
                                                              for: indexPath) as? StandardTableViewCell
            dashboardCard?.titleLabel.text = "Newsroom"
            dashboardCard?.subtitleLabel.text = "Stay up to date with headlines and announcements"
            dashboardCard?.cardImageView.image = UIImage(named: "")
            dashboardCard?.setTheme(theme: .light)
            return dashboardCard!
            
        case .sports:
            let dashboardCard = tableView.dequeueReusableCell(withIdentifier: "StandardTableViewCell",
                                                              for: indexPath) as? StandardTableViewCell
            dashboardCard?.titleLabel.text = "Check in With The Team"
            dashboardCard?.subtitleLabel.text = "Visit .com"
            dashboardCard?.cardImageView.image = UIImage(named: "")
            return dashboardCard!
            
        case .poster:
            let dashboardCard = tableView.dequeueReusableCell(withIdentifier: "PosterTableViewCell",
                                                              for: indexPath) as? PosterTableViewCell
            dashboardCard?.titleLabel.text = "Headlining Poster"
            dashboardCard?.subtitleLabel.text = "Tap for event details"
            dashboardCard?.cardImageView.image = UIImage(named: "")
            return dashboardCard!
            
        case .banner:
            let dashboardCard = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell",
                                                              for: indexPath) as? BannerTableViewCell
            dashboardCard?.titleLabel.text = "Organization Events"
            dashboardCard?.subtitleLabel.text = "Get out & get involved"
            dashboardCard?.cardImageView.image = UIImage(named: "")
            return dashboardCard!
            
        default:
            let dashboardCard = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell",
                                                              for: indexPath) as? BannerTableViewCell
            return dashboardCard!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dashboardSection = sections[indexPath.row]

        switch dashboardSection {
        case .dining:
            break
        default:
            break
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}

enum DashboardSections {
    case dining
    case events
    case news
    case sports
    case poster
    case banner
}

enum CardTheme {
    case light
    case dark
}
