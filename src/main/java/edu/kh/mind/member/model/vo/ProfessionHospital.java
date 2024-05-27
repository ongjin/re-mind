package edu.kh.mind.member.model.vo;

public class ProfessionHospital {

    private int professionNo;
    private String hospitalName;
    private String hospitalAddress;
    private String hospitalPhone;
    private String businessNo;
    private int maxValue;

    public ProfessionHospital(){}

    public void setMaxValue(int maxValue) {
        this.maxValue = maxValue;
    }

    public int getMaxValue() {
        return maxValue;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    public void setHospitalAddress(String hospitalAddress) {
        this.hospitalAddress = hospitalAddress;
    }

    public void setHospitalPhone(String hospitalPhone) {
        this.hospitalPhone = hospitalPhone;
    }


    public int getProfessionNo() {
        return professionNo;
    }

    public String getBusinessNo() {
        return businessNo;
    }

    public String getHospitalName() {
        return hospitalName;
    }

    public String getHospitalAddress() {
        return hospitalAddress;
    }

    public String getHospitalPhone() {
        return hospitalPhone;
    }

    public void setProfessionNo(int professionNo) {
        this.professionNo = professionNo;
    }

    public void setBusinessNo(String businessNo) {
        this.businessNo = businessNo;
    }
}
