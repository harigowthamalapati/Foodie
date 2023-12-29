package foodie.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import foodie.dto.FoodItems;

public class FoodItemsCrud {
	EntityManager em = Persistence.createEntityManagerFactory("gowtham").createEntityManager();
	EntityTransaction et = em.getTransaction();
	public FoodItems save(FoodItems f){
		et.begin();
		em.persist(f);
		et.commit();
		return  f;	
	}
	public List<FoodItems> fetchAll(){
		Query query = em.createQuery("select a from FoodItems a");
		List res = query.getResultList();
			return res;
	}
	public void delete(int id) {
		FoodItems foodItem = em.find(FoodItems.class, id);
		et.begin();
		em.remove(foodItem);
		et.commit();
		
	}
	public void deleteAll() {
		et.begin();
		em.createQuery("delete from FoodItems ").executeUpdate();
		et.commit();
	}
	

}
