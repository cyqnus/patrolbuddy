//
//  LoginController.m
//  patrolbuddy
//
//  Created by Billy Prasetya Tjahjadi on 12/26/2013.
//
//

#import "LoginController.h"

@interface LoginController ()

@end

@implementation LoginController
@synthesize UserName,Password;

- (id)initCustomNibName
{
    /*
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return [self initWithNibName:@"LoginViewSmall" bundle:nil];
    } else {
        return [self initWithNibName:@"LoginViewBig" bundle:nil];
    }
     */
    return [self initWithNibName:@"LoginViewSmall" bundle:nil];
}

- (void)setupButtons
{
    UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *buttonImagePressed = [UIImage imageNamed:@"cyanButton.png"];
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 12, 0, 12);
    UIImage *stretchableButtonImageNormal = [buttonImageNormal resizableImageWithCapInsets:insets];
    UIImage *stretchableButtonImagePressed = [buttonImagePressed resizableImageWithCapInsets:insets];
    [self.LoginButton setBackgroundImage:stretchableButtonImageNormal
                                forState:UIControlStateNormal];
    [self.ForgetButton setBackgroundImage:stretchableButtonImageNormal
                                 forState:UIControlStateNormal];
    [self.LoginButton setBackgroundImage:stretchableButtonImagePressed
                                forState:UIControlStateHighlighted];
    [self.ForgetButton setBackgroundImage:stretchableButtonImagePressed
                                 forState:UIControlStateHighlighted];
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.UserName = @"";
    self.Password = @"";
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonPressed:(id)sender
{
    NSLog(@"def");
}

@end
