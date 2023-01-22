public class Apartment {

    private int apartmentID;
    private String apartmentName;
    private String street;
    private String city;
    private String state;
    private int zip_code;

    Apartment(){}

    public Apartment(int apartmentID, String apartmentName, String street, String city, String state, int zip_code) {
        this.apartmentID = apartmentID;
        this.apartmentName = apartmentName;
        this.street = street;
        this.city = city;
        this.state = state;
        this.zip_code = zip_code;
    }

    public int getApartmentID() {
        return apartmentID;
    }

    public void setApartmentID(int apartmentID) {
        this.apartmentID = apartmentID;
    }

    public String getApartmentName() {
        return apartmentName;
    }

    public void setApartmentName(String apartmentName) {
        this.apartmentName = apartmentName;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getZip_code() {
        return zip_code;
    }

    public void setZip_code(int zip_code) {
        this.zip_code = zip_code;
    }

    public Object getByName (String attributeName){
        return switch (attributeName){
            case "apartmentID" -> apartmentID;
            case "apartmentName" -> apartmentName;
            case "street" -> street;
            case "city" -> city;
            case "state" -> state;
            case "zip_code" -> zip_code;
            default -> null;
        };
    }
    @Override
    public String toString() {
        return "Apartment{" +
                "apartmentID=" + apartmentID +
                ", apartmentName='" + apartmentName + '\'' +
                ", street='" + street + '\'' +
                ", city='" + city + '\'' +
                ", state='" + state + '\'' +
                ", zip_code=" + zip_code +
                '}';
    }
}
