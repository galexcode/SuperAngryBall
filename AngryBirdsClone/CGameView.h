//
//  CGameView.h
//  AngryBirdsClone
//
//  Created by Jonathan Wight on 11/11/11.
//  Copyright (c) 2011 toxicsoftware.com. All rights reserved.
//

#import "CRendererView.h"

@class CSceneNode;

@interface CGameView : CRendererView

@property (readwrite, nonatomic, strong) CSceneNode *rootNode;

@end
