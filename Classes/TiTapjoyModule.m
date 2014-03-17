/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiTapjoyModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import <Tapjoy/Tapjoy.h>
@implementation TiTapjoyModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"ed8c2493-122b-499d-a2bb-507cd183bf23";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.tapjoy";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}

-(id)requestTapjoyConnect:(id)args
{
    NSString *xappID =[TiUtils stringValue:[self valueForUndefinedKey:@"appID"]];
    NSString *xsecretKey =[TiUtils stringValue:[self valueForUndefinedKey:@"secretKey"]];
    NSLog(@"[INFO] TapJoy: Trying to connect");
    @try {
        NSLog(@"[DEBUG] TapJoy: Inside Try 2");
        dispatch_async(dispatch_get_main_queue(), ^{
            [Tapjoy requestTapjoyConnect:xappID secretKey:xsecretKey options:@{    TJC_OPTION_ENABLE_LOGGING : @(YES) }];
        });
        NSLog(@"[DEBUG] TapJoy: Called Tapjoy connect");
    }
    @catch (NSException *e) {
        NSLog(@"[ERROR] TapJoy: Error trying to connect: %@", e);
    }
    @finally {
        return [NSString stringWithFormat:@"%@/%@", xappID, xsecretKey];
    }
}
@end


















