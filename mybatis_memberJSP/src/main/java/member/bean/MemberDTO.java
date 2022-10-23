package member.bean;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

//@Data
// @Data 는 기본생성자 / setter,getter / toString / haschcode / equals 를 만들어준다

@Getter
@Setter 
//lombok 을 썻다

@NoArgsConstructor
//Args 는 매개변수

@RequiredArgsConstructor


public class MemberDTO {
	@NonNull private String name;
	
	private String id;
	private String pwd;
	private String gender;
	private String email1;
	private String email2;
	private String tel1;
	private String tel2;
	private String tel3;
	private String zipcode;
	private String addr1;
	private String addr2;
	
}
