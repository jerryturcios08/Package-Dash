//
//  ViewController.swift
//  Package Dash
//
//  Created by Jerry Turcios on 2/8/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {
    @IBOutlet var tableView: UITableView!

    var tasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        #if DEBUG
        // Add dummy data for tasks
        tasks.append(Task(image: UIImage(named: "Package Collector Icon")!, category: .packageCollector, summary: "A supply package was found a few miles from home base. Retrieve it in order to obtain supplies for the next week", status: .ready))
        tasks.append(Task(image: UIImage(named: "Relocation Icon")!, category: .packageCollector, summary: "A group of bandits have rallied up an are approaching home base. We need to relocate to a safehouse 5 miles away", status: .inProgress))
        #endif
    }
}

extension HomeScreen: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Task", for: indexPath) as? TaskCell else {
            fatalError("Error: Unable to dequeue table view cell for tasks")
        }

        let task = tasks[indexPath.row]
        cell.setupCell(task: task)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
