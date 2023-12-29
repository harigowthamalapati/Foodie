package foodie.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import foodie.dto.Food;
import foodie.dto.Hotel;

public class FoodCrud {
	EntityManager em = Persistence.createEntityManagerFactory("gowtham").createEntityManager();
	EntityTransaction et = em.getTransaction();

	public void save(Food food, int id) throws Exception {
		Hotel htl = em.find(Hotel.class, id);

		if (htl != null) {
			et.begin();
			food.setHotel(htl);
			htl.getFood().add(food);
			em.persist(htl);
			et.commit();
		}
	}

	public List<Food> fetchAll() {
		Query query = em.createQuery("select f from Food f");
		return query.getResultList();
	}

	public Food fetchById(int id) {
		Food food = em.find(Food.class, id);
		return food;
	}

	public Food updateById(int id, Food f) {
		Food food = em.find(Food.class, id);
		et.begin();
		food.setName(f.getName());
		food.setDescription(f.getDescription());
		food.setPrice(f.getPrice());
		food.setType(f.getType());
		food.setQuantity(f.getQuantity());
		em.merge(food);
		et.commit();
		return food;
	}

	public void delete(int id) {
		Food food = em.find(Food.class, id);
		if (food != null) {
			et.begin();
			food.setHotel(null);
			em.remove(food);
			et.commit();
		}
	}

	public List<Food> fetchAllByHotelId(int id) throws Exception {
		Hotel htl = em.find(Hotel.class, id);
		System.out.println(htl.getFood());
		return htl.getFood();
	}

	public List<Food> fetchByFoodName(String foodName) {
		Query query = em.createQuery("SELECT f FROM Food f WHERE f.name LIKE :foodName");
		query.setParameter("foodName", "%" + foodName + "%");
		return query.getResultList();
	}

}
