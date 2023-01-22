import java.util.Date;

public class Decisions {
    private int DecisionID;
    private int ApartmentID;
    private String DecisionDescription;
    private int VoteYes;
    private int VoteNo;
    private Date DecisionDate;
    private String isAccepted;
    Decisions(){}

    public Decisions(int apartmentID, String decisionDescription, int voteYes, int voteNo, Date decisionDate, String isAccepted) {
        ApartmentID = apartmentID;
        DecisionDescription = decisionDescription;
        VoteYes = voteYes;
        VoteNo = voteNo;
        DecisionDate = decisionDate;
        this.isAccepted = isAccepted;
    }

    public int getDecisionID() {
        return DecisionID;
    }

    public void setDecisionID(int decisionID) {
        DecisionID = decisionID;
    }

    public int getApartmentID() {
        return ApartmentID;
    }

    public void setApartmentID(int apartmentID) {
        ApartmentID = apartmentID;
    }

    public String getDecisionDescription() {
        return DecisionDescription;
    }

    public void setDecisionDescription(String decisionDescription) {
        DecisionDescription = decisionDescription;
    }

    public int getVoteYes() {
        return VoteYes;
    }

    public void setVoteYes(int voteYes) {
        VoteYes = voteYes;
    }

    public int getVoteNo() {
        return VoteNo;
    }

    public void setVoteNo(int voteNo) {
        VoteNo = voteNo;
    }

    public String getIsAccepted() {
        return isAccepted;
    }

    public void setIsAccepted(String isAccepted) {
        this.isAccepted = isAccepted;
    }

    public Date getDecisionDate() {
        return DecisionDate;
    }

    public void setDecisionDate(Date decisionDate) {
        DecisionDate = decisionDate;
    }

    public Object getByName (String attributeName){
        return switch (attributeName){
            case "DecisionID" -> DecisionID;
            case "ApartmentID" -> ApartmentID;
            case "DecisionDescription" -> DecisionDescription;
            case "VoteYes" -> VoteYes;
            case "VoteNo" -> VoteNo;
            case "DecisionDate" -> DecisionDate;
            case "isAccepted" -> isAccepted;
            default -> null;
        };
    }
}
