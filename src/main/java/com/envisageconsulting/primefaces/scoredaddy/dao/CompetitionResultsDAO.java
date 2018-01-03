package com.envisageconsulting.primefaces.scoredaddy.dao;

import com.envisageconsulting.primefaces.scoredaddy.domain.CompetitionResults;

import java.util.List;

public interface CompetitionResultsDAO {

    public List<CompetitionResults> getCompetitionResultsByDivisionAndCompetitionId(String division, int competitionId) throws Exception;
    public void addCompetitionResults(CompetitionResults competitionResults) throws Exception;

}
