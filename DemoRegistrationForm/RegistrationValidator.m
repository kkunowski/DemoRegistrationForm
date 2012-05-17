//
//  TextFieldsValidator.m
//  DemoRegistration
//
//  Created by Krzysztof Kunowski on 12-05-17.
//  Copyright (c) 2012 Future4Tech. All rights reserved.
//

/* 
    FirstName - Must have a value
   
    LastName - Must have a value
    
    registration - Must have a valid UK registration. Note, that this refers to car registration. Valid values are (e.g.) A1234GHJ A4 or ROG3R 
    
    id - Must have a five digit numeric value
    
    password - must have a value that does not match any of the values in firstName, lastName, registration or id. Must contain one non-alphabetic character.
    
    passwordConfirm - must match the value in password. 
 
 */

#import "RegistrationValidator.h"

@implementation RegistrationValidator

+(BOOL)isRegistrationModelValid:(RegistrationDataModel *)model 
{
    
    BOOL nameValid = [RegistrationValidator validateName:model.firstName];
    BOOL lastNameValid = [RegistrationValidator validateLastName:model.lastName];
    BOOL registrationValid = [RegistrationValidator validateRegistration:model.registrationNumber];
    BOOL passwordValid = [RegistrationValidator validatePassword:model];
    BOOL idNumberValid = [RegistrationValidator validateIdNumber:model.idNumber];
    
    if(registrationValid
       && nameValid 
       && lastNameValid
       && passwordValid 
       && idNumberValid)
        return TRUE;
    
    return FALSE;   
}

+(BOOL)validateName:(NSString *)name 
{
    if(name == NULL)
        return FALSE;
    
    if(name.length > 0) 
        return TRUE;
    
    return FALSE;
}

+(BOOL)validateLastName:(NSString *)name 
{
    if(name == NULL)
        return FALSE;
    
    if(name.length > 0) 
        return TRUE;
    return FALSE;
}

+(BOOL)validatePassword:(RegistrationDataModel *)model 
{
    if(model.password == NULL || model.confirmedPassword == NULL || model.firstName == NULL || model.lastName == NULL)
        return FALSE;
    
    if(model.password.length == 0 || model.confirmedPassword.length == 0 || model.lastName.length == 0 || model.firstName.length == 0)
        return FALSE;

    BOOL passwordSecure = FALSE;
    if(![RegistrationValidator string:model.password contains:model.firstName] && ![RegistrationValidator string:model.password contains:model.lastName] && [RegistrationValidator hasSpecialCharacter:model.password])
        passwordSecure = TRUE;
    
    BOOL passwordsEquals = [model.password isEqualToString:model.confirmedPassword];
        
    if(passwordSecure && passwordsEquals) 
        return TRUE;
   
    return FALSE;
}

/*
 
 Regex pattern taken from: http://regexlib.com/REDetails.aspx?regexp_id=617
 
 Matches ABC 123 A | A 123 ABC | AB 12 ABC
 Non-Matches AB 123 C | A 123 AB | AB 12 AB
 
*/ 
 
+(BOOL)validateRegistration:(NSString *)registrationNumber 
{
    if(registrationNumber == NULL)
        return FALSE;
    
    NSString *regex = @"^([A-Z]{3}\\s?(\\d{3}|\\d{2}|d{1})\\s?[A-Z])|([A-Z]\\s?(\\d{3}|\\d{2}|\\d{1})\\s?[A-Z]{3})|(([A-HK-PRSVWY][A-HJ-PR-Y])\\s?([0][2-9]|[1-9][0-9])\\s?[A-HJ-PR-Z]{3})$";
    
    return [RegistrationValidator isString:registrationNumber inRegex:regex];
}

+(BOOL)validateIdNumber:(NSString *)idNumber 
{
    if(idNumber == NULL)
        return FALSE;
    
    if(idNumber.length == 5 && [RegistrationValidator isNumeric:idNumber]) 
        return TRUE;
    
    return FALSE;
}

+(BOOL)isString:(NSString *)string inRegex:(NSString *)reg 
{
    NSRegularExpression *regex = [NSRegularExpression 
                                  regularExpressionWithPattern:reg
                                  options:0
                                  error:nil];
    
    NSRange range   = [regex rangeOfFirstMatchInString:string
                                               options:0 
                                                 range:NSMakeRange(0, [string length])];
    if(range.location == NSNotFound)
        return FALSE;
    
    return TRUE;
}

+(BOOL) isNumeric:(NSString*) string 
{
    NSNumberFormatter* numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];
    NSNumber* number = [numberFormatter numberFromString:string];
    
    if (number != nil) 
        return TRUE;
    
    return FALSE;
}

+(BOOL)hasSpecialCharacter:(NSString *)string 
{
    NSCharacterSet *set = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789"] invertedSet];
    NSRange range = [string rangeOfCharacterFromSet:set];
    return (range.location != NSNotFound);
}

+(BOOL)string:(NSString *)string contains:(NSString *)text 
{
    NSRange range = [[string uppercaseString] rangeOfString:[text uppercaseString]];
    return (range.location != NSNotFound);
}

@end
