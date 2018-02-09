package com.envisageconsulting.primefaces.scoredaddy.managedbean;

import com.envisageconsulting.primefaces.scoredaddy.CompetitorDataSource;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class NavigationBean implements Serializable {

	@ManagedProperty("#{panelMenuBean}")
	private PanelMenuBean panelMenuBean;

	private static final long serialVersionUID = 1520318172495977648L;

	/**
	 * Redirect to login page.
	 * 
	 * @return Login page name.
	 */
	public String redirectToLogin() {
		return "/login.xhtml?faces-redirect=true";
	}

	/**
	 * Go to login page.
	 * 
	 * @return Login page name.
	 */
	public String toLogin() {
		return "/login.xhtml";
	}

	/**
	 * Redirect to info page.
	 * 
	 * @return Info page name.
	 */
	public String redirectToInfo() {
		return "/info.xhtml?faces-redirect=true";
	}

	/**
	 * Go to info page.
	 * 
	 * @return Info page name.
	 */
	public String toInfo() {
		return "/info.xhtml";
	}

	/**
	 * Redirect to welcome page.
	 * 
	 * @return Welcome page name.
	 */
	public String redirectToWelcome() {
		return "/secured/welcome.xhtml?faces-redirect=true";
	}

	public String redirectToLayout() {
		collapseAllMenuItems();
		return "/secured/layout2/layout.xhtml?faces-redirect=true";
	}

	public String redirectToAddTournament() {
		collapseAllMenuItems();
		panelMenuBean.setTournamentExpanded(true);
		return "/secured/layout2/tournament/add_tournament.xhtml?faces-redirect=true";
	}

	public String redirectToAddCompetition() {
		collapseAllMenuItems();
		panelMenuBean.setCompetitionExpanded(true);
		return "/secured/layout2/competition/add_competition.xhtml?faces-redirect=true";
	}

	public String redirectToAddCompetitor() {
		collapseAllMenuItems();
		panelMenuBean.setCompetitorExpanded(true);
		return "/secured/layout2/competitor/add_competitor.xhtml?faces-redirect=true";
	}

	public String redirectToRegisterCompetitor() {
		collapseAllMenuItems();
		panelMenuBean.setCompetitorExpanded(true);
		return "/secured/layout2/competitor/register_competitor.xhtml?faces-redirect=true";
	}

	public String redirectToAddFirearm() {
		collapseAllMenuItems();
		panelMenuBean.setFirearmExpanded(true);
		return "/secured/layout2/firearm/add_firearm.xhtml?faces-redirect=true";
	}

	public String redirectToGssfScoresheet() {
		collapseAllMenuItems();
		panelMenuBean.setGssfExpanded(true);
		return "/secured/layout2/gssf/indoor_scoresheet.xhtml?faces-redirect=true";
	}

	public String redirectToBullseyeScoresheet() {
		collapseAllMenuItems();
		panelMenuBean.setBullseyeExpanded(true);
		return "/secured/layout2/bullseye/bullseye_scoresheet.xhtml?faces-redirect=true";
	}

	public String redirectToViewGssfScores() {
		collapseAllMenuItems();
		panelMenuBean.setScoresExpanded(true);
		return "/secured/layout2/scores/view_scores.xhtml?faces-redirect=true";
	}

	public String redirectToViewBullseyeScores() {
		collapseAllMenuItems();
		panelMenuBean.setScoresExpanded(true);
		return "/secured/layout2/scores/view_scores_bullseye.xhtml?faces-redirect=true";
	}

	public String redirectToUpdateScores() {
		collapseAllMenuItems();
		panelMenuBean.setScoresExpanded(true);
		return "/secured/layout2/scores/update_scores.xhtml?faces-redirect=true";
	}

	public void collapseAllMenuItems() {
		panelMenuBean.setTournamentExpanded(false);
		panelMenuBean.setCompetitionExpanded(false);
		panelMenuBean.setCompetitorExpanded(false);
		panelMenuBean.setFirearmExpanded(false);
		panelMenuBean.setGssfExpanded(false);
		panelMenuBean.setBullseyeExpanded(false);
		panelMenuBean.setScoresExpanded(false);
	}
	/**
	 * Go to welcome page.
	 *
	 * @return Welcome page name.
	 */
	public String toWelcome() {
		return "/secured/welcome.xhtml";
	}

	public PanelMenuBean getPanelMenuBean() {
		return panelMenuBean;
	}

	public void setPanelMenuBean(PanelMenuBean panelMenuBean) {
		this.panelMenuBean = panelMenuBean;
	}
}
