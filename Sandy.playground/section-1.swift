import UIKit

var calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)

var units = NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitMinute | NSCalendarUnit.CalendarUnitSecond

var components = calendar.components(units, fromDate: NSDate())

//calculate hour hand angle
var hoursAngle = (components.hour / 12.0)
components.hour

//calculate minute hand angle
var minsAngle = (components.minute / 60.0) * 2.0// * M_PI * 2.0;
CGFloat((Double)(components.minute) / 60.0 * M_PI * 2.0)

//calculate second hand angle
var secsAngle = (components.second / 60.0)// * M_PI * 2.0;
components.second





