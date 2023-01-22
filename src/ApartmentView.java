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

    

}
