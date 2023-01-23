import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
public class ReceiptModel implements ModelInterface {
    private Scanner scan = new Scanner(System.in);
    @Override
    public ResultSet select(Map<String, Object> whereParameters) throws Exception {
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT ");
        sql.append("	* ");
        sql.append(" FROM dbo.Receipt ");

        List<Map.Entry<String, Object>> whereParameterList = DatabaseUtilities.createWhereParameterList(whereParameters);
        sql.append(DatabaseUtilities.prepareWhereStatement(whereParameterList));

        sql.append("ORDER BY ReceiptID");

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
        sql.append(" INSERT INTO dbo.Receipt (").append(fieldNames).append(") ");
        sql.append(" VALUES ");

        String[] fieldList = fieldNames.split(",");

        //for(String s:fieldList) System.out.println(s);
        int flag = 0;
        int rowCount = 0;
        for (int i=0; i<rows.size(); i++) {
            if (rows.get(i) instanceof Receipt receipt) {
                rowCount++;

                sql.append("(");
                for (int j=0; j<fieldList.length; j++) {
                    String fieldName = fieldList[j].trim();
                    sql.append(DatabaseUtilities.formatField(receipt.getByName(fieldName)));
                    if (j < fieldList.length - 1) {
                        sql.append(", ");
                    }
                }
                sql.append(")");
                flag = receipt.getIsExpense();
                if (i < rows.size() - 1) {
                    sql.append(", ");
                }
            }
        }
        if (rowCount > 0) {
            Connection connection = DatabaseUtilities.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());
            rowCount = preparedStatement.executeUpdate();
            preparedStatement.close();
        }
        if(flag == 1){

            System.out.println("Is expense or payment? (e,p)");
            String choice = scan.nextLine();
            if(choice.equals("e")){
                System.out.println("girdi");
                sql2.append("INSERT INTO Expense ");
                sql2.append("(ReceiptId, ControllerId) ");
                sql2.append("VALUES('8','8')");
                //sql2.append("SELECT ReceiptId, " );
                //sql2.append("ControllerId ");
                //sql2.append("FROM Receipt ");



            }
            else if(choice.equals("p")){
                sql2.append("INSERT INTO Payment ");
                sql2.append("(ResidentId, ReceiptId) ");
                sql2.append("SELECT ResidentId, ReceiptId ");
                sql2.append("FROM Receipt ");

            }
            else{
                System.out.println("Unrecognized answer.");
            }

        }


        return rowCount;
    }

    @Override
    public int update(Map<String, Object> updateParameters, Map<String, Object> whereParameters) throws Exception {
        // construct SQL statement
        StringBuilder sql = new StringBuilder();
        sql.append(" UPDATE dbo.Receipt SET ");
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
        sql.append(" DELETE FROM dbo.Receipt ");

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
        return "ReceiptModel";
    }
}
