package com.github.deyvidsalvatore.bdr.boleiros_commons.models.users;

import java.io.Serial;
import java.io.Serializable;

public class Role implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private String name;

    private String description;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
