//
//  RegistrationTableViewController.m
//  DemoRegistrationForm
//
//  Created by Krzysztof Kunowski on 12-05-17.
//  Copyright (c) 2012 Future4Tech. All rights reserved.
//

#import "RegistrationTableViewController.h"
#import "RegistrationValidator.h"

@interface  RegistrationTableViewController()

-(void)initDataSource;

@end 

@implementation RegistrationTableViewController

@synthesize registerButton = _registerButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {

        self.tableViewStyle = UITableViewStyleGrouped;
        self.autoresizesForKeyboard = YES;
        self.variableHeightRows = YES;
        self.title = @"Demo registration";
        
        self.registerButton = [[[UIBarButtonItem alloc] initWithTitle:@"Register" style:
                                UIBarButtonItemStyleBordered target:self action:@selector(register)] autorelease];
        self.registerButton.enabled = FALSE;

        [self.navigationItem setRightBarButtonItem:self.registerButton]; 
        _registrationDataModel = [[RegistrationDataModel alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextFieldTextDidChangeNotification object:nil];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
        
        [self initDataSource];
    }
    return self;
}


-(void)initDataSource {

    UITextField *nameField = [[[UITextField alloc] init] autorelease];
    nameField.placeholder = @"First name";
    nameField.tag = 1;

    UITextField *lastNameField = [[[UITextField alloc] init] autorelease];
    lastNameField.placeholder = @"Last name";
    lastNameField.tag = 2;
    
    UITextField *registrationNumberField = [[[UITextField alloc] init] autorelease];
    registrationNumberField.placeholder = @"Vehicle registration";
    registrationNumberField.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    registrationNumberField.tag = 3;
        
    // TODO: implement in delegae shouldChangeCharactersInRange to avoid entering more than 5 char.
    
    UITextField *idNumberField = [[[UITextField alloc] init] autorelease];
    idNumberField.placeholder = @"Identification number";
    idNumberField.keyboardType = UIKeyboardTypePhonePad;
    idNumberField.tag = 4;
    
    UITextField *passwordField = [[[UITextField alloc] init] autorelease];
    passwordField.placeholder = @"Password";
    passwordField.secureTextEntry = YES;
    passwordField.tag = 5;
    
    UITextField *confirmedPasswordField = [[[UITextField alloc] init] autorelease];
    confirmedPasswordField.placeholder = @"Confirm password";
    confirmedPasswordField.secureTextEntry = YES;
    confirmedPasswordField.tag = 6;
     
    self.dataSource = [TTListDataSource dataSourceWithObjects:
                       nameField,
                       lastNameField,
                       registrationNumberField,
                       idNumberField,
                       passwordField,
                       confirmedPasswordField,
                       nil];
}

- (void) textFieldDidBeginEditing:(NSNotification *)notif {
    UITextField *textField = (UITextField*)notif.object;
    UITableViewCell *cell = (UITableViewCell*) [[textField superview] superview];
    [self.tableView scrollToRowAtIndexPath:[self.tableView indexPathForCell:cell] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

-(void)textDidChange:(NSNotification *)notif {
    
    UITextField *textField = (UITextField*)notif.object;
    
    if(textField.tag == 1) {
        _registrationDataModel.firstName = textField.text;
    } else if (textField.tag == 2) {
        _registrationDataModel.lastName = textField.text;
    } else if (textField.tag == 3) {
        _registrationDataModel.registrationNumber = textField.text;
    } else if (textField.tag == 4) {
       _registrationDataModel.idNumber = textField.text;
    } else if (textField.tag == 5) {
        _registrationDataModel.password = textField.text;
    } else if (textField.tag == 6) {
        _registrationDataModel.confirmedPassword = textField.text;
    }
    
    self.registerButton.enabled = [RegistrationValidator isRegistrationModelValid:_registrationDataModel];
}

-(void)register {
    UIAlertView *cofirmationAlert = [[UIAlertView alloc] initWithTitle:@"Congratulations !!" message:@"Registration completed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [cofirmationAlert show];
    [cofirmationAlert release];
    [self initDataSource];
}
-(void)dealloc {
    [super dealloc];
    [self.registerButton release];
}

@end
