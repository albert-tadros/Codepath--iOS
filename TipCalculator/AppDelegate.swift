//
//  AppDelegate.swift
//  TipCalculator
//
//  Created by ALBERT TADROS on 1/20/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


    private func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController

    self.window?.rootViewController = configureNavigationController(rootViewController: mainViewController)
    window?.makeKeyAndVisible()
    return true
  }
  
    func configureNavigationController(rootViewController: UIViewController) -> UINavigationController {
    let navigationController = UINavigationController(rootViewController: rootViewController)
    
    navigationController.navigationBar.barTintColor = UIColor(
      red: CGFloat(254/255.0), green: CGFloat(129/255.0), blue: CGFloat(67/255.0), alpha: CGFloat(1.0))
      navigationController.navigationBar.tintColor = UIColor.white
      navigationController.navigationBar.isTranslucent = false
        navigationController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: UIBarButtonItem.Style.plain, target: rootViewController, action: nil)
    return navigationController
  }

    func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

    internal func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

    internal func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

    func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

    func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}


