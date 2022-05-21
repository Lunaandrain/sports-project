package com.sportsmeet.sports.base.exception;

/**
 * @author XYX
 * @create 2021-11-23-0:16
 */
public class SportsException extends RuntimeException{

    private SportsEnum sportsEnum;

    public SportsException(SportsEnum sportsEnum){

        super(sportsEnum.getMessage());
        this.sportsEnum = sportsEnum;
    }
}
