package com.ht.vo;

/**
 * Created by 7025 on 2017/9/20.
 */
public class Search {

    private String id;
    private String name;
    private String spell;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpell() {
        return spell;
    }

    public void setSpell(String spell) {
        this.spell = spell;
    }

    @Override
    public String toString() {
        return "Search{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", spell='" + spell + '\'' +
                '}';
    }
}
