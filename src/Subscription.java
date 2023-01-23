public class Subscription {
    private int SubscriptionID;
    private String SubscriptionType;
    private int managerID;
    private int expenseID;

    public int getSubscriptionID() {
        return SubscriptionID;
    }

    public void setSubscriptionID(int subscriptionID) {
        SubscriptionID = subscriptionID;
    }

    public String getSubscriptionType() {
        return SubscriptionType;
    }

    public void setSubscriptionType(String subscriptionType) {
        SubscriptionType = subscriptionType;
    }

    public int getManagerID() {
        return managerID;
    }

    public void setManagerID(int managerID) {
        this.managerID = managerID;
    }

    public int getExpenseID() {
        return expenseID;
    }

    public void setExpenseID(int expenseID) {
        this.expenseID = expenseID;
    }

    public Subscription(int subscriptionID, String subscriptionType, int managerID, int expenseID) {
        this.SubscriptionID = subscriptionID;
        this.SubscriptionType = subscriptionType;
        this.managerID = managerID;
        this.expenseID = expenseID;
    }

    public Subscription(String subscriptionType, int managerID, int expenseID) {
        this.SubscriptionType = subscriptionType;
        this.managerID = managerID;
        this.expenseID = expenseID;
    }

    public Object getByName(String attributeName){
        return switch(attributeName){
            case "SubscriptionID" -> SubscriptionID;
            case "SubscriptionType" -> SubscriptionType;
            case "managerID" -> managerID;
            case "expenseID" -> expenseID;
            default -> null;
        };
    }
}
