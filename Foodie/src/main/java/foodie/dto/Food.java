package foodie.dto;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.Data;
@Data
@Entity
public class Food {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String type;
	private String description;
	private double price;
	private String quantity;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn
	private Hotel hotel;
	
	public Food() {
		super();
	}

	public Food(String name, String type, String description, double price, String quantity, Hotel hotel) {
		super();
		this.name = name;
		this.type = type;
		this.description = description;
		this.price = price;
		this.quantity = quantity;
		this.hotel = hotel;
	}

	public Food(String name, String type, String description, double price, String quantity) {
		super();
		this.name = name;
		this.type = type;
		this.description = description;
		this.price = price;
		this.quantity = quantity;
	}

	public void addd() {
		// TODO Auto-generated method stub
		
	}

}
