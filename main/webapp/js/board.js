//$(function(){});

$(document).ready(function(){
	//DB에서 1페이지당 5개씩 가져오기
	$.ajax({
		url:'/miniProject_MVC/board/getBoardList.do',
		type: 'post',
		data: 'pg='+$('#pg').val(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			//alert(data.list[0].id)
			
			$.each(data.list, function(index, items){
			console.log(index, items.seq, items.id, items.name, items.subject);
			
			$('<tr/>').append($('<td/>',{
				align : 'center',
				text: items.seq
				
			})).append($('<td/>',{
				
				}).append($('<a/>',{
					
					text: items.subject,
					class:'subjectA'				
				}))
			
			).append($('<td/>',{
				align : 'center',
				text: items.id
				
			})).append($('<td/>',{
				align : 'center',
				text: items.hit
				
			})).append($('<td/>',{
				align : 'center',
				text: items.logtime
				
			})).appendTo($('#boardListTable'));

			});//$.each
			
			//페이징 처리
			$('#pagingDiv').html(data.pagingHTML);
						
				//로그인 여부
				$('.subjectA').click(function(){
					if($('#memId').val() =='') 
						alert('먼저 로그인하세요');
					else {
						//alert($(this).parent().prev('tagName'));
						//alert($(this).parent().prev.text());
						
						var seq= $(this).parent().prev().text();
						location.href='/miniProject_MVC/board/boardView.do?seq='+seq+"&pg="+$('#pg').val();
				}
				});
			
		}, //success
		error: function(err){
			console.log(err);
		}
		
	});
});
