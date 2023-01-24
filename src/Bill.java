

public class Bill {
    int billID;
    String billDesc;
    int subscriptionID;
    float billAmount;
    String image;


    public Bill(String billDesc, int subscriptionID, float billAmount, String image) {
        this.billDesc = billDesc;
        this.subscriptionID = subscriptionID;
        this.billAmount = billAmount;
        this.image = image;
    }

    public int getBillID() {
        return billID;
    }

    public void setBillID(int billID) {
        this.billID = billID;
    }

    public String getBillDesc() {
        return billDesc;
    }

    public void setBillDesc(String billDesc) {
        this.billDesc = billDesc;
    }

    public int getSubscriptionID() {
        return subscriptionID;
    }

    public void setSubscriptionID(int subscriptionID) {
        this.subscriptionID = subscriptionID;
    }

    public float getBillAmount() {
        return billAmount;
    }

    public void setBillAmount(float billAmount) {
        this.billAmount = billAmount;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    public Object getByName(String attributeName){
        return switch(attributeName){
            case "billID" -> billID;
            case "billDesc" -> billDesc;
            case "subscriptionID" -> subscriptionID;
            case "billAmount" -> billAmount;
            case "image" -> image;

            default -> null;
        };
    }
}
