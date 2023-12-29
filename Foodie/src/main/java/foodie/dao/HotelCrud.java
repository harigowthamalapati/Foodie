package foodie.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import foodie.dto.Food;
import foodie.dto.Hotel;


public class HotelCrud {
	EntityManager em = Persistence.createEntityManagerFactory("gowtham").createEntityManager();
	EntityTransaction et = em.getTransaction();
	public void save(Hotel hotel) throws Exception {
		et.begin();
		em.persist(hotel);
		et.commit();

	}
	public Hotel fetchByEmail(String email) throws Exception {
		Query query = em.createQuery("select h from Hotel h where h.email=?1");
		query.setParameter(1,email);
		return (Hotel)query.getSingleResult();	
	}
	public Hotel fetchByPassword(String pwd) {
		Query query = em.createQuery("select h from Hotel h where h.password=?1");
		query.setParameter(1,pwd);
		return (Hotel)query.getSingleResult();
	}
	public Hotel fetchByHotelName(String hotel_name){
		 Query query = em.createQuery("SELECT h FROM Hotel h WHERE h.hotelName LIKE :partialHotelName");
	        query.setParameter("partialHotelName", "%" + hotel_name + "%");
	        return (Hotel) query.getSingleResult();
	}
}
