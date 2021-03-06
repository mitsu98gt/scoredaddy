package com.envisageconsulting.primefaces.scoredaddy;

import com.envisageconsulting.primefaces.scoredaddy.dao.FirearmDAO;
import com.envisageconsulting.primefaces.scoredaddy.domain.Firearm;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import java.util.ArrayList;
import java.util.List;

@ManagedBean(name = "firearmDataSource")
@SessionScoped
public class FirearmDataSource {

    @ManagedProperty("#{firearmDAO}")
    private FirearmDAO dao;

    public List<Firearm> firearms = new ArrayList<Firearm>();

    @PostConstruct
    public void init() {

        try {
            firearms = dao.getGlockFirearmForScoreSheet();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Firearm getFirearmById(String id) {
        try {
            return dao.getFirearmById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Firearm> getAllFirearmsForScoreSheet() {
        try {
            firearms = dao.getAllFirearmsForScoreSheet();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return firearms;
    }

    public List<Firearm> getAllGlockFirearmsForScoreSheet() {
        try {
            firearms = dao.getGlockFirearmForScoreSheet();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return firearms;
    }

    public List<Firearm> getFirearms() {
        return firearms;
    }

    public void setFirearms(List<Firearm> firearms) {
        this.firearms = firearms;
    }

    public void setDao(FirearmDAO dao) {
        this.dao = dao;
    }
}
