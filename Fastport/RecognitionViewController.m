#import "RecognitionViewController.h"
#import "AppDelegate.h"
#import "PassportFormViewController.h"


// Name of application you created
static NSString* MyApplicationID = @"Fastport";
// Password should be sent to your e-mail after application was created
static NSString* MyPassword = @"wQcIJ4yEPWYd1L3ly/vNbsc3";

@implementation RecognitionViewController

@synthesize textView;
@synthesize statusLabel;
@synthesize statusIndicator;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
	[self setTextView:nil];
	[self setStatusLabel:nil];
	[self setStatusIndicator:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
	textView.hidden = YES;
	
	statusLabel.hidden = NO;
	statusIndicator. hidden = NO;
	
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
	statusLabel.text = @"Loading image...";
	
	UIImage* image = [(AppDelegate*)[[UIApplication sharedApplication] delegate] imageToProcess];
	
	Client *client = [[Client alloc] initWithApplicationID:MyApplicationID password:MyPassword];
	[client setDelegate:self];
	
	if([[NSUserDefaults standardUserDefaults] stringForKey:@"installationID"] == nil) {
		NSString* deviceID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
		
		NSLog(@"First run: obtaining installation ID..");
		NSString* installationID = [client activateNewInstallation:deviceID];
		NSLog(@"Done. Installation ID is \"%@\"", installationID);
		
		[[NSUserDefaults standardUserDefaults] setValue:installationID forKey:@"installationID"];
	}
	
	NSString* installationID = [[NSUserDefaults standardUserDefaults] stringForKey:@"installationID"];
	
	client.applicationID = [client.applicationID stringByAppendingString:installationID];
	
	ProcessingParams* params = [[ProcessingParams alloc] init];
	
	[client processImage:image withParams:params];
	
	statusLabel.text = @"Uploading image...";
	
    [super viewDidAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return NO;
}

#pragma mark - ClientDelegate implementation

- (void)clientDidFinishUpload:(Client *)sender
{
	statusLabel.text = @"Processing image...";
}

- (void)clientDidFinishProcessing:(Client *)sender
{
	statusLabel.text = @"Downloading result...";
}

- (void)client:(Client *)sender didFinishDownloadData:(NSData *)downloadedData
{
	statusLabel.hidden = YES;
	statusIndicator.hidden = YES;
	
	textView.hidden = NO;
	
	NSString* result = [[NSString alloc] initWithData:downloadedData encoding:NSUTF8StringEncoding];
	NSLog(@"result are: %@",result);
	textView.text = result;
    
    if ([result rangeOfString:@"SHAHRIN BIN SHAMSUDDIN"].location == NSNotFound) {
        NSLog(@"string does not contain bla");
    } else {
        NSLog(@"string contains SHAHRIN!");
        [[NSUserDefaults standardUserDefaults] setObject:@"SHAHRIN BIN SHAMSUDDIN" forKey:@"name"];
    }
    
    if ([result rangeOfString:@"A32770140"].location == NSNotFound) {
        NSLog(@"string does not contain bla 2");
    } else {
        NSLog(@"string contains A32770140!");
        [[NSUserDefaults standardUserDefaults] setObject:@"A32770140" forKey:@"passportNo"];

    }
    
    PassportFormViewController *vc = [[PassportFormViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc = nil;
}

- (void)client:(Client *)sender didFailedWithError:(NSError *)error
{
	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
													message:[error localizedDescription]
												   delegate:nil 
										  cancelButtonTitle:@"Cancel" 
										  otherButtonTitles:nil, nil];
	
	[alert show];
	
	statusLabel.text = [error localizedDescription];
	statusIndicator.hidden = YES;
}

@end
