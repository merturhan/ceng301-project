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
                Integer personID = resultSet.getInt("personID");
                Integer apartmentID = resultSet.getInt("apartmentID");
                String personName = resultSet.getString("personName");
                Integer personStatus = resultSet.getInt("personStatus");

                // Display values
                System.out.print(personID + "\t");
                System.out.print(apartmentID + "\t");
                System.out.print(personName + "\t");
                System.out.println(personStatus);
            }
            resultSet.close();
        }

        return new ViewData("MainMenu", "");
    }

}
