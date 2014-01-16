//
//  LoginView.m
//  patrolbuddy
//
//  Created by Billy Prasetya Tjahjadi on 12/27/2013.
//
//

#import "LoginView.h"

@interface LoginView()
{
    NSMutableDictionary *viewsDictionary;
}

@property (nonatomic,weak) UIScrollView *LoginScrollView;
@property (nonatomic,weak) UITextField *UserNameField;
@property (nonatomic,weak) UITextField *PasswordField;
@property (nonatomic,weak) UIButton *LoginButton;
@property (nonatomic,weak) UIButton *ForgetButton;
@property (nonatomic,weak) UIImageView *PatrolBuddyLogo;
@property (nonatomic,weak) UIActivityIndicatorView *LoginLoaderIndicator;
@property (nonatomic,weak) UITextField *textField;

@end
@implementation LoginView


-(void) drawFieldForPassword
{
    UITextField *passwordField = [[UITextField alloc] init];
    [passwordField setTranslatesAutoresizingMaskIntoConstraints:NO];
    passwordField.backgroundColor = [UIColor whiteColor];
    passwordField.placeholder = @"Password";
    self.PasswordField = passwordField;
    [self.LoginScrollView addSubview:self.PasswordField];
    
    
    [viewsDictionary setObject:self.PasswordField forKey:@"PasswordField"];
    
    
    NSArray *PasswordFieldXConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[PasswordField]-|"
                                                                                options:0
                                                                                metrics:nil
                                                                                  views:viewsDictionary];
    
    NSArray *PasswordFieldYConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[UserNameField]-20-[PasswordField]"
                                                                                options:0
                                                                                metrics:nil
                                                                                  views:viewsDictionary] ;
    
    [self addConstraints:PasswordFieldXConstraint];
    [self addConstraints:PasswordFieldYConstraint];
}

-(void) drawFieldForUserName
{
    UITextField *userNameField = [[UITextField alloc] init];
    [userNameField setTranslatesAutoresizingMaskIntoConstraints:NO];
    userNameField.backgroundColor = [UIColor whiteColor];
    userNameField.placeholder = @"User Name";
    
    self.UserNameField = userNameField;
    [self.LoginScrollView addSubview:self.UserNameField];
    

    [viewsDictionary setObject:self.UserNameField forKey:@"UserNameField"];
    
    
    NSArray *UserNameFieldXConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[UserNameField]-|"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:viewsDictionary];
    
    NSArray *UserNameFieldYConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[PatrolBuddyLogo]-20-[UserNameField]"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:viewsDictionary] ;
    
    [self addConstraints:UserNameFieldXConstraint];
    [self addConstraints:UserNameFieldYConstraint];
    
    
}

-(void) drawLogo
{
    UIImageView *logo = [[UIImageView alloc] init];
    logo.image = [UIImage imageNamed:@"patrolBuddy_logo.png"];
    self.PatrolBuddyLogo = logo;
    [self.LoginScrollView addSubview:self.PatrolBuddyLogo];
    [self.PatrolBuddyLogo setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [viewsDictionary setObject:self.PatrolBuddyLogo forKey:@"PatrolBuddyLogo"];
    NSArray *logoLayoutXConstraints;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        logoLayoutXConstraints =
        [NSLayoutConstraint constraintsWithVisualFormat:[[NSString alloc]
                                                         initWithFormat:@"H:|-%d-[PatrolBuddyLogo(>=%d)]-%d-|",
                                                         (int)ceilf(self.LoginScrollView.frame.size.width*0.075),
                                                         (int)ceilf(self.LoginScrollView.frame.size.width*.85),
                                                         (int)ceilf(self.LoginScrollView.frame.size.width*0.075)]
                                                options:0
                                                metrics:nil
                                                  views:viewsDictionary];
    }
    else
    {
        logoLayoutXConstraints =
        [NSLayoutConstraint constraintsWithVisualFormat:[[NSString alloc]
                                                         initWithFormat:@"H:|-%d-[PatrolBuddyLogo(>=%d)]-%d-|",
                                                         (int)ceilf(self.LoginScrollView.frame.size.width*0.055),
                                                         (int)ceilf(self.LoginScrollView.frame.size.width*.85),
                                                         (int)ceilf(self.LoginScrollView.frame.size.width*0.075)]
                                                options:0
                                                metrics:nil
                                                  views:viewsDictionary];
    }
    
    NSArray *logoLayoutYConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:[[NSString alloc]
                                                     initWithFormat:@"V:|-%d-[PatrolBuddyLogo(<=%d)]",
                                                     (int)ceilf(self.LoginScrollView.frame.size.height*0.05),
                                                     (int)ceilf(self.LoginScrollView.frame.size.height/4)]
                                            options:0
                                            metrics:nil
                                              views:viewsDictionary];
    
    [self addConstraints:logoLayoutXConstraints];
    [self addConstraints:logoLayoutYConstraints];
    
}

-(void)drawUIElements
{
    [self drawLogo];
    [self drawFieldForUserName];
    [self drawFieldForPassword];
}

- (void)backgroundTap: (id)sender
{
    [self.UserNameField resignFirstResponder];
    [self.PasswordField resignFirstResponder];
    [self.LoginScrollView setContentOffset:CGPointZero animated:YES];
    
}

- (IBAction) textFieldIsBeingEdited:(id)sender
{
    [self.LoginScrollView setContentOffset:CGPointMake(0, 200) animated:YES];
}


// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.LoginScrollView.contentInset = contentInsets;
    self.LoginScrollView.scrollIndicatorInsets = contentInsets;
    [self.LoginScrollView setContentOffset:CGPointZero animated:YES];
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    /*
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.LoginScrollView.contentInset = contentInsets;
    self.LoginScrollView.scrollIndicatorInsets = contentInsets;
    */
   [self.LoginScrollView setContentOffset:CGPointMake(0, kbSize.height) animated:YES];
    
    
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}


// overriding method of init from parent class
- (id)init
{
    self = [super init];
    if (self) {
        self = [[LoginView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
        [self setBackgroundColor: [UIColor colorWithRed:67.0f/255.0f
                                                  green:149.0f/255.0f
                                                   blue:166.0f/255.0f
                                                  alpha:1.0f]];
        
        [self setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        viewsDictionary = [[NSMutableDictionary alloc] init];
        [viewsDictionary setObject:self forKey:@"LoginView"];
        
        UIScrollView *loginScrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
        [loginScrollView setScrollEnabled:YES];
        [loginScrollView setContentSize:CGSizeMake(self.frame.size.width,
                                                   self.frame.size.height)];
        
        loginScrollView.contentInset=UIEdgeInsetsMake(0.0,0.0,0.0,0.0);
        [loginScrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        
        UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                                     action:@selector(backgroundTap:)];
        
        [singleTapGestureRecognizer setNumberOfTapsRequired:1];
        [singleTapGestureRecognizer setEnabled:YES];
        [singleTapGestureRecognizer setCancelsTouchesInView:NO];
        [loginScrollView addGestureRecognizer:singleTapGestureRecognizer];
        
        self.LoginScrollView = loginScrollView;
        
        [self.LoginScrollView setDelegate:self];
        [self addSubview:self.LoginScrollView];
        [self registerForKeyboardNotifications];
        
        [self drawUIElements];
        
    }
    return self;
}

@end
