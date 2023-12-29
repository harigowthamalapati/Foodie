package foodie.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;
@Data
@Entity
public class FoodItems {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String type;
	private String description;
	private double price;
	private String quantity;
	@ManyToOne
	@JoinColumn
	private User user;
	
	public FoodItems() {
		super();
	}
	public FoodItems(String name, String type, String description, double price, String quantity) {
		super();
		this.name = name;
		this.type = type;
		this.description = description;
		this.price = price;
		this.quantity = quantity;
	}

	
	
}
