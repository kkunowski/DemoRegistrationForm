//
//  RegistrationDataModel.m
//  DemoRegistration
//
//  Created by Krzysztof Kunowski on 12-05-17.
//  Copyright (c) 2012 Future4Tech. All rights reserved.
//

#import "RegistrationDataModel.h"

@implementation RegistrationDataModel

@synthesize firstName, lastName, password, confirmedPassword, registrationNumber,idNumber;

-(void)dealloc {
    [super dealloc];
    [self.firstName release];
    [self.lastName release];
    [self.password release];
    [self.confirmedPassword release];
    [self.registrationNumber release];
    [self.idNumber release];
}

@end
