
var au1 = document.getElementById('au1');
var au2 = document.getElementById('au2');
var firstRun = true;
var syncingFeeling;
var isAudioLoaded1 = false;
var isAudioLoaded2 = false;

au1.volume = 1;
au2.volume = 0;

$('#ctlPlay').click( function(){
	if( au1.paused || firstRun ){
		au1.play();
		au2.play();
		$(this).html('Pause');
		$('#ctlVocal').removeClass('disabled');
		$('#ctlInstr').removeClass('disabled');
		if( firstRun ){
			$('#ctlVocal').addClass('active');

		}
		firstRun = false;
		syncingFeeling = setInterval( 'syncTime()', 250 );
	}else{
		au1.pause();
		au2.pause();
		$(this).html('Play');
		$('#ctlVocal').addClass('disabled');
		$('#ctlInstr').addClass('disabled');
		$('#info').html( '' );
		clearInterval( syncingFeeling );
	}
	$('#au1-time').html( au1.currentTime );
	$('#au2-time').html( au2.currentTime );
});


$('#ctlVocal').click( function(){
	au1.volume = 1;
	au2.volume = 0;
	$('#ctlVocal').addClass('active');
	$('#ctlInstr').removeClass('active');
	$('#au1-time').html( au1.currentTime );
	$('#au2-time').html( au2.currentTime );
	firstRun = false;
});

$('#ctlInstr').click( function(){
	au1.volume = 0;
	au2.volume = 1;
	$('#ctlVocal').removeClass('active');
	$('#ctlInstr').addClass('active');
	$('#au1-time').html( au1.currentTime );
	$('#au2-time').html( au2.currentTime );
	firstRun = false;
});



function syncTime(){
	var msg = '';
	if( au1.volume == 1 ){
		au2.currentTime = au1.currentTime;
		msg = 'Now syncing instrumental to vocal';
	}else{
		au1.currentTime = au2.currentTime;
		msg = 'Now syncing vocal to instrumental';
	}
	$('#info').html( msg );
	$('#info').append( "<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vocal currentTime: " + au1.currentTime );
	$('#info').append( "<br />Instrumental currentTime: " + au2.currentTime );
}
