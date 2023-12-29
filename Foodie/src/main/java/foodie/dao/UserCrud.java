package foodie.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import foodie.dto.Hotel;
import foodie.dto.User;

public class UserCrud {
	EntityManager em = Persistence.createEntityManagerFactory("gowtham").createEntityManager();
	EntityTransaction et = em.getTransaction();
	public void save(User user) throws Exception {
		et.begin();
		em.persist(user);
		et.commit();
	}
	public User fetchByEmail(String email) throws Exception {
		Query query = em.createQuery("select u  from User u where u.email=?1");
		query.setParameter(1, email);
		User user = (User) query.getSingleResult();
		if (user != null) {
			return user;
		}
		return null;

	}

	public double fetchWallet(int id) {
		User user = em.find(User.class, id);

		return user.getWallet();

	}

	public void updateWallet(int id, double balence) {
		User user = em.find(User.class, id);
		et.begin();
		user.setWallet(balence);
		et.commit();

	}

	public double fetchWalletByPassword(String pwd) throws Exception{
		Query query = em.createQuery("select u from User u where u.password=?1");
		query.setParameter(1, pwd);
		User res = (User) query.getSingleResult();
		if (res != null)
			return res.getWallet();
		return 0.0;
	}
	public void updateWalletByPassword(String password,double bal) {
		Query query = em.createQuery("select u from User u where u.password=?1");
		query.setParameter(1, password);
		User res = (User) query.getSingleResult();
		et.begin();
		res.setWallet(bal);
		et.commit();
	}

}
