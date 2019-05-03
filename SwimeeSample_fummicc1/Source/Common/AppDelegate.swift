import UIKit
//import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //MARK: - migrationのコード
//        let config = Realm.Configuration(schemaVersion: 0, migrationBlock: { (migration, version) in
//            if version < 0 {
//            }
//        })
//
//        Realm.Configuration.defaultConfiguration = config
        //MARK:-
        return true
    }
}

