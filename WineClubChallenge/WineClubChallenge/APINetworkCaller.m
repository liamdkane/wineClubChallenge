//
//  APINetworkCaller.m
//  WineClubChallenge
//
//  Created by C4Q on 5/31/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "APINetworkCaller.h"
#import "AFNetworking.h"
#import "AppDelegate.h"

@interface APINetworkCaller()

@property NSString *apiKey;
@property NSURLSessionConfiguration *configuration;
@property AFURLSessionManager *manager;
@property id<NetworkAnswering> delegate;


@end

@implementation APINetworkCaller

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //My choice here was to create another singleton of the networkCaller, DataMessanger, or have a default init that finds the app delegate and assigns the first DataMessanger I need to use to populate. Doing it this allows me to call on the network for images while making sure that state is only being maintained in one place
        AppDelegate* app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        self.delegate = app.dataManager;
        self.apiKey = @"e18c783dc59001a76c2fa1f6559c6141";
        self.configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:self.configuration];
    }
    return self;
}

-(void)fetchCategories {
    NSURL *URL = [NSURL URLWithString:@"http://services.wine.com/api/beta2/service.svc/JSON/categorymap?filter=categories(490)&apikey=e18c783dc59001a76c2fa1f6559c6141"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSDictionary *jsonDictionary = responseObject;
            NSArray *categoriesJsonArray = [jsonDictionary objectForKey:@"Categories"];
            [self.delegate didRecieveCategoryies:categoriesJsonArray];
        }
    }];
    [dataTask resume];
}

-(void)initialFetchWines {
    NSURL *URL = [NSURL URLWithString:@"http://services.wine.com/api/beta2/service.svc/JSON/catalog?apikey=e18c783dc59001a76c2fa1f6559c6141&size=100"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSDictionary *jsonDictionary = responseObject;
            NSDictionary *products = [jsonDictionary objectForKey:@"Products"];
            NSArray *wineArray = [products objectForKey:@"List"];
            
            [self.delegate didRecieveWine:wineArray];
        }
    }];
    [dataTask resume];
}


@end
