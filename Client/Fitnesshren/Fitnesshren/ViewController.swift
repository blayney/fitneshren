import UIKit
import SocketIO
import FeathersSwiftSocketIO
import Feathers

class ViewController: UIViewController {
    
    let manager = SocketManager(socketURL: URL(string: "https://ilich.ml")!, config: [.log(false), .compress])
    var feathers: Feathers!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIFont.fontNames(forFamilyName: "SF Pro Display"))
        // causes cast value error on UILabel on local run - initially commented to check Firebase Auth
        print((view.subviews.first! as! UILabel).font!.fontName)
        
        let provider = SocketProvider(manager: manager)
        feathers = Feathers(provider: provider)
        feathers.authenticate([
            "strategy":"local","email": "admin", "password": "admin"
            ]).on(starting: {print("started")},
                  started: {print("starting")},
                  event: { (event) in print("event: \(event)")},
                  failed: {print($0.localizedDescription)},
                  completed: {print("completed")},
                  interrupted: {print("interrupted")},
                  terminated: {print("terminated")},
                  disposed: {print("disposed")},
                  value: { [weak self] accessToken in
                    print("value: \(accessToken)")
                    self?.getStuff()
            }).start()

    }


    func getStuff() {
        let history = feathers.service(path: "history")
        history.request(.find(query: Query().eq(property: "user", value: "admin")))
            .on(starting: {print("h started")},
                started: {print("h starting")},
                event: { (event) in print("h event: \(event)")},
                failed: {print($0.localizedDescription)},
                completed: {print("h completed")},
                interrupted: {print("h interrupted")},
                terminated: {print("h terminated")},
                disposed: {print("h disposed")},
                value: {print("h value: \($0)")}).start()
    }
}

