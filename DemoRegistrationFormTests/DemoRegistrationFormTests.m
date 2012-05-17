//
//  DemoRegistrationFormTests.m
//  DemoRegistrationFormTests
//
//  Created by Krzysztof Kunowski on 12-05-17.
//  Copyright (c) 2012 Future4Tech. All rights reserved.
//

#import "DemoRegistrationFormTests.h"
#import "RegistrationValidator.h"

@implementation DemoRegistrationFormTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    
    BOOL isValid = [RegistrationValidator isRegistrationModelValid:[self validModel]];

    STAssertTrue(isValid, @"Validation Error");

    RegistrationDataModel *model2 = [self validModel];
    model2.password = @"Krzysztof123!";
    model2.confirmedPassword = @"Krzysztof123!";
    BOOL isNotValid = [RegistrationValidator isRegistrationModelValid:model2];
    STAssertFalse(isNotValid, @"Validation Error");    

    RegistrationDataModel *model3 = [self validModel];
    model3.idNumber = @"asdasdaii65";
    isNotValid = [RegistrationValidator isRegistrationModelValid:model3];
    STAssertFalse(isNotValid, @"Validation Error");    
 
    RegistrationDataModel *model4 = [self validModel];
    model4.password = @"abc";
    model4.password = @"abc";
    isNotValid = [RegistrationValidator isRegistrationModelValid:model4];
    STAssertFalse(isNotValid, @"Validation Error");    
    
    RegistrationDataModel *model5 = [self validModel];
    model5.registrationNumber = @"AAA22345FFF";
    isNotValid = [RegistrationValidator isRegistrationModelValid:model5];
    STAssertFalse(isNotValid, @"Validation Error");    
    
}

-(RegistrationDataModel *)validModel {
    RegistrationDataModel *registationModel = [[RegistrationDataModel alloc] init];
    registationModel.firstName = @"Krzysztof";
    registationModel.lastName = @"Kunowski";
    registationModel.registrationNumber = @"GH123GHJ";
    registationModel.idNumber = @"12345";
    registationModel.password = @"abc123!";
    registationModel.confirmedPassword = @"abc123!";
    return registationModel;
}

@end
