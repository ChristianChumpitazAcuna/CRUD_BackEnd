package pe.edu.vallegrande.app.model;

public class Teacher {
	private Integer id;
	private String name;
	private String last_name;
	private String document_type;
	private String document_number;
	private String adress;
	private String district;
	private String birthdate;
	private String cell_phone;
	private String email;
	private String status;

	public Teacher() {
	}

	public Teacher(Integer id, String name, String last_name, String document_type, String document_number,
			String adress, String district, String birthdate, String cell_phone, String email, String status) {
		super();
		this.id = id;
		this.name = name;
		this.last_name = last_name;
		this.document_type = document_type;
		this.document_number = document_number;
		this.adress = adress;
		this.district = district;
		this.birthdate = birthdate;
		this.cell_phone = cell_phone;
		this.email = email;
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getDocument_type() {
		return document_type;
	}

	public void setDocument_type(String document_type) {
		this.document_type = document_type;
	}

	public String getDocument_number() {
		return document_number;
	}

	public void setDocument_number(String document_number) {
		this.document_number = document_number;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getCell_phone() {
		return cell_phone;
	}

	public void setCell_phone(String cell_phone) {
		this.cell_phone = cell_phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		String data = "[id: "+ this.id;
		data+= ", name: " + this.name; 
		data+= ", last_name: " + this.last_name; 
		data+= ", document_type: " + this.document_type; 
		data+= ", document_number: " + this.document_number; 
		data+= ", adress: " + this.adress; 
		data+= ", district: " + this.district; 
		data+= ", birthdate: " + this.birthdate; 
		data+= ", cell_phone: " + this.cell_phone; 
		data+= ", email: " + this.email; 
		data+= ", status: " + this.status + "]"; 
		return data;
	}

}
