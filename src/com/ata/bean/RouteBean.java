package com.ata.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ata_tbl_route")
public class RouteBean {
	@Id
	private String routeID;
	private String source;
	private String destination;
	private int distance;
	private int travelDuration;

	public RouteBean() {
	}

	public RouteBean(String routeID, String source, String destination, int distance, int travelDuration) {
		super();
		this.routeID = routeID;
		this.source = source;
		this.destination = destination;
		this.distance = distance;
		this.travelDuration = travelDuration;
	}

	public String getRouteID() {
		return routeID;
	}

	public void setRouteID(String routeID) {
		this.routeID = routeID;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	public int getTravelDuration() {
		return travelDuration;
	}

	public void setTravelDuration(int travelDuration) {
		this.travelDuration = travelDuration;
	}

}
