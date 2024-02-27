/**
 * 
 */
  function checkAll(){
    let isChecked = document.getElementById("checkAll").checked;//true or false 리턴
    let chks = document.getElementsByName('chk');
    for(let i = 0; i<chks.length; i++){
      chks[i].checked=isChecked;
    }
  }
  function prodDel(){
	 let chks = document.getElementsByName('chk');
	 let prodNumstr = "";
	 let separator=false;
	 for(let i=0; i<chks.length; i++){
		 if(chks[i].checked){
			 if(separator){
				 prodNumstr = prodNumstr + '/';
			 }
			 prodNumstr = prodNumstr+chks[i].value;
			 separator = true
		 }
	 }
	 if(!prodNumstr){//null은 거짓
		 alert('삭제할 상품을 체크하세요');
		 return;
	 }
	 document.cartForm.delProdNums.value = prodNumstr;
	 console.log("prodNumstr : "+ prodNumstr);
	 let res = confirm("삭제하시겠습니까");
	 if(res){
		 document.cartForm.submit();
	 }
  }

  function usePoint(obj, point, price){
	  let elem = document.getElementById("point");
	  let tot_amount = document.getElementById("cartTotPrice");
	  console.log(point);
	  
	  if(obj.checked){
	  	elem.value = point;
	  	tot_amount.innerText = (price-point).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  }else{
		  elem.value = "";
		  tot_amount.innerText = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  }
	  
  }
  function removeChar(e){
	  e.target.value = e.target.value.replace(/[^0-9]/g,'');
  }
  //결제방법 선택
  function selPayment(){
	  let pms = document.getElementsByName("payment");
	  for(let i = 0; i<pms.length; i++){
		  if(pms[i].checked){
			  document.getElementById(pms[i].value).style.display="block";
		  }else{
			   document.getElementById(pms[i].value).style.display="none"
		  }
	  }
  }