package com.project.member.dto;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
    //Criteria = 기준(검색의 기준)
    //리스트 화면에 몇개를 보여줄 건가 + 페이지 값 담기
    /* 현재 페이지 */
    private int pageNum;

    /* 한 페이지 당 보여질 게시물 갯수 */
    private int amount;

    /* 스킵 할 게시물 수( (pageNum-1) * amount ) */
    private int skip;

    private String keyword;
    private String searchType;


    /* 기본 생성자 -> 기본 세팅 : pageNum = 1, amount = 10 (파라미터없이 호출됐을때) */
    public Criteria() {
        this( 1,20);
    }

    /* 생성자 => 원하는 pageNum, 원하는 amount (파라미터와 함께 호출됐을때)*/
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum-1)*amount;
    }


    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.skip = (pageNum-1)*this.amount; //setAmount(), setPageNum() 호출 = amount, pageNum 값 변경, skip의 값도 같이 변경되도록 코드추가
        this.pageNum = pageNum;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.skip = (this.pageNum-1)*amount;
        this.amount = amount;
    }

    public int getSkip() {
        return skip;
    }

    public void setSkip(int skip) {
        this.skip = skip;
    }

    @Override
    public String toString() {
        return "Criteria [pageNum = " + pageNum + ", amount = " + amount + ", skip = " + skip +", keyword="+ keyword +", searchType="+searchType+"]";
    }
}
