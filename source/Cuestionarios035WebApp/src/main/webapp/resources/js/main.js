$(document).ready(function() {
    
	 $(".subfolder a").click(function() {
	        $(this).next().slideToggle("fast");
	        $(this).toggleClass('openfolder');
	    });
    
    
    //TOOLTIPS
    $('[data-toggle="tooltip"]').tooltip();

    
     //POPOVER BODY HTML
    $("[data-toggle=popover]").popover({
        html : true,
        trigger: 'focus',
        content: function() {
            var content = $(this).attr("data-popover-content");
            return $(content).children(".popover-body").html();
        },
        title: function() {
          var title = $(this).attr("data-popover-content");
          return $(title).children(".popover-heading").html();
        }
    });
    
    //POPOVER
    $('[data-toggle="popover"]').popover();
    $('.popover-dismiss').popover({
        trigger: 'focus'
    })
   
    $(".md-btn-close").mouseenter(function(event) {
        $(this).addClass("animated headShake");
    });

    $(".md-btn-close").on("webkitAnimationEnd mozAnimationEnd oAnimationEnd animationEnd", function(event) {
        $(this).removeClass("animated headShake");
    });




    /* --PRIMERA LETRA DE CADA PALABRA-- */
    var words = $('a.username span').text().split(' ');
    var html = '';
    $.each(words, function() {
        html += '<span class="firstLetter">'+this.substring(0,1)+'</span>'+this.substring(1) + ' ';
    });
    $('a.username').html(html);
    
    

    /* --SUBMENU SIDEBAR-- */
    $(".js-expand-submenu").click(function() {
        $(".c-menu__submenu").slideToggle();
        $('.c-menu-item__expand').toggleClass("btn-up");
    });


    /* --MOSTRAR PASSWORD-- */
    $("#show_hide_password a").on('click', function(event) {
        event.preventDefault();
        if($('#show_hide_password input').attr("type") == "text"){
            $('#show_hide_password input').attr('type', 'password');
            $('#show_hide_password i').addClass( "fa-eye-slash" );
            $('#show_hide_password i').removeClass( "fa-eye open_eye" );
        }else if($('#show_hide_password input').attr("type") == "password"){
            $('#show_hide_password input').attr('type', 'text');
            $('#show_hide_password i').removeClass( "fa-eye-slash red" );
            $('#show_hide_password i').addClass( "fa-eye open_eye" );
        }
    });

    /* --MATERIAL BUTTONS-- */
    $('.md-btn').mousedown(function (e) {
        var target = e.target;
        var rect = target.getBoundingClientRect();
        var ripple = target.querySelector('.ripple');
        $(ripple).remove();
        ripple = document.createElement('span');
        ripple.className = 'ripple';
        ripple.style.height = ripple.style.width = Math.max(rect.width, rect.height) + 'px';
        target.appendChild(ripple);
        var top = e.pageY - rect.top - ripple.offsetHeight / 2 -  document.body.scrollTop;
        var left = e.pageX - rect.left - ripple.offsetWidth / 2 - document.body.scrollLeft;
        ripple.style.top = top + 'px';
        ripple.style.left = left + 'px';
        return false;
    });

    /*MOBILE SIDEBAR COLAPSED*/
    $(window).resize(function() {
        if ($(window).width() < 768) {
            $('body').removeClass('sidebar-is-expanded'); $('.openmenu').addClass('is-opened');


        } else {
            $('body').addClass('sidebar-is-expanded');
            $('.openmenu').removeClass('is-opened');
        }
    }).resize();

    /* PROGRESS BAR */


});


/*FILL BLANK*/
//click
let wordFill = document.getElementsByClassName("word-fill");
let wordEmpty = document.getElementsByClassName("word-empty");

for (let i = 0; i < wordFill.length; i++) {
	wordFill[i].addEventListener("click", function() {
		for (let i = 0; i < wordEmpty.length; i++) {
			if (wordEmpty[i].innerText === "") {
				wordEmpty[i].innerText = this.innerText;
				this.classList.add('usado');
				wordEmpty[i].setAttribute("value", this.getAttribute("value"));
				wordEmpty[i].setAttribute("data", this.getAttribute("data"));
				
				break;
			}
		}
	});
}
for (let i = 0; i < wordEmpty.length; i++) {
	wordEmpty[i].addEventListener("click", function() {
		if (this.innerText !== "") {
			this.innerText = "";
			this.value = "";
			wordFill[this.getAttribute("data")].classList.remove('usado');
		}
	});
}

// drag and drop
let dragged;
document.addEventListener("dragstart", function(e) {
	dragged = e.target;
	e.dataTransfer.setData('text', null);
}, false);
document.addEventListener("dragover", function(e) {
	e.preventDefault();
}, false);
document.addEventListener("dragenter", function(e) {
	if (e.target.classList.contains('dropzone')) {
		e.target.style.border = '2px dashed #ccc'
	}
}, false);
document.addEventListener("dragleave", function(e) {
	if (e.target.classList.contains('dropzone')) {
		e.target.style.border = ''
	}
}, false);
document.addEventListener("drop", function(e) {
	e.preventDefault();
	if (e.target.classList.contains('dropzone')) {
		dragged.parentElement.removeChild(dragged);
		e.target.firstChild && e.target.removeChild(e.target.firstChild);
		e.target.appendChild(dragged);
		e.target.style.border = '';
	}
}, false);






/* --SIDEBAR Y TOOLTIPS-- */
var Dashboard = function () {
    var global = {

        /*tooltipOptions: {
            placement: "right" },*/

        menuClass: ".c-menu" };


    var menuChangeActive = function menuChangeActive(el) {
        var hasSubmenu = $(el).hasClass("has-submenu");
        $(global.menuClass + " .is-active").removeClass("is-active");
        $(el).addClass("is-active");

        // if (hasSubmenu) {
        // 	$(el).find("ul").slideDown();
        // }
    };

    var sidebarChangeWidth = function sidebarChangeWidth() {
        var $menuItemsTitle = $("li .menu-item__title");

        $("body").toggleClass("sidebar-is-reduced sidebar-is-expanded");
        $(".openmenu").toggleClass("is-opened");

        /*if ($("body").hasClass("sidebar-is-expanded")) {
            $('[data-toggle="tooltip"]').tooltip("destroy");
        } else {
            $('[data-toggle="tooltip"]').tooltip(global.tooltipOptions);
        }*/

    };

    return {
        init: function init() {
            $(".js-openM").on("click", sidebarChangeWidth);

            $(".js-menu li").on("click", function (e) {
                menuChangeActive(e.currentTarget);
            });

            /* $('[data-toggle="tooltip"]').tooltip(global.tooltipOptions);*/
        } };

}();

Dashboard.init();

