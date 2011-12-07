//
//  CGameView.m
//  AngryBirdsClone
//
//  Created by Jonathan Wight on 11/11/11.
//  Copyright (c) 2011 toxicsoftware.com. All rights reserved.
//

#import "CGameView.h"

#import "CSceneNode.h"
#import "CGameSceneGeometry.h"
#import "CPhysicsShape.h"
#import "CPhysicsBody.h"
#import "CGameRenderer.h"

@interface CGameView ()
@property (readwrite, nonatomic, assign) CGPoint touchBeganLocation;
@property (readwrite, nonatomic, strong) CSceneNode *touchedNode;
@end

#pragma mark -

@implementation CGameView

@synthesize rootNode;

@synthesize touchBeganLocation;
@synthesize touchedNode;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
    {
    UITouch *theTouch = [touches anyObject];
    CGPoint theLocation = [theTouch locationInView:self];
    self.touchBeganLocation = theLocation;
    theLocation.y = self.bounds.size.height - theLocation.y;
    self.touchedNode = [self.rootNode hitTest:theLocation];
    NSLog(@"%@", self.touchedNode);
    }
    
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
    {
    }
    
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
    {
    if (self.touchedNode != NULL)
        {
        UITouch *theTouch = [touches anyObject];
        CGPoint theLocation = [theTouch locationInView:self];
        CGameSceneGeometry *theGeometry = self.touchedNode;

        NSLog(@"%@", theGeometry.shape.body);
        
        GLfloat kFactor = 3.5;
        
        theGeometry.shape.body.velocity = (CGPoint){
            (self.touchBeganLocation.x - theLocation.x) * kFactor,
            (self.touchBeganLocation.y - theLocation.y) * -kFactor,
            };

        CGameRenderer *theGameRenderer = self.renderer;
        theGameRenderer.playing = YES;
        }
    self.touchedNode = NULL;
    }
    
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
    {
    self.touchedNode = NULL;
    }

@end
