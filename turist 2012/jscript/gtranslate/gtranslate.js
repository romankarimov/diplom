// How to use?
//
// 1. Include this file in <head> ... </head> section
//<script language="JavaScript" src="/pictures/gtranslate/gtranslate.js"></script>
//
// 2. Call ShowTranslate function
// <script>if(ShowTranslate){ShowTranslate(Link, LinkRus, count);}</script>
//
// 3. Set const PathToFlags in function body 
//
// My Template for Parser pages
//# Перевод от гугла, Удаляем строчку "/rus", что бы на русских страницах работала
//$ThisPageURI[^request:uri.match[/rus/][]{/}]
//<div align="center"><script> 
//if(ShowTranslate){ShowTranslate("http://softvoile.com$ThisPageURI","http://softvoile.com/rus$ThisPageURI",6);}
//</script></div>
//</td></tr></table>

// Link - current page url
// LinkRus - possible special link for russian site
// Count - Max count of flags (if you have limited width)
function ShowTranslate(Link, LinkRus, count){

var PathToFlags="jscript/gtranslate/";
//www.google.com/translate?hl=en&ie=UTF8&langpair=en%7Cja&u=http://softvoile.com/
var Pref="http://www.google.com/translate?hl=en&ie=UTF8&langpair=en%7C";

//Можно не указывать линк, тогда определим автоматом, но способ не очень хорощий потому как, с одного перевода во второй уже не перейдешь и ДАЖЕ В АНГЛИЙСКИЙ НЕ ВЕРНЕШСЯ!
// Оставляю данную штуку только для чистого хтмл (онлайн хелп например)  где нет возможности определить урл
if (Link==""){ Link=document.location.href; }

// Линка на русский сайт может быть статической если перевод есть. или генерится как все.
if (LinkRus==""){ LinkRus=Pref+'ru'+'&u='+Link; }

// Name, Url, Img
var aB=new Array(
'English',Link,'gbus.gif',
'German',Pref+'de'+'&u='+Link,'de.gif',
'Francias',Pref+'fr'+'&u='+Link,'fr.gif',
'Espanol',Pref+'es'+'&u='+Link,'es.gif',
'Japanes',Pref+'ja'+'&u='+Link,'jp.gif',
'Russian',LinkRus,'ru.gif',
'Portuguese',Pref+'pt'+'&u='+Link,'pt.gif',
'Italian',Pref+'it'+'&u='+Link,'it.gif',
'Korean',Pref+'ko'+'&u='+Link,'kr.gif'
);

//determine the count of flags for display
var len= (count==undefined) ? 0 : count*3;
if(len==0){len=100}	
if(len>aB.length){len=aB.length}

var st='';
for(i=0;i<len;i+=3){
	st+='<a href="'+aB[i+1]+'" title="'+aB[i]+'" target="_blank" rel="nofollow">'+
  '<img src="'+PathToFlags+aB[i+2]+'" border="0" height="11" width="16" hspace="1" alt="'+aB[i]+'">';

	st+='</a>';
}

document.write(st+'<br><font size="-2">Translate by Google</font>');
}
