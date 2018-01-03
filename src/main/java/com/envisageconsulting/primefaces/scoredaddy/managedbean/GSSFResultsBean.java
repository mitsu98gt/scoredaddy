package com.envisageconsulting.primefaces.scoredaddy.managedbean;

import com.envisageconsulting.primefaces.scoredaddy.SQLConstants;
import com.envisageconsulting.primefaces.scoredaddy.dao.CompetitionResultsDAO;
import com.envisageconsulting.primefaces.scoredaddy.domain.Competition;
import com.envisageconsulting.primefaces.scoredaddy.domain.CompetitionResults;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.ViewScoped;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@ViewScoped
@ManagedBean(name="gssfResultsBean")
public class GSSFResultsBean implements Serializable {

    @ManagedProperty("#{competitionResultsDAO}")
    private CompetitionResultsDAO competitionResultsDAO;

    private List<CompetitionResults> competitionStockResultsList;
    private List<CompetitionResults> filtered;

    private String competitionDate;
    private String accountName;
    private String competitionDescription;

    @PostConstruct
    public void init() {
        try {
            competitionStockResultsList = calculateClassifcation(competitionResultsDAO.getCompetitionResultsByDivisionAndCompetitionId(SQLConstants.STOCK_DIVISION, 1));
            competitionDate = getCompetitionDate();
            accountName = getAccountInfoName();
            competitionDescription = getCompetitionInfoDescription();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<CompetitionResults> calculateClassifcation(List<CompetitionResults> list) {

        int groups = list.size() / 3;
        int classA = groups;
        int classB = groups * 2;

        for (int i=0; i < list.size(); i++) {
            if (i < classA) {
                list.get(i).setClassification("A");
            } else if (i >= classA && i < classB) {
                list.get(i).setClassification("B");
            } else {
                list.get(i).setClassification("C");
            }

        }

        return list;
    }

    public String getCompetitionDate() {
        Date competitionDate = competitionStockResultsList.get(0).getCompetitionDetails().getDate();
        SimpleDateFormat format = new SimpleDateFormat("MMMM dd, yyyy");
        return format.format(competitionDate);
    }

    public String getAccountInfoName() {
        return competitionStockResultsList.get(0).getAccount().getName();
    }

    public String getCompetitionInfoDescription() {
        return competitionStockResultsList.get(0).getCompetition().getDescription();
    }

    public List<CompetitionResults> getFiltered() {
        return filtered;
    }

    public void setFiltered(List<CompetitionResults> filtered) {
        this.filtered = filtered;
    }

    public void setCompetitionResultsDAO(CompetitionResultsDAO competitionResultsDAO) {
        this.competitionResultsDAO = competitionResultsDAO;
    }

    public List<CompetitionResults> getCompetitionStockResultsList() {
        return competitionStockResultsList;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getCompetitionDescription() {
        return competitionDescription;
    }

    public void setCompetitionDescription(String competitionDescription) {
        this.competitionDescription = competitionDescription;
    }
}