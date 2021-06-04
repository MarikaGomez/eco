/**************************************************************************/
/**************                    NAVBAR                    **************/
/**************************************************************************/
var brands=document.getElementById('brands');
if(brands){
	brands.addEventListener("click",()=>{
		document.querySelector('.brandsList').className='brandsList_visible';
	})
}
/**************************************************************************/
/**************                   THUMBNAIL                  **************/
/**************************************************************************/
var thumbnails=document.querySelectorAll('.focus_thumbnail_img');
if(thumbnails){
	for(var i=0;i<thumbnails.length;i++){
		thumbnails[i].addEventListener('click',function(){
			document.getElementById('focus_product_zoom_img').src=this.src;
			if(this.className==='focus_thumbnail_img'){
				let imageActive=document.querySelector('.active');
				imageActive.classList.remove('active');
				this.className='focus_thumbnail_img active';
			}
		})
	}
}
/**************************************************************************/
/**************               PRODUCT DETAILS                **************/
/**************************************************************************/
var desc=document.querySelector('#infosTitle-desc');
if(desc){
	desc.addEventListener('click',()=>{
		document.getElementById('showDefault').style.display='inline';
		document.getElementById('hidden').style.display='none';
	})
}
var compo=document.querySelector('#infosTitle-compo');
if(compo){
	compo.addEventListener('click',()=>{
		document.getElementById('hidden').style.display='inline';
		document.getElementById('showDefault').style.display='none';
	})
}
/**************************************************************************/
/**************                 LOGIN PAGE                   **************/
/**************************************************************************/
var newAccount=document.getElementById('newAccount');
if(newAccount){
	newAccount.addEventListener('click',(evt)=>{
		evt.preventDefault();
		document.getElementById('hidden').style.display='inline';
	})
}