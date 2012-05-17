//
//  TextFieldsValidator.h
//  DemoRegistration
//
//  Created by Krzysztof Kunowski on 12-05-17.
//  Copyright (c) 2012 Future4Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegistrationDataModel.h"

@interface RegistrationValidator : NSObject

+(BOOL)isRegistrationModelValid:(RegistrationDataModel *)mode;

+(BOOL)validateName:(NSString *)name;
+(BOOL)validateLastName:(NSString *)name;
+(BOOL)validatePassword:(RegistrationDataModel *)model;
+(BOOL)validateRegistration:(NSString *)registrationNumber;
+(BOOL)validateIdNumber:(NSString *)idNumber;

+(BOOL)isString:(NSString *)string inRegex:(NSString *)reg;
+(BOOL)isNumeric:(NSString*) string ;
+(BOOL)hasSpecialCharacter:(NSString *)string;
+(BOOL)string:(NSString *)string contains:(NSString *)text;

@end
