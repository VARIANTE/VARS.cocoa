/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "vsmem.h"
#import "VSUITextField.h"

/**
 *  Default UUID.
 */
static const int DEFAULT_UUID = -1;

#pragma mark - INTERFACE

/**
 *  @inheritDoc
 */
@interface VSUITextField()
{
@private
    VSUIViewUpdate *_updateDelegate;
}

#pragma mark - PROPERTIES

/**
 *  @inheritDoc
 */
@property (nonatomic) int UUID;

@end

#pragma mark - IMPLEMENTATION

/**
 *  @inheritDoc
 */
@implementation VSUITextField

#pragma mark - PROTOCOL PROPERTIES
#pragma mark - Drawing

/**
 *  @inheritDoc VSUIViewUpdateDelegate
 */
- (VSUIViewUpdate *)updateDelegate
{
    if (_updateDelegate != nil) return _updateDelegate;

    _updateDelegate = [[VSUIViewUpdate alloc] init];
    [_updateDelegate setDelegate:self];

    return _updateDelegate;
}

/**
 *  @inheritDoc VSUIViewUpdateDelegate
 */
- (UIInterfaceOrientation)interfaceOrientation
{
    return [self.updateDelegate interfaceOrientation];
}

/**
 *  @inheritDoc VSUIViewUpdateDelegate
 */
- (void)setInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    [self.updateDelegate setInterfaceOrientation:interfaceOrientation];
}

#pragma mark - PROPERTIES
#pragma mark - Identifier

/**
 *  @inheritDoc
 */
@synthesize UUID = _uUID;

#pragma mark - Data

/**
 *  @inheritDoc UITextField
 */
- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];

    [self.updateDelegate setDirty:VSUIDirtyTypeData];
}

/**
 *  @inheritDoc UITextField
 */
- (void)setText:(NSString *)text
{
    [super setText:text];

    [self.updateDelegate setDirty:VSUIDirtyTypeData];
}

/**
 *  @inheritDoc
 */
- (NSRange)selectedRange
{
    UITextPosition *beginning = self.beginningOfDocument;
    UITextRange *selectedRange = self.selectedTextRange;
    UITextPosition *selectionStart = selectedRange.start;
    UITextPosition *selectionEnd = selectedRange.end;

    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];

    return NSMakeRange(location, length);
}

/**
 *  @inheritDoc
 */
- (void)setSelectedRange:(NSRange)range
{
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];

    [self setSelectedTextRange:selectionRange];
}

#pragma mark - Behaviors

/**
 *  @inheritDoc
 */
@synthesize shouldRedirectTouchesToNextResponder = _shouldRedirectTouchesToNextResponder;

#pragma mark - Styles

/**
 *  @inheritDoc
 */
@synthesize shouldHideKeyboard = _shouldHideKeyboard;

/**
 *  @inheritDoc
 */
- (void)setShouldHideKeyboard:(BOOL)shouldHideKeyboard
{
    _shouldHideKeyboard = shouldHideKeyboard;

    UIView *dummyKeyboard = [[UIView alloc] initWithFrame:CGRectZero];
    [self setInputView:dummyKeyboard];
    vs_dealloc(dummyKeyboard);
}

#pragma mark - PROTOCOL METHODS
#pragma mark - Updating

/**
 *  @inheritDoc VSUIViewUpdateDelegate
 */
- (void)setNeedsUpdate
{
    [self update];
}

/**
 *  @inheritDoc VSUIViewUpdateDelegate
 */
- (void)update
{
    [self.updateDelegate viewDidUpdate];
}

/**
 *  @inheritDoc VSUIViewUpdateDelegate
 */
- (BOOL)isDirty:(VSUIDirtyType)dirtyType
{
    return [self.updateDelegate isDirty:dirtyType];
}

#pragma mark - INSTANCE METHODS
#pragma mark - Lifecycle

/**
 *  @inheritDoc UIView
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self)
    {
        [self setUUID:DEFAULT_UUID];
        [self didInit];
    }

    return self;
}

/**
 *  @inheritDoc
 */
- (id)initWithFrame:(CGRect)frame UUID:(int)UUID
{
    self = [super initWithFrame:frame];

    if (self)
    {
        [self setUUID:UUID];
        [self didInit];
    }

    return self;
}

/**
 *  @inheritDoc
 */
- (id)initWithUUID:(int)UUID
{
    self = [self initWithFrame:CGRectZero UUID:UUID];

    return self;
}

/**
 *  @inheritDoc NSObject
 */
- (void)dealloc
{
    [self willDealloc];

#if !__has_feature(objc_arc)
    [super dealloc];
#endif
}

/**
 *  @inheritDoc
 */
- (void)didInit
{
    [self setShouldRedirectTouchesToNextResponder:NO];
    
    [self.updateDelegate viewDidInit];
}

/**
 *  @inheritDoc
 */
- (void)willDealloc
{
    vs_dealloc(_updateDelegate);
}

#pragma mark - Layout

/**
 *  @inheritDoc
 */
- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.updateDelegate setDirty:VSUIDirtyTypeLayout];
}

#pragma mark - Event Handling

/**
 *  @inheritDoc UIResponder
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.shouldRedirectTouchesToNextResponder)
    {
        [self.nextResponder touchesBegan:touches withEvent:event];
    }
    else
    {
        [super touchesBegan:touches withEvent:event];
    }
}

/**
 *  @inheritDoc UIResponder
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.shouldRedirectTouchesToNextResponder)
    {
        [self.nextResponder touchesMoved:touches withEvent:event];
    }
    else
    {
        [super touchesMoved:touches withEvent:event];
    }
}

/**
 *  @inheritDoc UIResponder
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.shouldRedirectTouchesToNextResponder)
    {
        [self.nextResponder touchesEnded:touches withEvent:event];
    }
    else
    {
        [super touchesEnded:touches withEvent:event];
    }
}

/**
 *  @inheritDoc UIResponder
 */
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.shouldRedirectTouchesToNextResponder)
    {
        [self.nextResponder touchesCancelled:touches withEvent:event];
    }
    else
    {
        [super touchesCancelled:touches withEvent:event];
    }
}

@end
