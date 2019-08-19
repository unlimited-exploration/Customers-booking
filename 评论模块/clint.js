//获得商品评论
export function getComment(goodsId){
	const res = axios.get('/api/mall/getGoodsComment?goodsId='+goodsId);
	return new Promise((resolve,reject)=>{
		res
		.then((result)=>{
	        if(result.status===200){
	        	return result.data;
	        }else{
	        	reject(result.status)
	        }
	    })
	    .then((json)=>{
    		if(json.code===0){
                resolve(json.data);
            }else{
                reject(json.message);
            }
    	})
	    .catch((e)=>{
	    	reject(e.toString())
	    })
	})
}