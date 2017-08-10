//
//  AppDelegate.swift
//  Westeros
//
//  Created by Carlos Ledesma on 5/7/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        //1º Creamos el encargado de responder a las preguntas de la TableView
        let housesDataSource = DataSources.houseDataSource(model: houses)
        let seasonsDataSource = DataSources.seasonsDataSource(model: seasons)
        
        //2º Creamos un combinador usando nuestra clase personalizada, recibe el datasource previo y un delegado personalizado como agurmentos y empaquetamos con wrappedInNavigation
        let housesTableVC = ArrayTableViewController(dataSource: housesDataSource,
                                               style: .plain, title: "Houses",
                                               delegate: GreatHousesDelegate()).wrappedInNavigation()
        
        let seasonsTableVC = ArrayTableViewController(dataSource: seasonsDataSource, style: .plain, title: "Seasons", delegate: SeasonsDelegate()).wrappedInNavigation()
        
        let tabVC = UITabBarController()
        tabVC.viewControllers = [housesTableVC,seasonsTableVC]
        
        window?.rootViewController = tabVC
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

