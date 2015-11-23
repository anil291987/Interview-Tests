//
//  WebClient.h
//  PhotoGallery
//
//  Created by datta on 23/11/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ResponseCompletion)(id ResponseObject, NSError *error);
#define BASEURL @"http://192.168.10.104"

@interface WebClient : NSObject{
    ResponseCompletion _completionBlock;
}
-(void)callWebServiceUrl:(NSString *)urlstring withCompletionBlock:(ResponseCompletion)completion;
@end