/**
 * @description Verify Date
 */
public class VerifyDate {
    
    /**
     * @description method to handle potential checks against two dates
     * @return Date
     * @param date1
     * @param date2
     */
    public static Date CheckDates(Date date1, Date date2) {
        if(DateWithin30Days(date1,date2)) {
            return date2;
        } else {
            return SetEndOfMonthDate(date1);
        }
    }
    
    /**
     * @description method to check if date2 is within the next 30 days of date1
     * @return true or false
     * @param date1
     * @param date2
     */
    private static Boolean DateWithin30Days(Date date1, Date date2) {
            if( date2 < date1) { return false; }
            Date date30Days = date1.addDays(30);
        if( date2 >= date30Days ) { return false; }
        else { return true; }
    }

    /**
     * @description method to return the end of the month of a given date
     * @return lastDay
     * @param date1
     */
    private static Date SetEndOfMonthDate(Date date1) {
        Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
        Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
        return lastDay;
    }
}

//Git Hub Deployment --------
// Docker test5
// Validate pull request test
// Full pull request pipeline test
// Create pull request test
//Git Hub Deployment --------End



//Jenkins Deployment------
//Jenkins Deployment5
