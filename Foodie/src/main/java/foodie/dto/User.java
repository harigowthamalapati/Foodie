package foodie.dto;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Data;
@Data
@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String first_name;
	private String last_name;
	@Column(unique = true)
	private String email;
	private String password;
	private String address;
	private long phone;
	private double wallet;
	@OneToMany(mappedBy = "user")
	private List<FoodItems> foodItems;
	public User() {
		super();
	}
	public User(String first_name, String last_name, String email, String password, String address, long phone,
			double wallet) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.password = password;
		this.address = address;
		this.phone = phone;
		this.wallet = wallet;
	}
	
	
	
	

}
