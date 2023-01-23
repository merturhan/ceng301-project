import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class PersonModel implements ModelInterface {
    private Scanner scan = new Scanner(System.in);
    @Override
    public ResultSet select(Map<String, Object> whereParameters) throws Exception {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT ");
        sql.append("	* ");
        sql.append(" FROM dbo.Person ");

        List<Map.Entry<String, Object>> whereParameterList = DatabaseUtilities.createWhereParameterList(whereParameters);
        sql.append(DatabaseUtilities.prepareWhereStatement(whereParameterList));

        sql.append("ORDER BY personID");
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
        StringBuilder sql2 = new StringBuilder();


        sql.append(" INSERT INTO dbo.Person (").append(fieldNames).append(") ");
        sql.append(" VALUES ");

        String[] fieldList = fieldNames.split(",");

        //for(String s:fieldList) System.out.println(s);
        int rowCount = 0;
        int flag = 0;
        for (int i=0; i<rows.size(); i++) {
            if (rows.get(i) instanceof Person person) {
                rowCount++;

                sql.append("(");
                for (int j=0; j<fieldList.length; j++) {
                    String fieldName = fieldList[j].trim();
                    sql.append(DatabaseUtilities.formatField(person.getByName(fieldName)));
                    if (j < fieldList.length - 1) {
                        sql.append(", ");
                    }
                }
                sql.append(")");
                flag = person.getPersonStatus();

                if (i < rows.size() - 1) {
                    sql.append(", ");
                }
            }
        }

        // execute constructed SQL statement
        if (rowCount > 0) {
            Connection connection = DatabaseUtilities.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());
            rowCount = preparedStatement.executeUpdate();
            preparedStatement.close();
        }

        if (flag == 1)
        {
            System.out.println("Is resident? (y,n)");
            String choice = scan.nextLine();
            if (choice.equals("y"))
            {
                //resident
                System.out.println("Enter phone number: ");
                String residentPhoneNum = scan.nextLine();
                System.out.println("Enter flat ID: ");
                int flatID = scan.nextInt();
                System.out.println("Is monthly due paid: ");
                int paidFlag = scan.nextInt();

                sql2.append("INSERT INTO Resident ");
                sql2.append("(personID,apartmentID,residentName,residentPhoneNum,flatId,paidFlag) ");
                sql2.append("SELECT t1.personID, ");
                sql2.append("t1.apartmentID, ");
                sql2.append("t1.personName, ");
                sql2.append("'"+residentPhoneNum+"',"+flatID+","+paidFlag+" ");
                sql2.append("FROM Person t1 ");
                sql2.append("WHERE NOT EXISTS(SELECT personID ");
                sql2.append("FROM Resident t2 ");
                sql2.append("WHERE t2.personID = t1.personID) ");

                sql2.append("   ");

                sql2.append("INSERT INTO Manager ");
                sql2.append("(personID,apartmentID,residentID,managerName) ");
                sql2.append("SELECT t1.personID, ");
                sql2.append("t1.apartmentID, ");
                sql2.append("r.residentID, ");
                sql2.append("t1.personName ");
                sql2.append("FROM Person t1,Resident r ");
                sql2.append("WHERE NOT EXISTS(SELECT personID ");
                sql2.append("FROM Resident t2 ");
                sql2.append("WHERE t2.personID = t1.personID) ");





            }
            else if (choice.equals("n"))
            {
                sql2.append("INSERT INTO Manager ");
                sql2.append("(personID,apartmentID,managerName) ");
                sql2.append("SELECT t1.personID, ");
                sql2.append("t1.apartmentID, ");
                sql2.append("t1.personName ");
                sql2.append("FROM Person t1 ");
                sql2.append("WHERE NOT EXISTS(SELECT personID ");
                sql2.append("FROM Resident t2 ");
                sql2.append("WHERE t2.personID = t1.personID) ");
            }
            else System.out.println("Unrecognized answer.");

        }
        else if(flag == 2)
        {
            System.out.println("Is resident? (y,n)");
            String choice = scan.nextLine();
            if (choice.equals("y"))
            {
                //resident
                System.out.println("Enter phone number: ");
                String residentPhoneNum = scan.nextLine();
                System.out.println("Enter flat ID: ");
                int flatID = scan.nextInt();
                System.out.println("Is monthly due paid: ");
                int paidFlag = scan.nextInt();

                sql2.append("INSERT INTO AssistantManager ");
                sql2.append("(personID,apartmentID,residentName,residentPhoneNum,flatId,paidFlag) ");
                sql2.append("SELECT t1.personID, ");
                sql2.append("t1.apartmentID, ");
                sql2.append("t1.personName, ");
                sql2.append("'"+residentPhoneNum+"',"+flatID+","+paidFlag+" ");
                sql2.append("FROM Person t1 ");
                sql2.append("WHERE NOT EXISTS(SELECT personID ");
                sql2.append("FROM Resident t2 ");
                sql2.append("WHERE t2.personID = t1.personID) ");


            }
            else if (choice.equals("n"))
            {
                sql2.append("INSERT INTO Manager ");
                sql2.append("(personID,apartmentID,managerName) ");
                sql2.append("SELECT t1.personID, ");
                sql2.append("t1.apartmentID, ");
                sql2.append("t1.personName ");
                sql2.append("FROM Person t1 ");
                sql2.append("WHERE NOT EXISTS(SELECT personID ");
                sql2.append("FROM Resident t2 ");
                sql2.append("WHERE t2.personID = t1.personID) ");
            }
            else System.out.println("Unrecognized answer.");
        }
        else if(flag == 3)
        {

        }
        else if(flag == 4)
        {
            System.out.println("Enter phone number: ");
            String residentPhoneNum = scan.nextLine();
            System.out.println("Enter flat ID: ");
            int flatID = scan.nextInt();
            System.out.println("Is monthly due paid: ");
            int paidFlag = scan.nextInt();

            sql2.append("INSERT INTO Resident ");
            sql2.append("(personID,apartmentID,residentName,residentPhoneNum,flatId,paidFlag) ");
            sql2.append("SELECT t1.personID, ");
            sql2.append("t1.apartmentID, ");
            sql2.append("t1.personName, ");
            sql2.append("'"+residentPhoneNum+"',"+flatID+","+paidFlag+" ");
            sql2.append("FROM Person t1 ");
            sql2.append("WHERE NOT EXISTS(SELECT personID ");
            sql2.append("FROM Resident t2 ");
            sql2.append("WHERE t2.personID = t1.personID) ");
        }

        Connection connection = DatabaseUtilities.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql2.toString());
        preparedStatement.execute();

        System.out.println(sql2);




        return rowCount;
    }

    public void insertIntoManager(Connection connection)
    {
        StringBuilder insertManager = new StringBuilder();
        insertManager.append("insert into Manager values(");
        String SELECT_LAST_PERSON = "SELECT TOP 1 * FROM Person ORDER BY personID DESC";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_LAST_PERSON);
            int personID = 0;
            String managerName = null;
            int apartmentID = 0;
            while (resultSet.next()) {
                personID = resultSet.getInt("personID");
                apartmentID = resultSet.getInt("apartmentID");
                managerName = resultSet.getString("personName");
            }

            insertManager.append(personID).append(",").append(apartmentID).append(",");

            System.out.println("Is resident? (y,n)");
            String choice = scan.nextLine();
            if (choice.equals("y"))
            {
                //resident
                insertIntoResident(connection);
                String SELECT_LAST_RESIDENT = "SELECT TOP 1 * FROM Resident ORDER BY residentID DESC";
                ResultSet resultSet1 = statement.executeQuery(SELECT_LAST_RESIDENT);
                int residentID = 0;
                while (resultSet1.next()) {
                     residentID = resultSet1.getInt("residentID");
                }
                insertManager.append(residentID).append(",");
            }
            else insertManager.append(0);
            insertManager.append(managerName).append(")");
            System.out.println(insertManager);
            PreparedStatement psInsertManager = connection.prepareStatement(insertManager.toString());
            psInsertManager.execute();



        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void insertIntoResident(Connection connection)
    {
        StringBuilder insertResident = new StringBuilder();
        insertResident.append("insert into Resident values(");
        try {

            Statement statement = connection.createStatement();
            String SELECT_LAST_PERSON = "SELECT TOP 1 * FROM Person ORDER BY personID DESC";
            ResultSet resultSet = statement.executeQuery(SELECT_LAST_PERSON);
            int personID = 0,apartmentID = 0;
            String residentName = null;

            while (resultSet.next()) {
                personID = resultSet.getInt("personID");
                apartmentID = resultSet.getInt("apartmentID");
                residentName = resultSet.getString("personName");
            }

            insertResident.append(personID).append(",").append(apartmentID).append(",").append("'").append(residentName).append("'").append(",");
            System.out.println("Enter resident phone: ");
            String residentPhone = scan.nextLine();
            insertResident.append(residentPhone).append(",");
            System.out.println("Is due paid: (1 or 0)");
            int paidFlag = scan.nextInt();
            insertResident.append(paidFlag).append(",");
            System.out.println("Enter flat ID: ");
            int flatID = scan.nextInt();
            insertResident.append(flatID).append(",");
            System.out.println("Enter entrance date to the flat : ");
            Date date = Date.valueOf(scan.nextLine());
            insertResident.append(date).append(")");

            System.out.println(insertResident);
            PreparedStatement psInsertResident = connection.prepareStatement(insertResident.toString());
            psInsertResident.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public int update(Map<String, Object> updateParameters, Map<String, Object> whereParameters) throws Exception {
        // construct SQL statement
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE dbo.Person SET ");
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
        sql.append(" DELETE FROM dbo.Person ");

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
    public String toString() {
        return "PersonModel";
    }
}
