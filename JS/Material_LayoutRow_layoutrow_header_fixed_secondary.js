/* LayoutRow style: */ 

/**
* Função simples para adicionar a class header-scrolled no header quando rolar a barra.
*/
	const select = (el, all = false) => {
	    el = el.trim()
	    if (all) {
	        return [...document.querySelectorAll(el)]
	    } else {
	        return document.querySelector(el)
	    }
	}
	
	window.addEventListener("scroll", function () {
	    var scroll = window.scrollY;
	    let selectHeader = select('.layoutrow-header-fixed')
	    if (scroll > 100) {
	        selectHeader.classList.add('header-scrolled')
	    } else {
	        selectHeader.classList.remove('header-scrolled')
	    }
	});
	
/**/
