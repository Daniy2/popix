package model;

public interface PersonalInfoInterface {

    void doSave(PersonalInfoBean personalInfo, String email);
    PersonalInfoBean getPersonalInfo(String email);

}
