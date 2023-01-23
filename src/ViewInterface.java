import java.sql.Connection;
import java.sql.SQLException;
import java.text.*;
import java.util.*;

interface ViewInterface {
	public static final Scanner scanner = new Scanner(System.in); 

	public default String optionMenu(Integer choice)
	{
		String tableName = null;
		switch (choice) {
			case 1 -> tableName = "Person";
			case 2 -> tableName = "Manager";
			case 3 -> tableName = "AssistantManager";
			case 4 -> tableName = "Controller";
			case 5 -> tableName = "Resident";
			case 6 -> tableName = "Apartment";
			case 7 -> tableName = "Receipt";
			case 8 -> tableName = "Payment";
			case 9 -> tableName = "Expense";
			case 10 -> tableName = "Decisions";
		}
		System.out.println("1. Show all " + tableName);
		System.out.println("2. Show "+ tableName);
		System.out.println("3. Add a "+ tableName);
		System.out.println("4. Update a "+ tableName);
		System.out.println("5. Delete a "+ tableName);
		System.out.println("6. Return to Table Menu ");
		System.out.println("7. Return to Main Menu ");
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
		if (function.equals("Expenses in Period"))
		{
			stringBuilder.append("");
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
