//
//  ErrandsTableViewController.swift
//  Errands
//
//  Created by Alice Easter on 3/30/17.
//  Copyright © 2017 Alice Easter. All rights reserved.
//

import UIKit

class ErrandsTableViewController: UITableViewController {

    //array to hold errands objects, defined by the Message() struct at the bottom of this file
    var errands = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateTasks()
    }
    
    // MARK: - Table view data source
    
    /*
     * Pre: there must be a running server at codewonderland.me:6789,
     *      and there should be data there. There also needs to be a Message class and / or struct
     * Post: populates the errands array with messages from the server
     * Purpose: This method will clear the errands array and refill it with message items that 
     *      have been collected from a series of json objects hosted on the errands server
     */
    func populateTasks() {
        //defining where data is coming from
        let myUrl = NSURL(string: "codewonderland.me:6789/api/tasks")
        let request = NSMutableURLRequest(url:myUrl! as URL)
        request.httpMethod = "GET"
        
        // Excute HTTP Request
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            // Check for error
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
            
            // Print out response string
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(String(describing: responseString))")
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

struct Message {
    var mMessage: String
    var mName: String
    var mTime: String
    var mUID: String
    
    init(message: String, time: String, name: String, uid: String) {
        mMessage = message
        mName = name
        mTime = time
        mUID = uid
    }
}
