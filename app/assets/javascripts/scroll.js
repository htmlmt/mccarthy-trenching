'use strict';

/*
 *  Scroll-triggered animations: http://joshbroton.com/hooking-up-to-the-window-onscroll-event-without-killing-your-performance/
 */

/*
 *  These and other non-jquery functions at https://github.com/joshbroton/you-dont-need-jquery/blob/master/demo/js/not-jquery.js
 *  Let's not use jQuery if at all possible. Thanks!
 */

Element.prototype.listen = function(event, callback) {
    if(this.attachEvent) {
        this.attachEvent("on" + event, function() {callback.call(this);});
    } else if(this.addEventListener) {
        this.addEventListener(event, callback, false);
    }
};

Element.prototype.addClass = function(className) {
    if(this.hasClass(className) == false) {
        this.className += ' ' + className;
    }

}

Element.prototype.removeClass = function(className) {
    if(this.hasClass(className)) {
        var rx = new RegExp('(\\s|^)' + className + '(\\s|$)', 'g');
        this.className = this.className.replace(rx, ' ');
    }
}

Element.prototype.hasClass = function(className) {
    var rx = new RegExp('(\\s|^)' + className + '(\\s|$)');

    if(this.className.match(rx)) {
        return true;
    }

    return false;
}

Element.prototype.toggleClass = function(className) {
    if(this.hasClass(className)) {
        this.removeClass(className);
    } else {
        this.addClass(className);
    }
}

// Fires when scroll
window.onscroll = doOnScroll;

$(document).on("page:load", function(){
    resizeDom();
});

$(document).ready(function(){
    setupDom();
});

$(window).resize(function(){
    resizeDom();
});

function setupDom() {
    // Get all elements that need animation
    var elements = document.querySelectorAll('.news--content, .shows--content, .music--content'),
    // This is a holder for each element object.
        element = {};

    // Loop through NodeList elements and add each element to an object, figure out how far from top of document
    // and add to elements array
    for(var i = 0, len = elements.length; i < len; i++) {
        element = {
            element: elements[i],
            top: getDistanceFromTop(elements[i]),
            bottom: getDistanceFromBottom(elements[i])
        }
        animations.elements.push(element);
    }

    // Run doOnScroll once in case some elements are in viewport onload
    setTimeout(function() { doOnScroll(); }, 1000);
}

function resizeDom() {
    // Refigure offsets when window is resized
    animations.elements.forEach(function(element, index, array) {
        element.top = getDistanceFromTop(element.element);
    });
}

// **********************************************
// Move progress bars based on scroll
// **********************************************
function doOnScroll() {
    animations.testScroll();
}

var animations = {
    iconOffset: 0,
    elements: [],
    testScroll: function () {
        // Determine how far the user has scrolled
        var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
        
        // Loop through array of elements and test each one to see if it's within viewport
        // If so, animate     
        this.elements.forEach(function(element, index, array) {
            var section = $('.section--header')[index];
            
            if (element.top + element.element.offsetHeight < scrollTop + window.innerHeight) {
                section.style.position = 'absolute';
                section.style.bottom = 0;
                section.style.top = 'auto';
            } else if(element.top < scrollTop) {
                section.style.position = 'fixed';
                section.style.top = 0;
                section.style.left = 0;
                element.element.style.marginLeft = 'auto';
            } else if(element.top > scrollTop) {
                section.style.position = 'absolute';
                section.style.top = 0;
                section.style.bottom = 'auto';
            }
        });
    }
};

//Loops through all parent nodes of an element to get it's distance from the top of the document
function getDistanceFromTop(element) {
    var yPos = 0;

    while(element) {
        yPos += (element.offsetTop);
        element = element.offsetParent;
    }

    return yPos;
}

//Loops through all parent nodes of an element to get it's distance from the top of the document
function getDistanceFromBottom(element) {
    var yPos = 0;

    while(element) {
        yPos += (element.offsetTop + element.offsetHeight);
        element = element.offsetParent;
    }

    return yPos;
}