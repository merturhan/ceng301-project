import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


class DepartmentView implements ViewInterface {

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
				int departmentID = resultSet.getInt("DepartmentID");
				String name = resultSet.getString("Name");
				String groupName = resultSet.getString("GroupName");
				Date modifiedDate = resultSet.getDate("ModifiedDate");
				
				// Display values
				System.out.print(departmentID + "\t");
				System.out.print(name + "\t");
				System.out.print(groupName + "\t");
				System.out.println(modifiedDate);
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
		Integer departmentID = getInteger("Department ID : ", true);
		String name = getString("Name : ", true);
		String groupName = getString("Group Name : ", true);
		
		Map<String, Object> whereParameters = new HashMap<>();
		if (departmentID != null) whereParameters.put("DepartmentID", departmentID);
		if (name != null) whereParameters.put("Name", name);
		if (groupName != null) whereParameters.put("GroupName", groupName);
		
		return whereParameters;
	}
	
	ViewData selectGUI(ModelData modelData) throws Exception {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("whereParameters", getWhereParameters());
		
		return new ViewData("Department", "select", parameters);
	}

	ViewData insertGUI(ModelData modelData) throws Exception {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("fieldNames", "Name, GroupName");

		List<Object> rows = new ArrayList<>();
		
		String name, groupName;
		do
		{
			System.out.println("Fields to insert:");
			name = getString("Name : ", true);
			groupName = getString("Group Name : ", true);
			System.out.println();
					
			if (name != null && groupName != null) {
				rows.add(new Department(name, groupName));
			}
		}
		while (name != null && groupName != null);
		
		parameters.put("rows", rows);
		
		return new ViewData("Department", "insert", parameters);
	}

	ViewData updateGUI(ModelData modelData) throws Exception {
		System.out.println("Fields to update:");
		String name = getString("Name : ", true);
		String groupName = getString("Group Name : ", true);
		System.out.println();
		
		Map<String, Object> updateParameters = new HashMap<>();
		if (name != null) updateParameters.put("Name", name);
		if (groupName != null) updateParameters.put("GroupName", groupName);
		
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("updateParameters", updateParameters);
		parameters.put("whereParameters", getWhereParameters());
		
		return new ViewData("Department", "update", parameters);
	}

	ViewData deleteGUI(ModelData modelData) throws Exception {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("whereParameters", getWhereParameters());
		
		return new ViewData("Department", "delete", parameters);
	}

	@Override
	public String toString() {
		return "Department View";
	}		
}
