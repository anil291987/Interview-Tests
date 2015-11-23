//
//  WebClient.m
//  PhotoGallery
//
//  Created by datta on 23/11/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import "WebClient.h"
#import "AFHTTPRequestOperationManager.h"


@implementation WebClient

-(void)callWebServiceUrl:(NSString *)urlstring withCompletionBlock:(ResponseCompletion)completion{
     _completionBlock = completion;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"%@/%@",BASEURL,urlstring] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        _completionBlock(responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        _completionBlock(nil,error);
    }];
}

@end
