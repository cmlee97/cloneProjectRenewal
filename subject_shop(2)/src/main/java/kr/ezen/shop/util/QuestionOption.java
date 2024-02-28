package kr.ezen.shop.util;

public enum QuestionOption {
	
		Simple("단순문의"), Repair("수리"), Refund("환불"), 
		Ordering("주문"), Delivery("배송");
		private final String value;
		private QuestionOption(String value) {
			this.value = value;
		}
		
		public String getValue() {
			return value;
		}

}
