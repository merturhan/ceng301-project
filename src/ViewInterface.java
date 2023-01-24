import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.*;
import java.util.*;

interface ViewInterface {
	public static final Scanner scanner = new Scanner(System.in); 

	public default String optionMenu(Integer choice)
	{
		String tableName = null;
		switch (choice) {
			case 1 -> {
				tableName = "Person";
				System.out.println("1. Show all " + tableName);
				System.out.println("2. Show "+ tableName);
				System.out.println("3. Add a "+ tableName);
				System.out.println("4. Update a "+ tableName);
				System.out.println("5. Delete a "+ tableName);
				System.out.println("6. Return to Table Menu ");
				System.out.println("7. Return to Main Menu ");
			}
			case 2 -> {
				tableName = "Manager";
				System.out.println("1. Show all " + tableName);
				System.out.println("2. Show "+ tableName);
				System.out.println("3. Update a "+ tableName);
				System.out.println("4. Return to Table Menu ");
				System.out.println("5. Return to Main Menu ");
			}
			case 3 -> {
				tableName = "AssistantManager";
				System.out.println("1. Show all " + tableName);
				System.out.println("2. Show "+ tableName);
				System.out.println("3. Update a "+ tableName);
				System.out.println("4. Return to Table Menu ");
				System.out.println("5. Return to Main Menu ");
			}
			case 4 -> {
				tableName = "Controller";
				System.out.println("1. Show all " + tableName);
				System.out.println("2. Show "+ tableName);
				System.out.println("3. Update a "+ tableName);
				System.out.println("4. Return to Table Menu ");
				System.out.println("5. Return to Main Menu ");
			}
			case 5 -> {
				tableName = "Resident";
				System.out.println("1. Show all " + tableName);
				System.out.println("2. Show "+ tableName);
				System.out.println("3. Update a "+ tableName);
				System.out.println("4. Return to Table Menu ");
				System.out.println("5. Return to Main Menu ");
			}
			case 6 -> tableName = "Apartment";
			case 7 -> tableName = "Receipt";
			case 8 -> tableName = "Payment";
			case 9 -> tableName = "Expense";
			case 10 -> tableName = "Decisions";
			case 11 -> tableName = "movedFlat";
			case 12 -> tableName = "Subscription";
			case 13 -> tableName = "Bill";
			case 14 -> tableName = "Message";
		}
		if (choice > 5 && choice <= 14)
		{
			System.out.println("1. Show all " + tableName);
			System.out.println("2. Show "+ tableName);
			System.out.println("3. Add a "+ tableName);
			System.out.println("4. Update a "+ tableName);
			System.out.println("5. Delete a "+ tableName);
			System.out.println("6. Return to Table Menu ");
			System.out.println("7. Return to Main Menu ");
		}
		return tableName;
	}

	public default String reportMenu(Integer choice)
	{
		String funcName = null;
		switch (choice) {
			case 1 -> funcName = "Expenses in period";
			case 2 -> funcName = "Moved Residents";
			case 3 -> funcName = "Unpaid Dues";
			case 4 -> funcName = "Average expenses in period";
			case 5 -> funcName = "Subscriptions in apartment";
		}
		return funcName;
	}

	public default void executeReport(String function) throws SQLException {
		Connection connection = DatabaseUtilities.getConnection();
		StringBuilder stringBuilder = new StringBuilder();
		if (function.equals("Expenses in period"))
		{
			String firstP = null, secP = null;
			System.out.println("Enter first date of period: ");
			firstP = scanner.nextLine();
			System.out.println("Enter second date of period: ");
			secP = scanner.nextLine();
			stringBuilder.append("select * from Expense e inner join Receipt r on e.ReceiptId = r.ReceiptID ");
			stringBuilder.append("where ReceiptTime between '").append(firstP).append("' and '").append(secP).append("'");

			PreparedStatement preparedStatement = connection.prepareStatement(stringBuilder.toString());
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next())
			{
				int expenseID = resultSet.getInt("ExpenseId");
				int receiptID =  resultSet.getInt("ReceiptId");
				int controllerID = resultSet.getInt("ControllerId");
				String receiptDesc = resultSet.getString("ReceiptDescription");
				int residentID =  resultSet.getInt("ResidentID");
				float receiptAmount =  resultSet.getFloat("ReceiptAmount");
				Date date =  resultSet.getDate("ReceiptTime");

				System.out.print(expenseID + "\t");
				System.out.print(receiptID + "\t");
				System.out.print(controllerID + "\t");
				System.out.print(receiptDesc + "\t");
				System.out.print(residentID + "\t");
				System.out.print(receiptAmount + "\t");
				System.out.println(date + "\t");

			}
			resultSet.close();
		}
	}
	public default Float getFloat(String prompt, boolean allowNulls) throws ParseException{
		Float inputValue;
		do {
			System.out.print(prompt);
			String input = scanner.nextLine();
			if (allowNulls && input.trim().equals("")) {
				return null;
			}
			if (!allowNulls && input.trim().equals("")) {
				inputValue = null;
			}
			else {
				try {
					inputValue = Float.parseFloat(input);
				}
				catch(Exception e) {
					inputValue = null;
				}
			}
		}
		while (inputValue == null);

		return inputValue;
	}
	public default Integer getInteger(String prompt, boolean allowNulls)  throws ParseException {
		Integer inputValue;
		do {
			System.out.print(prompt);		
			String input = scanner.nextLine();
			if (allowNulls && input.trim().equals("")) {
				return null;
			}			
			if (!allowNulls && input.trim().equals("")) {
				inputValue = null;
			}			
			else {
				try {
					inputValue = Integer.parseInt(input);
				}
				catch(Exception e) {
					inputValue = null;
				}
			}
		}
		while (inputValue == null);
		
		return inputValue;
	}

	public default Double getDouble(String prompt, boolean allowNulls)  throws ParseException {
		Double inputValue;
		do {
			System.out.print(prompt);		
			String input = scanner.nextLine();
			if (allowNulls && input.trim().equals("")) {
				return null;
			}			
			if (!allowNulls && input.trim().equals("")) {
				inputValue = null;
			}			
			else {
				try {
					inputValue = Double.parseDouble(input);
				}
				catch(Exception e) {
					inputValue = null;
				}
			}
		}
		while (inputValue == null);
		
		return inputValue;
	}

	public default Boolean getBoolean(String prompt, boolean allowNulls)  throws ParseException {
		Boolean inputValue;
		do {
			System.out.print(prompt);		
			String input = scanner.nextLine();
			if (allowNulls && input.trim().equals("")) {
				return null;
			}			
			if (!allowNulls && input.trim().equals("")) {
				inputValue = null;
			}
			else {
				try {
					inputValue = Boolean.parseBoolean(input);
				}
				catch(Exception e) {
					inputValue = null;
				}
			}
		}
		while (inputValue == null);
		
		return inputValue;
	}

	public default StringBuilder getDate(String prompt, boolean allowNulls) throws ParseException {
		StringBuilder inputValue = new StringBuilder();
		inputValue.append("CAST((' ");
		do {
			System.out.print(prompt);
			String input = scanner.nextLine();
			if (allowNulls && input.trim().equals("")) {
				return null;
			}
			if (!allowNulls && input.trim().equals("")) {
				inputValue = null;
			}
			else {
				try {
					inputValue.append(input);
					inputValue.append(" ') AS DATE)");
				}
				catch(Exception e) {
					inputValue = null;
				}
			}
		}
		while (inputValue == null);
		//System.out.println(inputValue);
		return inputValue;
	}
		
	public default String getString(String prompt, boolean allowNulls)  throws ParseException {
		String inputValue;
		do {
			System.out.print(prompt);		
			inputValue = scanner.nextLine();
			if (allowNulls && inputValue.trim().equals("")) {
				return null;
			}			
			if (!allowNulls && inputValue.trim().equals("")) {
				inputValue = null;
			}
		}
		while (inputValue == null);		
		
		return inputValue;
	}
	
	abstract ViewData create(ModelData modelData, String functionName, String operationName) throws Exception;
	
}
