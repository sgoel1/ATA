package com.ata.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ata_tbl_creditcard")
public class CreditCardBean {
	
		@Id
		String creditcardnumber;
		String validfrom;
		String validto;
		int creditbalance;
		String userid;
		public String getCreditcardnumber() {
			return creditcardnumber;
		}
		public void setCreditcardnumber(String creditcardnumber) {
			this.creditcardnumber = creditcardnumber;
		}
		public String getValidfrom() {
			return validfrom;
		}
		public void setValidfrom(String validfrom) {
			this.validfrom = validfrom;
		}
		public String getValidto() {
			return validto;
		}
		public void setValidto(String validto) {
			this.validto = validto;
		}
		public CreditCardBean(String creditcardnumber, String validfrom,
				String validto, int creditbalance, String userid) {
			super();
			this.creditcardnumber = creditcardnumber;
			this.validfrom = validfrom;
			this.validto = validto;
			this.creditbalance = creditbalance;
			this.userid = userid;
		}
		public int getCreditbalance() {
			return creditbalance;
		}
		public void setCreditbalance(int creditbalance) {
			this.creditbalance = creditbalance;
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
}
