// var track[0] = document.getElementById('track1');
// var track[1] = document.getElementById('track1');
// var track[2] = document.getElementById('track2');
// var track[3] = document.getElementById('track3');
// var track[4] = document.getElementById('track4');
// var track[5] = document.getElementById('track5');
// var track[6] = document.getElementById('track6');
// var track[7] = document.getElementById('track7');
// var track[8] = document.getElementById('track8');
// var track[9] = document.getElementById('track9');
// var track[10] = document.getElementById('track10');
// var track[11] = document.getElementById('track11');
// var track[12] = document.getElementById('track12');
// var track[13] = document.getElementById('track13');
// var track[14] = document.getElementById('track14');
// var track[15] = document.getElementById('track15');
// var track[16] = document.getElementById('track16');
// var track[17] = document.getElementById('track17');
// var track[18] = document.getElementById('track18');
// var track[19] = document.getElementById('track19');
// var track[20] = document.getElementById('track20');
// var track[21] = document.getElementById('track21');
// var track[22] = document.getElementById('track22');
// var track[23] = document.getElementById('track23');
// var track[24] = document.getElementById('track24');
// var track[25] = document.getElementById('track25');


// Drums
var audio1 = new Audio('Samples/Drums/DRUMS 1.wav');
var audio2 = new Audio('Samples/Drums/DRUMS 2.wav');
var audio3 = new Audio('Samples/Drums/DRUMS 3.wav');
var audio4 = new Audio('Samples/Drums/DRUMS 4.wav');
var audio5 = new Audio('Samples/Drums/DRUMS 5.wav');
// Bass
var audio6 = new Audio('Samples/Basses/BASS 1.wav');
var audio7 = new Audio('Samples/Basses/BASS 2.wav');
var audio8 = new Audio('Samples/Basses/BASS 3.wav');
var audio9 = new Audio('Samples/Basses/BASS 4.wav');
var audio10 = new Audio('Samples/Basses/BASS 5.wav');
//Eff
var audio11 = new Audio('Samples/Effects/EFF 1.wav');
var audio12 = new Audio('Samples/Effects/EFF 2.wav');
var audio13 = new Audio('Samples/Effects/EFF 3.wav');
var audio14 = new Audio('Samples/Effects/EFF 4.wav');
var audio15 = new Audio('Samples/Effects/EFF 5.wav');
//Melody
var audio16 = new Audio('Samples/Melody/MELODY 1.wav');
var audio17 = new Audio('Samples/Melody/MELODY 2.wav');
var audio18 = new Audio('Samples/Melody/MELODY 3.wav');
var audio19 = new Audio('Samples/Melody/MELODY 4.wav');
var audio20 = new Audio('Samples/Melody/MELODY 5.wav');
//Vocal
var audio21 = new Audio('Samples/Vocals/VOCAL 1.wav');
var audio22 = new Audio('Samples/Vocals/VOCAL 2-1.wav');
var audio23 = new Audio('Samples/Vocals/VOCAL 3.wav');
var audio24 = new Audio('Samples/Vocals/VOCAL 4.wav');
var audio25 = new Audio('Samples/Vocals/VOCAL 5.wav');

//Drums
function play1(){
    if (track1.checked == false)
        {
        	//Audio1.play();
        	//Audio1 = new Audio('Samples/Drums/DRUMS 1.wav'); 
			//Audio1.addEventListener('ended', function() {
    			//this.currentTime = 0;
    			//this.play();
			//}, false);

            audio1.play();
            audio1.loop=true;
        }
      else
        {
           audio1.pause();
           audio1.currentTime = 0;
        }
}


function play2(){
    if (track2.checked == false)
      {
            audio2.play();
            audio2.loop=true;
        }
      else
        {
           audio2.pause();
           audio2.currentTime = 0;
        }
}

function play3(){
    if (track3.checked == false)
        {
            audio3.play();
            audio3.loop=true;
        }
      else
        {
           audio3.pause();
           audio3.currentTime = 0;
        }
}

function play4(){
    if (track4.checked == false)
        {
            audio4.play();
            audio4.loop=true;
        }
      else
        {
           audio4.pause();
           audio4.currentTime = 0;
        }
}

function play5(){
    if (track5.checked == false)
        {
            audio5.play();
            audio5.loop=true;
        }
      else
        {
           audio5.pause();
           audio5.currentTime = 0;
        }
}

//Bass
function play6(){
    if (track6.checked == false)
        {
            audio6.play();
            audio6.loop=true;
        }
      else
        {
           audio6.pause();
           audio6.currentTime = 0;
        }
}

function play7(){
    if (track7.checked == false)
        {
            audio7.play();
            audio7.loop=true;
        }
      else
        {
           audio7.pause();
           audio7.currentTime = 0;
        }
}

function play8(){
    if (track8.checked == false)
        {
            audio8.play();
            audio8.loop=true;
        }
      else
        {
           audio8.pause();
           audio8.currentTime = 0;
        }
}

function play9(){
    if (track9.checked == false)
        {
            audio9.play();
            audio9.loop=true;
        }
      else
        {
           audio9.pause();
           audio9.currentTime = 0;
        }
}

function play10(){
    if (track10.checked == false)
        {
            audio10.play();
            audio10.loop=true;
        }
      else
        {
           audio10.pause();
           audio10.currentTime = 0;
        }
}

//Eff

function play11(){
    if (track11.checked == false)
        {
            audio11.play();
            audio11.loop=true;
        }
      else
        {
           audio11.pause();
           audio11.currentTime = 0;
        }
}

function play12(){
    if (track12.checked == false)
        {
            audio12.play();
            audio12.loop=true;
        }
      else
        {
           audio12.pause();
           audio12.currentTime = 0;
        }
}

function play13(){
    if (track13.checked == false)
        {
            audio13.play();
            audio13.loop=true;
        }
      else
        {
           audio13.pause();
           audio13.currentTime = 0;
        }
}

function play14(){
    if (track14.checked == false)
        {
            audio14.play();
            audio14.loop=true;
        }
      else
        {
           audio14.pause();
           audio14.currentTime = 0;
        }
}

function play15(){
    if (track15.checked == false)
        {
            audio15.play();
            audio15.loop=true;
        }
      else
        {
           audio15.pause();
           audio15.currentTime = 0;
        }
}

//Melody
function play16(){
    if (track16.checked == false)
        {
            audio16.play();
            audio16.loop=true;
        }
      else
        {
           audio16.pause();
           audio16.currentTime = 0;
        }
}

function play17(){
    if (track17.checked == false)
        {
            audio17.play();
            audio17.loop=true;
        }
      else
        {
           audio17.pause();
           audio17.currentTime = 0;
        }
}

function play18(){
    if (track18.checked == false)
        {
            audio18.play();
            audio18.loop=true;
        }
      else
        {
           audio18.pause();
           audio18.currentTime = 0;
        }
}

function play19(){
    if (track19.checked == false)
        {
            audio19.play();
            audio19.loop=true;
        }
      else
        {
           audio19.pause();
           audio19.currentTime = 0;
        }
}

function play20(){
    if (track20.checked == false)
        {
            audio20.play();
            audio20.loop=true;
        }
      else
        {
           audio20.pause();
           audio20.currentTime = 0;
        }
}

//Vocals
function play21(){
    if (track21.checked == false)
        {
            audio21.play();
            audio21.loop=true;
        }
      else
        {
           audio21.pause();
           audio21.currentTime = 0;
        }
}

function play22(){
    if (track22.checked == false)
        {
            audio22.play();
            audio22.loop=true;
        }
      else
        {
           audio22.pause();
           audio22.currentTime = 0;
        }
}

function play23(){
    if (track23.checked == false)
        {
            audio23.play();
            audio23.loop=true;
        }
      else
        {
           audio23.pause();
           audio23.currentTime = 0;
        }
}

function play24(){
    if (track24.checked == false)
        {
            audio24.play();
            audio24.loop=true;
        }
      else
        {
           audio24.pause();
           audio24.currentTime = 0;
        }
}

function play25(){
    if (track25.checked == false)
        {
            audio25.play();
            audio25.loop=true;
        }
      else
        {
           audio25.pause();
           audio25.currentTime = 0;
        }
}



