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

@interface ApiNetworkCaller()

@property NSString *apiKey;
@property NSString *baseUrl;
@property NSURLSessionConfiguration *configuration;
@property AFURLSessionManager *manager;
@property id<NetworkAnswering> delegate;


@end

@implementation ApiNetworkCaller

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //My choice here was to create another singleton of the networkCaller, DataMessanger, or have a default init that finds the app delegate and assigns the first DataMessanger I need to use to populate. Doing it this allows me to call on the network for images while making sure that state is only being maintained in one place
        AppDelegate* app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        self.delegate = app.dataManager;
        self.apiKey = @"&apikey=e18c783dc59001a76c2fa1f6559c6141";
        self.baseUrl = @"http://services.wine.com/api/beta2/service.svc/JSON/";
        self.configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:self.configuration];
    }
    return self;
}

-(void)fetchCategories {
    
    NSString* urlAsString = [NSString stringWithFormat:@"%@categorymap?filter=categories(490)%@", self.baseUrl, self.apiKey];
    
    NSURL* URL = [NSURL URLWithString: urlAsString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSDictionary *jsonDictionary = responseObject;
            [self.delegate didRecieveCategories:jsonDictionary];
        }
    }];
    [dataTask resume];
}

-(void)initialFetchWines {
    
    NSString* urlAsString = [NSString stringWithFormat:@"%@catalog?size=50%@", self.baseUrl, self.apiKey];

    NSURL *URL = [NSURL URLWithString: urlAsString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSDictionary *jsonDictionary = responseObject;
            
            [self.delegate didRecieveWine:jsonDictionary];
        }
    }];
    [dataTask resume];
}

-(void)fetchWinesInCategory: (WineCategory *)category {
    
    
    NSString* urlAsString = [NSString stringWithFormat:@"%@catalog?size=50&filter=categories(490+%ld)%@", self.baseUrl, (long)category.categoryId, self.apiKey];
    
    NSURL *URL = [NSURL URLWithString: urlAsString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSDictionary *jsonDictionary = responseObject;
            
            [self.delegate didRecieveWine:jsonDictionary];
        }
    }];
    [dataTask resume];


}

@end
