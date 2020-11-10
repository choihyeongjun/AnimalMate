package animalMate;

import java.util.Calendar;

public class testclass {
	public static void main(String[] args) {
		String a = "940731";
		
		int birthYear = Integer.parseInt(String.valueOf(a).substring(0, 2));
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR)-2000;
		int age;
		if(birthYear > year) {
			age = year + (100-birthYear) +1; //1더하면 한국나이
		} else {
			age = year;
		}
		System.out.println(birthYear);
		System.out.println(year);
		System.out.println(age);
	}
}
