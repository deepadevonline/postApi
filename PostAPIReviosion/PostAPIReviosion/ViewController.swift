//
//  ViewController.swift
//  PostAPIReviosion
//
//  Created by Deepa Kumari on 13/06/22.
//

import UIKit
struct UserModel:Encodable {
  
    var email: String
    var password: String
}
struct NUserModel:Encodable {
    var name: String
    var job: String
    
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        PostAPI()
        PostAPISecond()
        thirdAPIusers()
    }
 

    func PostAPI(){
        let user = UserModel(email: "eve.holt@reqres.in", password: "cityslicka")
        let urlString = "https://reqres.in/api/login"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(user)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request){data,response,error in
            guard let data = data else { return }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data)
                print(jsonResponse)
            }catch{
                   print(error)
                }
        }.resume()
            
            
            
            
        
    }
    
    
    ///2nd Register API
    func PostAPISecond(){
        let user = UserModel(email: "eve.holt@reqres.in", password: "pistol")
        let urlString = "https://reqres.in/api/register"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(user)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request){data,response,error in
            guard let data = data else { return }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data)
                print(jsonResponse)
            }catch{
                   print(error)
                }
        }.resume()
            
            
            
            
        
    }
    
    func thirdAPIusers(){
        let users = NUserModel(name: "morpheus", job: "leader")
        let urlString = "https://reqres.in/api/users"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(users)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request){data,response,error in
            guard let data = data else { return }
            do{
                let jsonResponse =  try JSONSerialization.jsonObject(with: data)
                print(jsonResponse)
            }catch{print(error)
            }
        }.resume()
    }
}

