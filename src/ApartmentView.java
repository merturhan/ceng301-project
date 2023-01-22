import java.sql.ResultSet;
import java.util.*;

public class ApartmentView implements  ViewInterface{

    @Override
    public ViewData create(ModelData modelData, String functionName, String operationName) throws Exception {
        return switch (operationName) {
            case "select" -> selectOperation(modelData);
            case "insert" -> insertOperation(modelData);
            case "update" -> updateOperation(modelData);
            case "delete" -> deleteOperation(modelData);
            case "select.gui" -> selectGUI(modelData);
            case "insert.gui" -> insertGUI(modelData);
            case "update.gui" -> updateGUI(modelData);
            case "delete.gui" -> deleteGUI(modelData);
            default -> new ViewData("MainMenu", "");
        };
    }

    ViewData selectOperation(ModelData modelData) throws Exception {
        ResultSet resultSet = modelData.resultSet;

        if (resultSet != null) {
            while (resultSet.next()) {
                // Retrieve by column name
                Integer apartmentID = resultSet.getInt("apartmentID");
                String apartmentName = resultSet.getString("apartmentName");
                String street = resultSet.getString("street");
                String city = resultSet.getString("city");
                String state = resultSet.getString("state");
                Integer zip_code = resultSet.getInt("zip_code");

                // Display values
                System.out.print(apartmentID + "\t");
                System.out.print(apartmentName + "\t");
                System.out.print(street + "\t");
                System.out.println(city + "\t");
                System.out.println(state + "\t");
                System.out.println(zip_code + "\t");
            }
            resultSet.close();
        }

        return new ViewData("MainMenu", "");
    }

    ViewData insertOperation(ModelData modelData) throws Exception {
        System.out.println("Number of inserted rows is " + modelData.recordCount);

        return new ViewData("MainMenu", "");
    }

    ViewData updateOperation(ModelData modelData) throws Exception {
        System.out.println("Number of updated rows is " + modelData.recordCount);

        return new ViewData("MainMenu", "");
    }

    ViewData deleteOperation(ModelData modelData) throws Exception {
        System.out.println("Number of deleted rows is " + modelData.recordCount);

        return new ViewData("MainMenu", "");
    }

    Map<String, Object> getWhereParameters() throws Exception {
        System.out.println("Filter conditions:");
        Integer apartmentID = getInteger("Apartment ID : ", true);
        String apartmentName = getString("Apartment Name : ", true);
        String street = getString("Street : ", true);
        String city = getString("City : ", true);
        String state = getString("State : ", true);
        Integer zip_code = getInteger("Zip Code : ", true);


        Map<String, Object> whereParameters = new HashMap<>();
        if (apartmentID != null) whereParameters.put("apartmentID", apartmentID);
        if (apartmentName != null) whereParameters.put("apartmentName", apartmentName);
        if (street != null) whereParameters.put("street", street);
        if (city != null) whereParameters.put("city", city);
        if (state != null) whereParameters.put("state", state);
        if (zip_code != null) whereParameters.put("zip_code", zip_code);
        return whereParameters;
    }
    ViewData selectGUI(ModelData modelData) throws Exception {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("whereParameters", getWhereParameters());

        return new ViewData("Apartment", "select", parameters);
    }




}
