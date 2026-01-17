public class BookDiscountManager {
    
    // Method to calculate the final price after a discount
    public static Decimal applyDiscount(Decimal originalPrice, Decimal discountPercent) {
        if (originalPrice == null || discountPercent == null) {
            return 0;
        }
        //Define variables
        Decimal discountAmount = originalPrice * (discountPercent / 100);
        Decimal finalPrice = originalPrice - discountAmount;
        
        return finalPrice.setScale(2); // Returns price rounded to 2 decimal places
    }
}

//Sample Jenkins Deployment3