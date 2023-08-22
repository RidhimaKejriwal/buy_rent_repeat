function makeActive(linkid)
{
	document.getElementById(linkid).style.color='black';
}

function showToast(content) 
{
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
    },2000);
}

