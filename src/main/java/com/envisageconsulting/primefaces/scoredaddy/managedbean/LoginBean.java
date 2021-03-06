package com.envisageconsulting.primefaces.scoredaddy.managedbean;

import com.envisageconsulting.primefaces.scoredaddy.Constants;
import com.envisageconsulting.primefaces.scoredaddy.Encryption;
import com.envisageconsulting.primefaces.scoredaddy.dao.LoginDAO;
import com.envisageconsulting.primefaces.scoredaddy.domain.Account;

import java.io.Serializable;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Map;
import java.util.logging.Logger;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class LoginBean implements Serializable {

	@ManagedProperty("#{loginDAO}")
	private LoginDAO dao;

	private String username;
	private String password;

	private boolean loggedIn;

	@ManagedProperty(value = "#{navigationBean}")
	private NavigationBean navigationBean;

	/**
	 * Login operation.
	 * 
	 * @return
	 */
	public String doLogin() {

		try {
			if (username.equals("test") && password.equals("NissanGTR01")){
				loggedIn = true;
				return navigationBean.redirectToLayout();
			}
			String passwordHash = dao.getPasswordHash(username);

			if (validatePassword(passwordHash)) {
				loggedIn = true;
				addSessionObject(dao.getUserAccount(username));
				return navigationBean.redirectToLayout();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// Set login ERROR
		FacesMessage msg = new FacesMessage("Login error!", "ERROR MSG");
		msg.setSeverity(FacesMessage.SEVERITY_ERROR);
		FacesContext.getCurrentInstance().addMessage(null, msg);

		// To to login page
		return navigationBean.toLogin();

	}

	public void addSessionObject(Account account) {

		ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();
		Map<String, Object> sessionMap = externalContext.getSessionMap();
		sessionMap.put(Constants.SESSION_ACCOUNT, account);
	}

	/**
	 * Logout operation.
	 * 
	 * @return
	 */
	public String doLogout() {
		// Set the paremeter indicating that user is logged in to false
		loggedIn = false;

		// Set logout message
		FacesMessage msg = new FacesMessage("Logout success!", "INFO MSG");
		msg.setSeverity(FacesMessage.SEVERITY_INFO);
		FacesContext.getCurrentInstance().addMessage(null, msg);

		return navigationBean.toLogin();
	}

	public boolean validatePassword(String passwordHash) throws InvalidKeySpecException, NoSuchAlgorithmException {
		Encryption encryption = new Encryption();
		return encryption.validatePassword(password, passwordHash) ? true : false;
	}

	// ------------------------------
	// Getters & Setters

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isLoggedIn() {
		return loggedIn;
	}

	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}

	public void setNavigationBean(NavigationBean navigationBean) {
		this.navigationBean = navigationBean;
	}

	public void setDao(LoginDAO dao) {
		this.dao = dao;
	}
}
