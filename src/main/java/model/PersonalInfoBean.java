package model;

import java.io.Serializable;
import java.util.Date;

public class PersonalInfoBean implements Serializable {
    private String name;
    private String surname;
    private String phone;
    private Date birth_date;
    private String customer;

    public PersonalInfoBean() {
    }

    public PersonalInfoBean(String name, String surname, String phone, Date birth_date, String customer) {
        this.name = name;
        this.surname = surname;
        this.phone = phone;
        this.birth_date = birth_date;
        this.customer=customer;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public String getCustomer() {
        return customer;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(Date birth_date) {
        this.birth_date = birth_date;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }
}
