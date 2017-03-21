

#import "UIView+YULoad.h"

@implementation UIView (YULoad)


+(id)YU_LoadFromNib
{
    NSString* nibName = NSStringFromClass([self class]);
    id retrunObj = nil;
    NSBundle* bundle = [NSBundle mainBundle];
    if ([bundle pathForResource:nibName ofType:@"nib"]){
        retrunObj = [[bundle loadNibNamed:nibName owner:nil options:nil] firstObject];
    }
    return retrunObj;
}

@end
