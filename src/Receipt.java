import java.util.Date;

public class Receipt {
    private int ReceiptID;
    private String ReceiptDescription;
    private int ResidentID;
    private float ReceiptAmount;
    private Date ReceiptTime;
    private int isExpense;


    public Receipt(int receiptID, String receiptDescription, int residentID, float receiptAmount, Date receiptTime, int isExpense) {
        this.ReceiptID = receiptID;
        this.ReceiptDescription = receiptDescription;
        this.ResidentID = residentID;
        this.ReceiptAmount = receiptAmount;
        this.ReceiptTime = receiptTime;
        this.isExpense = isExpense;
    }

    public Receipt(String receiptDescription, int residentID, float receiptAmount, Date receiptTime, int isExpense) {
        this.ReceiptDescription = receiptDescription;
        this.ResidentID = residentID;
        this.ReceiptAmount = receiptAmount;
        this.ReceiptTime = receiptTime;
        this.isExpense = isExpense;
    }


    public Receipt(String receiptDescription, int residentID, float receiptAmount, int isExpense) {
        this.ReceiptDescription = receiptDescription;
        this.ResidentID = residentID;
        this.ReceiptAmount = receiptAmount;
        this.isExpense = isExpense;
    }

    public int getReceiptID() {
        return ReceiptID;
    }

    public void setReceiptID(int receiptID) {
        ReceiptID = receiptID;
    }

    public String getReceiptDescription() {
        return ReceiptDescription;
    }

    public void setReceiptDescription(String receiptDescription) {
        ReceiptDescription = receiptDescription;
    }

    public int getResidentID() {
        return ResidentID;
    }

    public void setResidentID(int residentID) {
        ResidentID = residentID;
    }

    public float getReceiptAmount() {
        return ReceiptAmount;
    }

    public void setReceiptAmount(float receiptAmount) {
        ReceiptAmount = receiptAmount;
    }

    public Date getReceiptTime() {
        return ReceiptTime;
    }

    public void setReceiptTime(Date receiptTime) {
        ReceiptTime = receiptTime;
    }

    public int getIsExpense() {
        return isExpense;
    }

    public void setIsExpense(int isExpense) {
        this.isExpense = isExpense;
    }

    public Object getByName(String attributeName) {
        return switch (attributeName) {
            case "ReceiptID" -> ReceiptID;
            case "ReceiptDescription" -> ReceiptDescription;
            case "ResidentID" -> ResidentID;
            case "ReceiptAmount" -> ReceiptAmount;
            case "ReceiptTime" -> ReceiptTime;
            case "isExpense" -> isExpense;

            default -> null;
        };
    }

    @Override
    public String toString() {
        return ReceiptID+", "+ReceiptDescription+ ", " +ResidentID+", "+ ReceiptAmount+", "+ ReceiptTime+ ", " + isExpense;
    }
}
