package com.sportsmeet.sports.back.bean;

import lombok.Data;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author XYX
 * @create 2021-11-22-23:37
 */
@Data
@Table(name="referee")
@NameStyle(Style.normal)
public class Referee {
    @Id
    private String r_id;
   private String r_name;
   private String r_phone;
   private String r_identity;
   private String username;
   private String password;

}
