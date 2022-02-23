package g_oop2;

public class Store {

	public static void main(String[] args) {
		Desktop d1 = new Desktop("삼성 컴퓨터", 10000);
		Desktop d2 = new Desktop("LG 컴퓨터", 10000);
		
		AirCon ac1 = new AirCon("삼성 에어컨", 20000);
		AirCon ac2 = new AirCon("LG 에어컨", 20000);
		
		TV tv1 = new TV("삼성 TV", 30000);
		TV tv2 = new TV("LG TV", 30000);
		
		Customer c = new Customer();
		
		c.buy(d1);              //buy 파라미터가 Product 타입임. 상속받은걸 넘김 = 다형성
								//만약 다형성을 못쓴다면? 각각의 메서드를 만들어야함.
		c.buy(ac2);
		
		c.buy(tv2);
		
		c.showItem();
		
		c.buy(d2);
		
		((Desktop)c.item[0]).programming(); //데스크탑으로 형변환 해서 데스크탑에있는 programming을 호출 한것임.
		((AirCon)c.item[1]).setTemperature();
		((TV)c.item[2]).setChannel();
	}
	
}

class Product{//모든 물건이 공통적으로 가지고 있어야하는 것들.
	String name; //이름
	int price; //가격
	
	Product(String name, int price){
		this.name = name;
		this.price = price;
	}
	
	//상품의 정보를 반환하는 메서드
	String getInfo(){
		return name + "(" + price + "원)";
	}
}

class Desktop extends Product{
	Desktop(String name, int price){
		super(name, price);
	}
	
	void programming(){
		System.out.println("프로그램을 만듭니다.");
	}
}

class AirCon extends Product{
	AirCon(String name, int price){
		super(name, price);
	}
	
	void setTemperature(){
		System.out.println("온도를 설정합니다.");
	}
}

class TV extends Product{
	TV(String name, int price){
		super(name, price);
	}
	
	void setChannel(){
		System.out.println("채널을 변경합니다.");
	}
}

class Customer{
	int money = 1000000;
	Product[] item = new Product[100]; //다형성 부모타입인데 자식의 객체가 들어감!! 밑에도 같음.
	//Product 타입을 쓰면 물건을 다 저장할 수 있음!
	
	void buy(Product p){// 상품이 뭐가 오든지 받아야하므로 Product 타입을 써야함. 다형성. 부모타입 자식의 객체
		if(money < p.price){
			System.out.println("잔돈이 부족하다.");
			return;
		}
		
		money -=p.price;
		
		for(int i = 0; i < item.length; i++){
			if(item[i] == null){
				item[i] = p;
				break;
			}
		}
		System.out.println(p.getInfo() + "를 구매했다.");
	}
	
	void showItem(){
		System.out.println("========= 장바구니 =========");
		for(int i = 0; i < item.length; i++){
			if(item[i] == null){
				break;
			}else{
				System.out.println(item[i].getInfo());
			}
		}
		System.out.println("==========================");
	}
	
}


