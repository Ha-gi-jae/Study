package kr.or.ddit.basic;
/**
 * 직렬화 : 객체를 바이트 배열로 만드는 것
 * 역직렬화: 바이트 배열을 객체로 복원하는 것
 */
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

public class HotelIO {
   private Scanner scan; // scan 선언
   private Map<String, hotelInfo> infoMap;// infoMap 선언
   
   public HotelIO(){ // 생성자
      scan = new Scanner(System.in); // 초기화
      infoMap = new HashMap<>(); // 초기화
   }
   
   public static void main(String[] args) throws ClassNotFoundException, IOException {
      new HotelIO().hotelStart();
   }

   public void displayMenu() { // 출력화면구성
      System.out.println("*******************************************");
      System.out.println("어떤 업무를 하시겠습니까?");
      System.out.println("1.체크인  2.체크아웃  3.객실상태  4.업무종료");
      System.out.println("*******************************************");
      System.out.print("메뉴선택 =>");
   }
   
   public void hotelStart() throws ClassNotFoundException, IOException  {//시작 메서드
      try {
         // 바이트 배열을 다시 객체로 복원(역직렬화)
         // FileInputStream - 기본 스트림, ObjectInputStream - 보조 스트림
         ObjectInputStream ois = new ObjectInputStream(new FileInputStream("d:/D_Other/hotelinfo.bin"));
         // 위에서 Object타입으로 파일을 받아왔는데 반복하면서 읽으려면 읽는 변수도 오브젝트 타입이여야한다.
         Object obj = null;
         
         // readObject : 입력 스트림에서 읽은 바이트를 역직렬화해서 객체로 다시 복원해서 리턴. 
         // 파일의 내용을 모두 역직렬화를 하게되어 null값이 나오게되면 반복문을 빠져 나온다.
         while((obj = ois.readObject()) != null) {
            hotelInfo hotel = (hotelInfo) obj; // 위에서 가져온 내용을 hotelInfo(객체)타입으로 형변환시킨 후,
                                       // hotelInfo타입의 hotel 변수에 저장한다.
            infoMap.put(hotel.getRoomnumber(), hotel); // hotel에 저장된 자료(키와 값)를 가지고와서 다시 infoMap에 넣어준다.
         }
         ois.close(); // 스트림 종료. 
      }catch (IOException e) {
         //e.printStackTrace();
      }
      
      boolean flag = true; // 업무종료시 while 조건에 있는 flag가 false로 되면서 반복을 멈추게 하기 위해서 사용. 
      System.out.println("**************************");
      System.out.println("호텔 문을 열었습니다.");
      System.out.println("**************************");
      System.out.println();
      
      while(flag) {
         displayMenu(); // 호출해서 메뉴 보여주기.
         int menuNum = scan.nextInt(); // 메뉴 구성도 번호 받기
         
         switch (menuNum) { // 위에서 입력한 번호로 구성도에 맞는 메서드 실행
         case 1:
            checkIn(); // 체크인 메서드
            break;

         case 2:
            checkOut(); // 체크아웃 메서드
            break;
         
         case 3:
            report(); // 객실상태 메서드
            break;
         case 4:
            System.out.println("**************************");
            System.out.println("호텔 문을 닫았습니다.");
            System.out.println("**************************");
            
            try {
               // 객체를 바이트 배열로 다시 만드는 과정(직렬화)
               // FileOutputStream - 일반 스트림, ObjectOutputStream - 보조 스트림
               ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("d:/D_Other/hotelinfo.bin"));
               
               for(String key : infoMap.keySet()) { // 향상된 for문을 이용해 infoMap에 있는 키값을 key변수에 저장
               //writeObject() : 객체를 직렬화해서 출력 스트림으로 내보냄.
                  oos.writeObject(infoMap.get(key)); // 키셋에서 받은 키값을 for문을 돌면서 직렬화해서 출력 스트림으로 내보냄.
               }
               
               System.out.println("저장완료");
               oos.close();
            }catch (IOException e) {
               e.printStackTrace();
            }
            
            
            flag = false; // 반복문 while을 종료시킴.
            break;
            
         }
      }
      
   }

   private void report() {
      Set<String> keySet = infoMap.keySet();
      //keySet()은 키 값을 가져와 준다. infoMap의 키 값들이 keySet 변수에 모두 저장.
      if(keySet.size() == 0) { // key의 데이터 개수체크. key의 개수가 0이다 > 데이터가 없다.
         System.out.println("체크인한 사람이 없습니다.");
      }else { // key에 데이터가 있다.
         Iterator<String> it = keySet.iterator();
         // Iterator => 반복자. 모든 키의 값을 it에 저장.
         // Iterator을 왜 쓰는가? > Set데이터는 인덱스가 없기 때문에.
         while(it.hasNext()) { // hasNext는 다음 자료가 있는지 검사하는 역할. 즉, it의 다음 위치에 자료가 존재하는지 확인해준다.
            String roomnumber = it.next(); // 위에서 이동한 위치의 키 값을 roomnumber에 반환해준다.
            hotelInfo i = infoMap.get(roomnumber); // 위에서 넘겨받은 roomnumber의 키 값에 해당하는 value를 가져와  hotelInfo i에 넘겨줌.
            System.out.println("방번호 : " + i.getRoomnumber()+ ", 투숙객 : " + i.getName());
         }
         
      }
   }

   private void checkOut() {
      System.out.println("어느방을 체크아웃 하시겠습니까?");
      System.out.print("방번호 입력 =>");
      String roomnumber = scan.next();
      System.out.println();
      if(infoMap.remove(roomnumber) == null) { // null이다 => 현재 roomnumber(키)값이 존재하지 않다.
         System.out.println(roomnumber + "방에는 체크인한 사람이 없습니다.");
      }else {
         System.out.println("체크아웃 되었습니다.");
      }
   }

   private void checkIn() {
      System.out.println("어느방에 체크인 하시겠습니까?");
      System.out.print("방번호 입력=>");
      String roomnumber = scan.next();
      System.out.println("누구를 체크인 하시겠습니까?");
      System.out.print("이름 입력=>");
      String name = scan.next();
      System.out.println();
      if(infoMap.get(roomnumber) != null) { // null이 아니다 => 현재 roomnumber(키)를 사용하고있다.
         System.out.println(roomnumber + "방에는 이미 사람이 있습니다.");
         return;
      }
      infoMap.put(roomnumber, new hotelInfo(roomnumber, name));
      //앞의 roomnumber는  키값.   해당 키 값에 hotelInfo객체의 roomnumber와 name을 넣어준다.
      System.out.println("체크인 되었습니다.");
      System.out.println();
   }
}

class hotelInfo implements  Serializable {
   private String roomnumber; // 방번호
   private String name; // 이름
   
   public hotelInfo(String roomnumber, String name) { // 생성자
      super();
      this.roomnumber = roomnumber;
      this.name = name;
   }

   public String getRoomnumber() {
      return roomnumber;
   }

   public void setRoomnumber(String roomnumber) {
      this.roomnumber = roomnumber;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   @Override
   public String toString() {
      return "hotelInfo [roomnumber=" + roomnumber + ", name=" + name + "]";
   }
   
   
   
   
}