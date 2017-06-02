//
//  NSString_StripHtml.h
//  WineClubChallenge
//
//  Created by C4Q on 6/1/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import <Foundation/Foundation.h>


//Shamelessly stolen from: https://stackoverflow.com/questions/277055/remove-html-tags-from-an-nsstring-on-the-iphone


@interface NSString (HtmlStripping)
-(NSString *) stringByStrippingHTML;
@end

@implementation NSString (HtmlStripping)

-(NSString *) stringByStrippingHTML {
    NSRange r;
    NSString *s = [self copy];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
};

@end
