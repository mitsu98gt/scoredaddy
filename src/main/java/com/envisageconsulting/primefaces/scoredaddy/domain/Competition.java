package com.envisageconsulting.primefaces.scoredaddy.domain;

import java.util.Date;

public class Competition {

    private String id;
    private int tournament_id;
    private int accountId;
    private String name;
    private String description;
    private Date date;
    private String status;
    private CompetitionDetails competitionDetails;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getTournament_id() {
        return tournament_id;
    }

    public void setTournament_id(int tournament_id) {
        this.tournament_id = tournament_id;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public CompetitionDetails getCompetitionDetails() {
        return competitionDetails;
    }

    public void setCompetitionDetails(CompetitionDetails competitionDetails) {
        this.competitionDetails = competitionDetails;
    }

    public boolean equals(Object obj){
        if(obj instanceof Competition){
            Competition competition = (Competition)obj;
            if(null != this.id && this.id.equals(competition.getId())){
                return true;
            }
        }
        return false;
    }

}
