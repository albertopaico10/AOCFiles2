<html>
	<head>
		<link href="./resources/style.css" rel="stylesheet"></link>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	</head>
	<body>
		<b>POC for AOC</b>
		<div style="display: none">
			<input id="idFanPageValue" type="text" value="${fanPageValues}">
			<input id="idSecondValue" type="text" value="${frequencySecond}">
		</div>
		<div class="content">
			<div class="section" >
				<img class="img-responsive" src="img/section1.png" alt="">
			</div>
			<div class="section" >
				<img class="img-responsive" src="img/section2.png" alt="">
			</div>
			<div class="section" >
				<img class="img-responsive" src="img/section3.png" alt="">
			</div>
			<div class="section" >
				<img class="img-responsive" src="img/section4.png" alt="">
			</div>
			<div class="section" >
				<div class="likeNumber" align="center" id="res"></div>
				<img class="img-responsive" src="img/section5.png" alt="">
			</div>
		</div>
	</body>
</html>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script>
function fetchLikeCount(url){
    return $.Deferred(function(defer){
        $.ajax({
            dataType: 'jsonp',
            url: 'https://api.facebook.com/method/fql.query?callback=callback',
            data: {
                query: 'SELECT like_count FROM link_stat WHERE url="' + url + '"',
                format: 'JSON'
            }
        }).then(function(res){
            try{
                var count = res[0].like_count;
                defer.resolve(count);
            }catch(e){
                reject();
            }
        }, reject);
        function reject(){
            defer.reject(';(');
        };
    }).promise();
}
$(function(){
    var url = 'https://www.facebook.com/'+$("#idFanPageValue").val();
    var $res = $('#res');
    var numberFrequency=$("#idSecondValue").val();
	fetchLikeCount(url).always(function(res){
		console.log ( 'Created By Alberto Paico Alcántara' );		
		$res.text(res);
	});
    setInterval(function(){
    	fetchLikeCount(url).always(function(resp){
    		$res.text(resp);
        });
    },numberFrequency);
});
</script>