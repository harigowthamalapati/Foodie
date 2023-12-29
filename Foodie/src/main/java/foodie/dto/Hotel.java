package foodie.dto;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Data;
@Data
@Entity
public class Hotel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String hotel_Name;
	private String manager_Name;
	private long phone;
	@Column(unique = true)
	private String email;
	@Column(unique=true)
	private String password;
	
	@OneToMany(cascade = CascadeType.PERSIST, mappedBy = "hotel")
	private List<Food> food;
	public Hotel(String hotel_Name, String manager_Name, long phone, String email, String password) {
		super();
		this.hotel_Name = hotel_Name;
		this.manager_Name = manager_Name;
		this.phone = phone;
		this.email = email;
		this.password = password;
	}
	public Hotel() {
		super();
	}
	
	@Override
	public String toString() {
		return "Hotel {id=" + id + ", hotel_Name=" + hotel_Name + ", manager_Name=" + manager_Name + ", phone=" + phone
				+ ", email=" + email + ", password=" + password + ", food=" + (food!=null? "size="+food.size():"null") + "}";
	}
	public Hotel(int id, String hotel_Name, String manager_Name, long phone, String email, String password,
			List<Food> food) {
		super();
		this.id = id;
		this.hotel_Name = hotel_Name;
		this.manager_Name = manager_Name;
		this.phone = phone;
		this.email = email;
		this.password = password;
		this.food = food;
	}
	
	
	

}
