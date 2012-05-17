//
//  RegistrationTableViewController.h
//  DemoRegistrationForm
//
//  Created by Krzysztof Kunowski on 12-05-17.
//  Copyright (c) 2012 Future4Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Three20/Three20.h>
#import "RegistrationDataModel.h"

@interface RegistrationTableViewController : TTTableViewController {
    RegistrationDataModel *_registrationDataModel;
    UIBarButtonItem *_registerButton;
}

@property(nonatomic, retain) UIBarButtonItem *registerButton;

@end
