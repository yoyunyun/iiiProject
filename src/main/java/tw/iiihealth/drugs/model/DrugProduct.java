package tw.iiihealth.drugs.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="DRUGPRODUCT")
public class DrugProduct { 
	
	@Id	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    private String releasedate;
    private String beforechange;
    private String afterchange;
    private String drugname;
    private String direction;

    public int getId() {
        return id;
    } 
    
    public void setId(int id) {
        this.id = id;
    }

    public String getReleasedate() {
        return releasedate;
    }

    public void setReleasedate(String releasedate) {
        this.releasedate = releasedate;
    }

    public String getBeforechange() {
        return beforechange;
    }

    public void setBeforechange(String beforechange) {
        this.beforechange = beforechange;
    }

    public String getAfterchange() {
        return afterchange;
    }

    public void setAfterchange(String afterchange) {
        this.afterchange = afterchange;
    }

    public String getDrugname() {
        return drugname;
    }

    public void setDrugname(String drugname) {
        this.drugname = drugname;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }
   
}