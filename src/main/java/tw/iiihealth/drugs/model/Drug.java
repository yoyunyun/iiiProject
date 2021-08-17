package tw.iiihealth.drugs.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="DRUG")
public class Drug { 
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    private String cnumber;
    private String chinesename;
    private String englishname;
    private String applicant;
    private String shape;
    private String color;
    private String appearance;

    public int getId() {
        return id;
    } 
    
    public void setId(int id) {
        this.id = id;
    }

    public String getCnumber() {
        return cnumber;
    }

    public void setCnumber(String cnumber) {
        this.cnumber = cnumber;
    }

    public String getChinesename() {
        return chinesename;
    }

    public void setChinesename(String chinesename) {
        this.chinesename = chinesename;
    }

    public String getEnglishname() {
        return englishname;
    }

    public void setEnglishname(String englishname) {
        this.englishname = englishname;
    }

    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    public String getShape() {
        return shape;
    }

    public void setShape(String shape) {
        this.shape = shape;
    }
    
    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    
    public String getAppearance() {
        return appearance;
    }

    public void setAppearance(String appearance) {
        this.appearance = appearance;
    }
    @Override
	public String toString(){
		return "id="+id+", cnumber="+cnumber+", chinesename="+chinesename+",englishname="+englishname+",applicant="+applicant+",shape="+shape+",color="+color+",appearance="+appearance;
	}
    

}