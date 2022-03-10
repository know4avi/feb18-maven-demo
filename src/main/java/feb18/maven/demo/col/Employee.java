package feb18.maven.demo.col;

public class Employee implements Comparable<Employee> {

	private int eid;
	private String firstName;
	private double salary;

	public Employee() {
		super();
	}

	public Employee(int eid, String firstName, double salary) {
		super();
		this.eid = eid;
		this.firstName = firstName;
		this.salary = salary;
	}

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	@Override
	public String toString() {
		return "Employee [eid=" + eid + ", firstName=" + firstName + ", salary=" + salary + "]";
	}
	

	@Override
	public int compareTo(Employee obj) {
		
//		@SuppressWarnings("deprecation")
//		Double d1 = new Double(this.salary+"");
//		@SuppressWarnings("deprecation")
//		Double d2 = new Double(obj.salary+"");
		
		
		//return this.eid - obj.eid;
		//return this.firstName.compareTo(obj.firstName);
		return Double.valueOf(this.salary).compareTo(Double.valueOf(obj.salary));
	}

}