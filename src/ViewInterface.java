import java.text.*;
import java.util.*;

interface ViewInterface {
	public static final Scanner scanner = new Scanner(System.in); 

	public default String optionMenu(Integer choice)
	{
		StringBuilder stringBuilder = new StringBuilder();
		String tableName = null;
		switch (choice) {
			case 1 -> tableName = "Person";
			case 2 -> tableName = "Manager";
			case 3 -> tableName = "AsistantManager";
			case 4 -> tableName = "Controller";
			case 5 -> tableName = "Resident";
			case 6 -> tableName = "Apartment";
			case 7 -> tableName = "Receipt";
			case 8 -> tableName = "Payment";
			case 9 -> tableName = "Expense";
			case 10 -> tableName = "Decision";
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

	public default Date getDate(String prompt, boolean allowNulls) throws ParseException {
		Date inputValue;
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
				    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				    inputValue = formatter.parse(input);	
				}
				catch(Exception e) {
					inputValue = null;
				}
			}
		}
		while (inputValue == null);		
		
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