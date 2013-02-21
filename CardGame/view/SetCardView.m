//
//  PlayingCardView.m
//  SuperCard
//

#import "SetCardView.h"

@interface SetCardView()

@end

@implementation SetCardView

#include "SuperCard/pill" //change SuperCard to the folder the file is in, which probably is the same name as the project
#include "SuperCard/wave"
#include "SuperCard/diamond"


#define CARD_CORNER_RADIUS 15.0

//64*102 is recommended card size


- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:CARD_CORNER_RADIUS*self.bounds.size.width/180];
    
    [roundedRect addClip];
    
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    roundedRect.lineWidth = 2.4;
    [[UIColor grayColor] setStroke];
    [roundedRect stroke];

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextScaleCTM(context, 0.7, 0.7);
    //ratio: 18:28
    CGContextTranslateCTM(context, (self.bounds.size.width/167)*36, 0);
    
    if (self.number == 2)
    {       
        if (self.shape >= 2)
        {
            CGContextTranslateCTM(context, 0, (self.bounds.size.width/180)*100);
            if (self.shape == 2)
                [self drawWave];
            else
                [self drawPill];
            CGContextTranslateCTM(context, 0, (self.bounds.size.width/180)*111);
            if (self.shape == 2)
                [self drawWave];
            else
                [self drawPill];
        }
        else
        {
            CGContextTranslateCTM(context, 0, (self.bounds.size.width/180)*90);
            [self drawDiamond];
            CGContextTranslateCTM(context, 0, (self.bounds.size.width/180)*130);
            [self drawDiamond];
        }
    }
    else
    {
        CGContextTranslateCTM(context, 0, (self.bounds.size.width/180)*44);
        
        if (self.number == 3)
        {
            if (self.shape == 1)
                [self drawDiamond];
            else if (self.shape == 2)
                [self drawWave];
            else
                [self drawPill];
        }
        
        CGContextTranslateCTM(context, 0, (self.bounds.size.width/180)*111);
        if (self.shape == 1)
            [self drawDiamond];
        else if (self.shape == 2)
            [self drawWave];
        else
            [self drawPill];
        
        if (self.number == 3)
        {
            CGContextTranslateCTM(context, 0, (self.bounds.size.width/180)*111);
            if (self.shape == 1)
                [self drawDiamond];
            else if (self.shape == 2)
                [self drawWave];
            else
                [self drawPill];
        }
    }
    
    
    
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
    
    if(self.drawSelected){
        [[UIColor colorWithRed:0.0
                         green:0.0 blue:0.0 alpha:0.2]setFill];
        roundedRect = [UIBezierPath bezierPathWithRect:self.bounds];
        [roundedRect fill];
    }
}


- (void)setNumber:(int)number {
    _number = number;
    [self setNeedsDisplay];
}

- (void)setShape:(int)shape {
    _shape = shape;
    [self setNeedsDisplay];
}

- (void)setColor:(int)color {
    _color = color;
    [self setNeedsDisplay];
}

- (void)setFill:(int)fill {
    _fill = fill;
    [self setNeedsDisplay];
}

-(void)setDrawSelected:(BOOL)drawSelected{
    _drawSelected = drawSelected;
    [self setNeedsDisplay];
}



#pragma mark - Initialization

- (void)setup {
    // fo initialization here
}

- (void)awakeFromNib {
    [self setup];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

@end
