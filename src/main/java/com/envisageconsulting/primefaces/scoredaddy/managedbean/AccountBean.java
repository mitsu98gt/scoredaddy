package com.envisageconsulting.primefaces.scoredaddy.managedbean;

import com.envisageconsulting.primefaces.scoredaddy.dao.AccountDAO;
import com.envisageconsulting.primefaces.scoredaddy.domain.Account;
import com.envisageconsulting.primefaces.scoredaddy.domain.Address;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;

@ManagedBean(name="accountBean")
@SessionScoped
public class AccountBean implements Serializable {

    Account account = new Account();
    Address address = new Address();

    @ManagedProperty("#{accountDAO}")
    private AccountDAO dao;

    @PostConstruct
    public void init() {
        account.setAddress(address);
    }

    public void addAccount() {
        dao.addAccount(account);
    }

    public void setDao(AccountDAO dao) {
        this.dao = dao;
    }
}
