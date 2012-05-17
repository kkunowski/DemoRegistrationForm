//
//  RegistrationDataModel.h
//  DemoRegistration
//
//  Created by Krzysztof Kunowski on 12-05-17.
//  Copyright (c) 2012 Future4Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegistrationDataModel : NSObject

@property(nonatomic, retain) NSString *firstName;
@property(nonatomic, retain) NSString *lastName;
@property(nonatomic, retain) NSString *password;
@property(nonatomic, retain) NSString *confirmedPassword;
@property(nonatomic, retain) NSString *registrationNumber;
@property(nonatomic, retain) NSString *idNumber;

@end
