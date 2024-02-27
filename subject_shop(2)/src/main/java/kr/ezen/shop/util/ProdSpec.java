package kr.ezen.shop.util;

public enum ProdSpec {
	
		NEW("신규"), HOT("인기"), BEST("추천");
		private final String value;
		private ProdSpec(String value) {
			this.value = value;
		}
		
		public String getValue() {
			return value;
		}

}
