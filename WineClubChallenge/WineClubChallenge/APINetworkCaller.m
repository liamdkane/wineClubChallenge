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
#import "AFImageDownloader.h"

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
        
        //My choice here was to create another singleton of the networkCaller, DataMessenger, or have a default init that finds the app delegate and assigns the first DataMessenger I need to use to populate. Doing it this allows me to call on the network for images while making sure that state is only being maintained in one place
        AppDelegate* app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        self.delegate = app.dataManager;
        NSURLSessionConfiguration* configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        self.apiKey = @"&apikey=e18c783dc59001a76c2fa1f6559c6141";
        self.baseUrl = @"http://services.wine.com/api/beta2/service.svc/JSON/";
    }
    return self;
}


-(void)fetchImage: (WineObject *)wine thumb:(BOOL)isItThumbnail{
    AppDelegate* app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    AFImageDownloader* imageDownloader = [[AFImageDownloader alloc] initWithSessionManager: app.sessionManager downloadPrioritization:AFImageDownloadPrioritizationFIFO maximumActiveDownloads:20 imageCache:app.imageCache];
    NSURL* URL = [NSURL URLWithString: isItThumbnail ? wine.thumbImageURL : wine.largeImageURL];
    
    //checking to see if the download is already happening
    for (NSURLSessionTask* task in app.sessionManager.tasks) {
        if ([task.originalRequest.URL.absoluteString isEqualToString:wine.thumbImageURL]) {
            return;
        }
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFImageDownloadReceipt *task = [imageDownloader downloadImageForURLRequest:request success:^(NSURLRequest * _Nonnull request,NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
        if (isItThumbnail) {
            [wine setThumbImage:responseObject];
        } else {
            [wine setLargeImage:responseObject];
        }
        [self.delegate didReceiveWineImage:wine thumb:isItThumbnail];
        \
    } failure:^(NSURLRequest * _Nonnull request,
                NSHTTPURLResponse * _Nullable response,
                NSError * _Nonnull error) {
        
    }];
    [task.task resume];
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
            [self.delegate didReceiveCategories:jsonDictionary];
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
            
            [self.delegate didReceiveWine:jsonDictionary];
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
            
            [self.delegate didReceiveWine:jsonDictionary];
        }
    }];
    [dataTask resume];
    
    
}

@end
