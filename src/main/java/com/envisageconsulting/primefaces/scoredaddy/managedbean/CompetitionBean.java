package com.envisageconsulting.primefaces.scoredaddy.managedbean;

import com.envisageconsulting.primefaces.scoredaddy.SessionUtils;
import com.envisageconsulting.primefaces.scoredaddy.dao.CompetitionDAO;
import com.envisageconsulting.primefaces.scoredaddy.domain.Competition;
import com.envisageconsulting.primefaces.scoredaddy.domain.CompetitionCode;
import com.envisageconsulting.primefaces.scoredaddy.domain.CompetitionDetails;
import com.envisageconsulting.primefaces.scoredaddy.domain.CourseCode;
import com.envisageconsulting.primefaces.scoredaddy.service.CompetitionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@ManagedBean(name="competitionBean")
@RequestScoped
public class CompetitionBean implements Serializable {

    Competition competition = new Competition();
    CompetitionDetails competitionDetails =  new CompetitionDetails();
    List<CompetitionCode> competitionCodeList = new ArrayList<CompetitionCode>();
    List<CourseCode> courseCodeList = new ArrayList<CourseCode>();

    @ManagedProperty("#{competitionDAO}")
    private CompetitionDAO dao;

    @ManagedProperty("#{competitionService}")
    private CompetitionService competitionService;

    @PostConstruct
    public void init() {
        getCompetitionDetails().setCompetitionCode(new CompetitionCode());
        try {
            setCompetitionCodeList(dao.getAllCompetitionCodes());
            setCourseCodeList(dao.getAllCourseCodes());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertCompetition() {
        try {
            competition.setAccountId(SessionUtils.getAccountId());
            competition.setTournament_id(3); // TODO Testing Only
            competitionService.insertCompetition(getCompetition(), getCompetitionDetails());
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Competition added successfully!", "INFO MSG"));
        } catch (Exception e) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Add Competition Failed!", "ERROR MSG"));
            e.printStackTrace();
        }
    }

    public void addCompetition() {
        try {
            competition.setAccountId(SessionUtils.getAccountId());
            dao.addCompetition(getCompetition());
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Competition added successfully!", "INFO MSG"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addCompetitionDetails() {
        competitionDetails.setCompetitionDetailsId("1"); //TODO Testing only, Remove this at some point.
        try {
            dao.addCompetitionDetails(getCompetitionDetails());
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Competition Details added successfully!", "INFO MSG"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void setDao(CompetitionDAO dao) {
        this.dao = dao;
    }

    public void setCompetitionService(CompetitionService competitionService) {
        this.competitionService = competitionService;
    }

    public Competition getCompetition() {
        return competition;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    public CompetitionDetails getCompetitionDetails() {
        return competitionDetails;
    }

    public void setCompetitionDetails(CompetitionDetails competitionDetails) {
        this.competitionDetails = competitionDetails;
    }

    public List<CompetitionCode> getCompetitionCodeList() {
        return competitionCodeList;
    }

    public void setCompetitionCodeList(List<CompetitionCode> competitionCodeList) {
        this.competitionCodeList = competitionCodeList;
    }

    public List<CourseCode> getCourseCodeList() {
        return courseCodeList;
    }

    public void setCourseCodeList(List<CourseCode> courseCodeList) {
        this.courseCodeList = courseCodeList;
    }
}
