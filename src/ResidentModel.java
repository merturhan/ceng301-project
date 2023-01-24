import java.sql.*;
import java.util.List;
import java.util.Map;

public class ResidentModel implements ModelInterface{
    @Override
    public ResultSet select(Map<String, Object> whereParameters) throws Exception {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT ");
        sql.append("	* ");
        sql.append(" FROM dbo.Resident ");

        List<Map.Entry<String, Object>> whereParameterList = DatabaseUtilities.createWhereParameterList(whereParameters);
        sql.append(DatabaseUtilities.prepareWhereStatement(whereParameterList));

        sql.append("ORDER BY residentID");
        //System.out.println(sql.toString() + "\n");


        // execute constructed SQL statement
        Connection connection = DatabaseUtilities.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());
        DatabaseUtilities.setWhereStatementParameters(preparedStatement, whereParameterList);

        return preparedStatement.executeQuery();
    }

    @Override
    public int insert(String fieldNames, List<Object> rows) throws Exception {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO dbo.Resident (").append(fieldNames).append(") ");
        sql.append(" VALUES ");

        String[] fieldList = fieldNames.split(",");

        //for(String s:fieldList) System.out.println(s);

        int rowCount = 0;
        int aptID = 0;
        for (int i=0; i<rows.size(); i++) {
            if (rows.get(i) instanceof Resident resident) {
                rowCount++;

                sql.append("(");
                for (int j=0; j<fieldList.length; j++) {
                    String fieldName = fieldList[j].trim();
                    sql.append(DatabaseUtilities.formatField(resident.getByName(fieldName)));
                    if (j < fieldList.length - 1) {
                        sql.append(", ");
                    }
                }
                sql.append(")");
                aptID = resident.getApartmentID();
                if (i < rows.size() - 1) {
                    sql.append(", ");
                }
            }
        }
        //System.out.println(sql.toString());
        System.out.println(aptID);

        // execute constructed SQL statement
        if (rowCount > 0) {
            Connection connection = DatabaseUtilities.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());
            rowCount = preparedStatement.executeUpdate();
            preparedStatement.close();
        }

        return rowCount;
    }

    @Override
    public int update(Map<String, Object> updateParameters, Map<String, Object> whereParameters) throws Exception {
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE dbo.Resident SET ");
        int appendCount = 0;
        for (Map.Entry<String, Object> entry : updateParameters.entrySet()) {
            sql.append(entry.getKey()).append(" = ").append(DatabaseUtilities.formatField(entry.getValue()));
            if (++appendCount < updateParameters.size()) {
                sql.append(", ");
            }
        }
        List<Map.Entry<String, Object>> whereParameterList = DatabaseUtilities.createWhereParameterList(whereParameters);
        sql.append(DatabaseUtilities.prepareWhereStatement(whereParameterList));
        //System.out.println(sql.toString());


        // execute constructed SQL statement
        Connection connection = DatabaseUtilities.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());
        DatabaseUtilities.setWhereStatementParameters(preparedStatement, whereParameterList);
        int rowCount = preparedStatement.executeUpdate();
        preparedStatement.close();

        return rowCount;
    }

    @Override
    public int delete(Map<String, Object> whereParameters) throws Exception {
        // construct SQL statement
        StringBuilder sql = new StringBuilder();
        sql.append(" DELETE FROM dbo.Resident ");

        List<Map.Entry<String, Object>> whereParameterList = DatabaseUtilities.createWhereParameterList(whereParameters);
        sql.append(DatabaseUtilities.prepareWhereStatement(whereParameterList));
        //System.out.println(sql.toString());


        // execute constructed SQL statement
        Connection connection = DatabaseUtilities.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());
        DatabaseUtilities.setWhereStatementParameters(preparedStatement, whereParameterList);
        int rowCount = preparedStatement.executeUpdate();
        preparedStatement.close();

        return rowCount;
    }

    public static int getResidentCounter(int ApartmentID) throws SQLException {

        int residentCount = 0;

        String host = "DESKTOP-M8BB118\\SQLEXPRESS:49670";
        String databaseName = "BuildingSiteManagement";

        String conUrl =   "jdbc:sqlserver://" + host + ";"
                + "DatabaseName=" + databaseName + ";"
                + ";encrypt=true;trustServerCertificate=true;integratedSecurity=true;";


        String query = "SELECT COUNT(*) AS residentCount\nFROM Person\nWHERE apartmentID = " + ApartmentID;
        try {

            Connection conn = DriverManager.getConnection(conUrl);
            Statement stmt = conn.createStatement();
            ResultSet rs;

            rs = stmt.executeQuery(query);
            while ( rs.next() ) {
                residentCount = rs.getInt("residentCount");
            }
            conn.close();
        } catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
        }

        return residentCount;
    }
}
