{ Parsed from Foundation.framework (MacOSX10.8) NSNotification.h }
{ Created on Fri Mar 21 17:48:08 2014 }


{ Types from NSNotificationCenter }
{$ifdef TYPES}

{$endif}


{$ifdef TYPES}
type
  NSNotificationPtr = ^NSNotification;
  NSNotificationCenterPtr = ^NSNotificationCenter;
{$endif}

{$ifdef CLASSES}

type
  NSNotification = objcclass external (NSObject, NSCopyingProtocol, NSCodingProtocol)
  public
    function name: NSString; message 'name';
    function object_: id; message 'object';
    function userInfo: NSDictionary; message 'userInfo';

    { Adopted protocols }
    function copyWithZone (zone: NSZonePtr): id; message 'copyWithZone:';
    procedure encodeWithCoder (aCoder: NSCoder); message 'encodeWithCoder:';
    function initWithCoder (aDecoder: NSCoder): id; message 'initWithCoder:';
  end;


type
  NSNotificationCreation = objccategory external (NSNotification)
    class function notificationWithName_object (aName: NSString; anObject: id): id; message 'notificationWithName:object:';
    class function notificationWithName_object_userInfo (aName: NSString; anObject: id; aUserInfo: NSDictionary): id; message 'notificationWithName:object:userInfo:';
  end;


type
  NSNotificationCenter = objcclass external (NSObject)
  private
    _impl: pointer;
    _callback: pointer;
    _pad:array[0..10] of pointer;
  public
    class function defaultCenter: id; message 'defaultCenter';
    procedure addObserver_selector_name_object (observer: id; aSelector: SEL; aName: NSString; anObject: id); message 'addObserver:selector:name:object:';
    procedure postNotification (notification: NSNotification); message 'postNotification:';
    procedure postNotificationName_object (aName: NSString; anObject: id); message 'postNotificationName:object:';
    procedure postNotificationName_object_userInfo (aName: NSString; anObject: id; aUserInfo: NSDictionary); message 'postNotificationName:object:userInfo:';
    procedure removeObserver (observer: id); message 'removeObserver:';
    procedure removeObserver_name_object (observer: id; aName: NSString; anObject: id); message 'removeObserver:name:object:';
    {$if defined(NS_BLOCKS_AVAILABLE)}
    function addObserverForName_object_queue_usingBlock (name: NSString; obj: id; queue: NSOperationQueue; block: OpaqueCBlock): id; message 'addObserverForName:object:queue:usingBlock:'; { available in 10_6, 4_0 }
    {$endif}
  end;
{$endif}

