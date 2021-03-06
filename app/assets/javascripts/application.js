// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
function toggleMe(a, b){
	var e=document.getElementById(a);
	var butt=document.getElementById(b);
	if(!e)return true;
	if(e.style.display=="none"){
	e.style.display="block"
	butt.value = "(-) CSCE " + b
	}
	else{
	e.style.display="none"
	butt.value = "(+) CSCE " + b
	}
	return true;
}

// When the user clicks the button, open the modal
function getDetailsById(id) {
    $.ajax({
    type: "GET",
    url: "/student_requests/id/" + id,
    success: function(data, textStatus) {
        $(".modal-content").html(data);    
    },
    error: function() {
        alert('Not OKay');
    }
	});
	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

    modal.style.display = "block";
}

// When the user clicks the button, open the modal
function buttonclick(uin) {
    $.ajax({
    type: "GET",
    url: "/student_requests/uin/" + uin,
    success: function(data, textStatus) {
        $(".modal-content").html(data);    
    },
    error: function() {
        alert('Not OKay');
    }
	});
	// Get the modal
	var modal = document.getElementById('myModal');
	
	// $('#myModal').append(beer);

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
function spanclick() {
	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
    modal.style.display = "none";
}

window.onclick = function(event) {
	var modal = document.getElementById('myModal');
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function formtooltip(el,flag)
{
	try 
	{
		elem = document.getElementById(el);
		if (flag) 
		{ 
			elem.parentNode.parentNode.style.zIndex=1000;
			elem.parentNode.parentNode.style.borderRight='0px solid #000';
			elem.style.visibility='visible';
		}
		else 
		{
			elem.parentNode.parentNode.style.zIndex=1;
			elem.parentNode.parentNode.style.border='none';
			elem.style.visibility='hidden';
		};
	}
	catch (err) 
	{
		return(true);
	}
}

function pageinit()
{
    subMenu = document.getElementById("minor_tip");
    subMenu.style.visibility = "hidden";
}