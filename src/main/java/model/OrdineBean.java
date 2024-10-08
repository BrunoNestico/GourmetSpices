package model;

import java.io.Serializable;
import java.util.Date;

public class OrdineBean implements Serializable {
    private static final long serialVersionUID = 2856723757650934258L;
    
    private int idOrdine;
    private String NCarta;
    private String email;
    private Date data;
    private float spesa;
    private String indirizzo;
    
    public OrdineBean() {
        this.idOrdine = -1;//id non specificato
        this.NCarta = "";
        this.email = "";
        this.data = new Date();
        this.spesa = 0.0f;
        this.indirizzo = "";
    }
    
    public OrdineBean(int idOrdine, String NCarta, String email, Date data, float spesa, String indirizzo) {
        this.idOrdine = idOrdine;
        this.NCarta = NCarta;
        this.email = email;
        this.data = data; 
        this.spesa = spesa;
        this.indirizzo = indirizzo;
    }

    // Getters and Setters
    public int getIdOrdine() {
        return idOrdine;
    }

    public void setIdOrdine(int idOrdine) {
        this.idOrdine = idOrdine;
    }

    public String getNCarta() {
        return NCarta;
    }

    public void setnCartaIban(String NCarta) {
        this.NCarta = NCarta;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }
    

    public float getSpesa() {
        return spesa;
    }

    public void setSpesa(float spesa) {
        this.spesa = spesa;
    }

    public String getIndirizzo() {
        return indirizzo;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }
}
