package com.envisageconsulting.primefaces.scoredaddy;

import com.envisageconsulting.primefaces.scoredaddy.dao.CompetitionDAO;
import com.envisageconsulting.primefaces.scoredaddy.domain.Competition;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

@ManagedBean(name = "bullseyeCompetitionConverter")
@FacesConverter(value = "bullseyeCompetitionConverter")
public class BullseyeCompetitionConverter implements Converter {

    @ManagedProperty("#{competitionDAO}")
    private CompetitionDAO competitionDAO;

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        try {
            for(Competition c : competitionDAO.getBullseyeCompetitionsByAccountIdAndStatus(SessionUtils.getAccountId(), "I")){
                if(c.getId().equals(value)){
                    return c;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        if(value instanceof Competition){
            Competition competition = (Competition)value;
            return competition.getId();
        }
        return "";
    }

    public CompetitionDAO getCompetitionDAO() {
        return competitionDAO;
    }

    public void setCompetitionDAO(CompetitionDAO competitionDAO) {
        this.competitionDAO = competitionDAO;
    }

}
